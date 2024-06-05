# Copyright 2024 Chip USM - UTFSM
# Developed by: Aquiles Viza
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'etc'

# Take the loaded layout and it's top cell to create the fill on
ly = RBA::CellView::active.layout

$poly_layer    = ly.layer(30, 0)
$comp_layer    = ly.layer(22, 0)

$m1_layer   = ly.layer(34, 0)
$m2_layer   = ly.layer(36, 0)
$m3_layer   = ly.layer(42, 0)
$m4_layer   = ly.layer(46, 0)
$m5_layer   = ly.layer(81, 0)

$contact_layer = ly.layer(33, 0)
$via1_layer    = ly.layer(35, 0)
$via2_layer    = ly.layer(38, 0)
$via3_layer    = ly.layer(40, 0)
$via4_layer    = ly.layer(41, 0)


$comp_dummy_layer = ly.layer(22, 4)
$poly_dummy_layer = ly.layer(30, 4)
$m1_dummy_layer   = ly.layer(34, 4)
$m2_dummy_layer   = ly.layer(36, 4)
$m3_dummy_layer   = ly.layer(42, 4)
$m4_dummy_layer   = ly.layer(46, 4)
$m5_dummy_layer   = ly.layer(81, 4)


# TilingOperator will receive the regions to tile
# Is driven single-threaded since tiling function isn't thread safe
class TilingOperator < RBA::TileOutputReceiver
  def initialize(ly, top_cell, *fill_args)
    @ly = ly
    @top_cell = top_cell
    @fill_args = fill_args
  end
  def put(ix, iy, tile, obj, dbu, clip)
    # This is the core function. It creates the fill.
    # For details see https://www.klayout.de/doc-qt4/code/class_Cell.html#k_63
    # https://www.klayout.de/staging/doc-qt5/code/class_TileOutputReceiver.html
    @top_cell.fill_region(obj, *@fill_args)
  end
end


def micron2dbu()
  ly = RBA::CellView::active.layout
  RBA::CplxTrans::new(ly.dbu).inverted
end


def create_fill_cell (fc_name, fc_layer, fc_width)
  fc_shape = RBA::DBox::new(
    -(fc_width)/2, 
    -(fc_width)/2, 
    (fc_width)/2, 
    (fc_width)/2
  )
  
  ly = RBA::CellView::active.layout
  fc = ly.cell(fc_name)
  if ! fc
    fc = ly.create_cell(fc_name)
    fc_shape_in_dbu = micron2dbu() * fc_shape
    fc.shapes(fc_layer).insert(fc_shape_in_dbu)
  end

  fc
end


def create_cross_pattern_cell (fc_name, fc_layer)
  fc_shape_vertical = RBA::DBox::new(
    -1,
    -2.5,
    1,
    2.5,
  )

  fc_shape_horizontal = RBA::DBox::new(
    -2.5,
    -1,
    2.5,
    1,
  )

  ly = RBA::CellView::active.layout
  fc = ly.cell(fc_name)
  if ! fc
    fc = ly.create_cell(fc_name)
    fc.shapes(fc_layer).insert(micron2dbu() * fc_shape_vertical)
    fc.shapes(fc_layer).insert(micron2dbu() * fc_shape_horizontal)
  end

  fc
end


def create_tiling_processor(top_cell, user_space, layers, tile_size, fc, fc_box, distance, fc_origin)
  # prepare a tiling processor to compute the parts to put into the tiling algorithm
  # this can be tiled
  ly = RBA::CellView::active.layout

  tp = RBA::TilingProcessor::new
  tp.frame = user_space
  tp.dbu = ly.dbu
  tp.threads = Etc.nprocessors
  tp.tile_size(tile_size, tile_size)

  queue_string = ""
  layers.each do |layer_name, layer_index |
    tp.input(layer_name, ly, top_cell.cell_index, layer_index)
    if queue_string != ""
      queue_string = queue_string + " + "
    end
    queue_string = queue_string + "#{layer_name}"
  end

  tp.var("dist", distance / ly.dbu)

  fc_box_in_dbu = micron2dbu() * fc_box
  fc_origin_in_dbu = fc_origin && (micron2dbu() * fc_origin)

  tp.output("to_fill", TilingOperator::new(ly, top_cell, fc.cell_index, fc_box_in_dbu, fc_origin_in_dbu))

  # perform the computations inside the tiling processor through "expression" syntax
  # (see https://www.klayout.de/doc-qt4/about/expressions.html)
  queue_command = [
    "var exclude = #{queue_string};", 
    "var fill_region = _tile & _frame - exclude.sized(dist);",
    "_output(to_fill, fill_region)"
  ].join()

  puts queue_command
  tp.queue(queue_command)

  tp
end


def apply_tiling(tp)
  ly = RBA::CellView::active.layout
  begin
    ly.start_changes   # makes the layout handle many changes more efficiently
    tp.execute("Tiled fill")
  ensure
    ly.end_changes
  end
end


def density_filler(layer_information, layer_name, area)
  ly = RBA::CellView::active.layout
  top_cell = ly.top_cell

  fc_creation = layer_information["m1_dummy"]["pattern_generator"]
  layer = layer_information[layer_name]["layer"]
  tile_size = 1000.0 # tile size in micron (?)
  tile_size = 30 # ?
  fc_origin = nil # Enhanced fill use

  fc = fc_creation.call("#{layer_name}_filler", layer)

  tp = create_tiling_processor(
    top_cell,
    area,
    layer_information[layer_name]["avoid_layers"],
    tile_size,
    fc,
    fc.dbbox,
    layer_information[layer_name]["distance_to_layers"],
    fc_origin
  )
  apply_tiling(tp)
end


padring_width=350
user_space = RBA::DBox::new(
  0 + padring_width, 
  0 + padring_width, 
  2910 - padring_width, 
  2910 - padring_width
)


layer_information = {}

layer_information["poly_dummy"] = {
  "layer"              => $poly_dummy_layer,
  "distance_to_layers" => 10,
  "pattern_generator"  => method(:create_cross_pattern_cell),
  "avoid_layers"       => {
    "comp"    => $comp_layer,
    "poly"    => $poly_layer,
    "contact" => $contact_layer
  }
}

layer_information["comp_dummy"] = {
  "layer"              => $comp_dummy_layer,
  "distance_to_layers" => 10,
  "pattern_generator"  => method(:create_cross_pattern_cell),
  "avoid_layers"       => {
    "comp"    => $comp_layer,
    "poly"    => $poly_layer,
    "contact" => $contact_layer
  }
}

layer_information["m1_dummy"] = {
  "layer"              => $m1_dummy_layer,
  "distance_to_layers" => 0.5,
  "pattern_generator"  => method(:create_cross_pattern_cell),
  "avoid_layers"       => {
    "contact" => $contact_layer,
    "m1"      => $m1_layer,
    "via1"    => $via1_layer
  }
}

layer_information["m2_dummy"] = {

  "layer"              => $m2_dummy_layer,
  "distance_to_layers" => 0.5,
  "pattern_generator"  => method(:create_cross_pattern_cell),
  "avoid_layers"       => {
    "via1"  => $via1_layer,
    "m2"    => $m2_layer,
    "via2"  => $via2_layer
  }
}

density_filler(layer_information, "poly_dummy", user_space)
density_filler(layer_information, "comp_dummy", user_space)
density_filler(layer_information, "m1_dummy", user_space)
density_filler(layer_information, "m2_dummy", user_space)
