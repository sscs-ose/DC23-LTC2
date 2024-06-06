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

# Based on this script: https://klayout.de/forum/discussion/550/using-the-fill-tool

=begin
https://gf180mcu-pdk.readthedocs.io/en/latest/physical_verification/design_manual/drm_13.html

# Density Fillers Notes

- COMP, Poly2 and metals has Dummy layers
- COMP is mandatory, control of STI CMP.


## COMP Fill
############

- Layers required to generate:
  - COMP
  - POLY2
  - Nwell
  - LVPWEL
  - Dualgate
  - NDMY
  - RES_MK
  - Pad
  - IND_MK

- Regions that should be avoided:
  - DCF.{6a, 6b, 6c, 6d, 6e}

- RES_MK in resistors avoid generation of dummy COM in those areas.
- RES_MK is necesary for all resistors
- Avoid dummy COMP generation under wells and poly2 resistors
- Use IND_MK on inductors

https://gf180mcu-pdk.readthedocs.io/en/latest/physical_verification/design_manual/drm_13_1.html

- DUMMY features and spacing should be much bigger than lithography and etch capability
- There are 2 rule categories:
  - for drawing
  - for DRC: They have to be considered while drawing also.


## POLY2 Fill
#############

- Layers required to generate:
  - COMP
  - POLY2
  - Nwell
  - Metal1
  - Metal2
  - PMNDMY
- PMNDMY excludes Poly2 generation in any area

https://gf180mcu-pdk.readthedocs.io/en/latest/physical_verification/design_manual/drm_13_2.html

- Should only be generated on customer prime die
- Ensures good process control of device channel length
- Poly2 is added over dummy COMP.


## Metal Fill
#############

- Layers required to generate:
  - metal layers
  - MIM
  - Poly fuse
  - Metal fuse
  - Fuse top
  - Fuse window d
  - Poly2
  - PMNDMY.
  - MTPMK
  - OTP_MK

- “PMNDMY” excludes dummy metal generation

https://gf180mcu-pdk.readthedocs.io/en/latest/physical_verification/design_manual/drm_13_3.html

- Dummy metal effects:
  - improve overal metal density
  - reduce potential dishing issue due to CMP

- Generation
  1. Check metal density in 200x200 um at step of 100um (<30%)
  2. Dummy metal size: 2um x 2um. spacing of 1.2um

- 6um spacing from structures


# In detail DRC revision
#########################

## COMP
#######

### Drawing consideration rules
###############################

- DCF.2a*
Adjacent placement Space between dummy COMP cells: 3

- DCF.3*
Stagger both X and Y direction:  1.6

- DCF.7c*
Space from dummy COMP in frame to any frame cell except non-ET: 10
(valid only for scribe line structures)

### DRC Rules
#############

- DCF.1c
A staggered array of dummy COMP 5x5 um squares is created to cover:
* the prime die (1),
* frame
* SLM Etest patterns
* SLM reliability test patterns.


## POLY
#######




## METAL
########

Dummy metal size: Box of 2x2um. Spacing of 1.2um


| DM |
| 1  | Dummy metal line widgth/length: 2um
| 2a | Min dummy metal line space:     1.2
| 2b | 
| 2c | Min dummy metal top line space:     2.0
| 3  | Min space between dummy and circuit metal: 2.0u
| 4  | Dummy space to subsequent Metal layer (E.g. Dummy M1 to M2): 1u
| 5  | Dummy space to previous Metal layer (E.g. Dummy M2 to M1; Dummy M1 space to Poly2): 1u
| 6  | No overlap of Dummy Metal with the Subsequent Metal layers
| 7  | No overlap of Dummy Metal with the Previous layers
| 8  | 
| 9  | 
Do not use exact replicates of dummy metal fill patterns for
consecutive metal layers to avoid dielectric and metal stress
problems? E.g. the Metal4 dummy metal fill patterns should not be
an exact copy of the Metal3 dummy fill pattern. (Offsets value:)
| 10 | 
 
What's the width/length of metal top? Is the same of metal5?


=end



=begin

# Expressions
#############

- Is a build-in language to perform various tasks, like:
  - distributed operations (tiling) on the layout
  - derive label texts for a ruler

- Semicolon allows to concatenate expressions.

## Basic Data Types
- Numeric, String, Boolean, Array, Undefined/nil
- All RBA objects.
- On booleans, nil and false are considered falsy. i.e. 0 is true.

## Constants
- M_PI, M_E, false, true, nil

## Operations
- A lot of them
- https://www.klayout.de/staging/doc-qt5/about/expressions.html

## Method calls
- shape.box_width = 20

## String Interpolation


# TilingProcessor
#################

- Framework for executing sequences of operations on tiles of a layout(s).
- Distributes tasks, scripts over tiles
- Tiling is optional.
- Tiles can be overlaped. Gather input from neighbor tiles into current tile. (tile_border)
- Based on Regions and Expressions.
  - Regions:
    - Set of polygons. Supports variety of operations, have several states.
  - Expressions: 
    - Built-in lang to form scripts
    - Can access klayout objects and methods
    - Scripts are specified with queue


## TP Input

- Variables that gold a Region object.
- From outside, it's feed with `input(name, ShapeIterator)` method 
- On script, Region is provided through that variable.

Inside the script the following functions are provided:

- Script has pre-defined functions:
  - _dbu: Database units
  - _tile: Region containing a mask for the tile. NIL if no tiling is used
  - _output: Deliver output


## TP Output

- Output of the tiling processor should be received by something.
  - Region
  - Edges, EdgePair
  - TileOutputReceiver
- 

Output can be obtained from the tiling processor by registering a receiver with a channel
A channel is basically a name
Inside the script, the name describes a variable which can be used as the first argument of the "_output" function to identify the channel
A channel is registers using the TilingProcessor#output method
Beside the name, a receiver must be specified
A receiver is either another layout (a cell of that), a report database or a custom receiver implemented through the TileOutputReceiver class.

The "_output" function expects two or three parameters: one channel id (the variable that was defined by the name given in the output method call) and an object to output (a Region, Edges, EdgePairs or a geometrical primitive such as Polygon or Box)
In addition, a boolean argument can be given indicating whether clipping at the tile shall be applied
If clipping is requested (the default), the shapes will be clipped at the tile's box.

## TP Tiling

The tiling can be specified either through a tile size, a tile number or both
If a tile size is specified with the TilingProcessor#tile_size method, the tiling processor will compute the number of tiles required
If the tile count is given (through TilingProcessor#tiles), the tile size will be computed
If both are given, the tiling array is fixed and the array is centered around the original layout's center
If the tiling origin is given as well, the tiling processor will use the given array without any modifications.



# TileOutputReceiver
https://www.klayout.de/staging/doc-qt5/code/class_TileOutputReceiver.html

- Receiver for the Tiling Processor.
- Serves as an "Output Channel" for a Tiling Processor
- 



=end

require 'etc'

# Take the loaded layout and it's top cell to create the fill on
ly = RBA::CellView::active.layout

$comp_layer     = ly.layer(22, 0)
$nwell_layer    = ly.layer(21, 0)
$dnwell_layer   = ly.layer(12, 0)
$lvpwell_layer  = ly.layer(204, 0)
$dualgate_layer = ly.layer(55, 0)
$poly_layer     = ly.layer(30, 0)
$ndmy           = ly.layer(111, 5)
$pmndmy_layer   = ly.layer(152, 5)
$res_mk_layer   = ly.layer(110, 5)
$ind_mk_layer   = ly.layer(151, 5)
$mim_l_mk_layer = ly.layer(117, 10)

$fusetop_layer      = ly.layer(75, 0)
$polyfuse_layer     = ly.layer(220, 0)
$fusewindow_d_layer = ly.layer(96, 1)
$mtp_mk_layer       = ly.layer(122, 5)
$otp_mk_layer       = ly.layer(173, 5)

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


##
# TileOutputReceiver takes a region compiled by TilingProcessor
# TilingOperator takes the region an tiles on a top_cell
# Tiling is done single-threaded

class TilingOperator < RBA::TileOutputReceiver
  def initialize(ly, top_cell, fc_cell_index, fc_box_in_dbu, row_step, column_step, fc_origin_in_dbu)
    @ly = ly
    @top_cell = top_cell
    @fc_cell_index = fc_cell_index
    @fc_box_in_dbu = fc_box_in_dbu
    @row_step = row_step
    @column_step = column_step
    @fc_origin_in_dbu = fc_origin_in_dbu
  end
  def put(ix, iy, tile, obj, dbu, clip)
    # This is the core function. It creates the fill.
    # For details see https://www.klayout.de/doc-qt4/code/class_Cell.html#k_63
    # https://www.klayout.de/staging/doc-qt5/code/class_TileOutputReceiver.html

    # ix, iy: X and Y index of the tile
    # tile:   Tile's box
    # obj:    Object which is delivered
    # dbu:
    # clip:   True if clipping at tile box is requested.

    @row_step = RBA::Point::new(5, 0)# * micron2dbu()
    @column_step = RBA::Point::new(0, 5)# * micron2dbu()
    
    # void fill_region (region, fill_cell_index, fc_box, row_step, column_step, origin)
    @top_cell.fill_region(
      obj,
      @fc_cell_index,
      @fc_box_in_dbu,
      # @row_step,
      # @column_step,
      @fc_origin_in_dbu,
    )
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
  fc_shape_vertical   = RBA::DBox::new( -1, -2.5, 1, 2.5, )
  fc_shape_horizontal = RBA::DBox::new( -2.5, -1, 2.5, 1)

  ly = RBA::CellView::active.layout
  fc = ly.cell(fc_name)
  if ! fc
    fc = ly.create_cell(fc_name)
    fc.shapes(fc_layer).insert(micron2dbu() * fc_shape_vertical)
    fc.shapes(fc_layer).insert(micron2dbu() * fc_shape_horizontal)
  end

  fc
end


def create_box_cell (fc_name, fc_layer, half_width)
  ly = RBA::CellView::active.layout
  
  fc = ly.cell(fc_name)
  if ! fc
    fc = ly.create_cell(fc_name)
    fc_shape = RBA::DBox::new( -half_width, -half_width, half_width, half_width)
    fc.shapes(fc_layer).insert(micron2dbu() * fc_shape)
  end

  fc
end


def create_metal_filler_cell (fc_name, fc_layer)
  create_box_cell fc_name, fc_layer, 1.0
end


def create_metal5_filler_cell (fc_name, fc_layer)
  create_box_cell fc_name, fc_layer, 1.5
end


##
# Uses the information provided to instantiate a TilingProcessor that gathers
# the valid region that we can use to fill with dummy layers

def create_tiling_processor(top_cell, user_space, layers, tile_size, fc, fc_box, distance, fc_origin)
  # prepare a tiling processor to compute the parts to put into the tiling algorithm
  ly = RBA::CellView::active.layout

  puts "Creating Tiling Processor for #{fc.name}"

  tp = RBA::TilingProcessor::new
  tp.frame = user_space
  tp.dbu = ly.dbu
  tp.threads = Etc.nprocessors
  tp.tile_size(tile_size, tile_size)

  # Includes shapes outside the tile when fetching them.
  # Information is considered during computations.
  tp.tile_border(50.0, 50.0)

  queue_command = []

  # TODO: Remove the exclude_string logic
  #queue_command.append 'var exclude = Region.new()'

  exclude_string = ""
  layers.each do |layer_name, layer_content |
    layer_index = layer_content["layer"]
    distance_to_layer = layer_content["distance"]

    # Bind shapes to a variable
    ###########################
    #  input(variable,   ly, cell_index,          layerInfo)
    tp.input(layer_name, ly, top_cell.cell_index, layer_index)

    # Expand elements according to drc rules (not sure which command should be used)
    queue_command.append "#{layer_name} = #{layer_name}.sized(#{distance_to_layer/ly.dbu})"
    #queue_command.append "#{layer_name} = #{layer_name}.sized($(#{distance_to_layer}/_dbu()))"
    #queue_command.append "#{layer_name} = #{layer_name}.sized(#{distance_to_layer} um)"
    #queue_command.append "#{layer_name} = #{layer_name} + #{distance_to_layer} um"

    if exclude_string != ""
      exclude_string = exclude_string + " + "
    end
    exclude_string = exclude_string + "#{layer_name}"
  end

  tp.var("dist", distance / ly.dbu)

  fc_box_in_dbu = micron2dbu() * fc_box
  fc_origin_in_dbu = fc_origin && (micron2dbu() * fc_origin)

  #  output(channel_id, object_to_output,     clip_required?)
  column_step = RBA::DVector::new(0.0, 1.2)
  row_step =    RBA::DVector::new(1.2, 0.0)

  # Can we define the row and column here?
  #tp.output("to_fill", TilingOperator::new(ly, top_cell, fc.cell_index, fc_box_in_dbu, fc_origin_in_dbu))
  tp.output("to_fill", TilingOperator::new(ly, top_cell, fc.cell_index, fc_box_in_dbu, row_step, column_step, fc_origin_in_dbu))

  # perform the computations inside the tiling processor through "expression" syntax
  # see https://www.klayout.de/doc-qt4/about/expressions.html
  # see https://www.klayout.de/doc/about/expressions.html

  # Makes processor to merge all the regions and send result to the
  # output receiver, which draws stuff
  queue_command.append "var exclude = #{exclude_string}"
  queue_command.append "var fill_region = _tile & _frame - exclude.sized(dist)"
  queue_command.append "_output(to_fill, fill_region)"

  puts queue_command.join("\n")
  tp.queue(queue_command.join(";"))

  tp
end

##
# Executes the tiling on a context that makes changes more efficiently

def apply_tiling(tp)
  ly = RBA::CellView::active.layout
  begin
    ly.start_changes
    tp.execute("Tiled fill")
  ensure
    ly.end_changes
  end
end

##
# Takes the description map and compiles a TilingProcessor

def density_filler(layer_information, layer_name, area)
  ly = RBA::CellView::active.layout
  top_cell = ly.top_cell

  fc_creation = layer_information["pattern_generator"]
  layer = layer_information["layer"]
  tile_size = 1000.0 # tile size in micron (?)
  tile_size = 500 # + tile_border
  fc_origin = layer_information["fc_origin"]
  fc_separation = layer_information["fc_separation"]

  fc = fc_creation.call("#{layer_name}_filler", layer)

  tp = create_tiling_processor(
    top_cell,
    area,
    layer_information["avoid_layers"],
    tile_size,
    fc,
    fc.dbbox.enlarged(fc_separation),
    layer_information["distance_to_layers"], # This should not be used
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


comp_avoid_layers = {
  "comp"     => $comp_layer,
  "poly"     => $poly_layer,
  "nwell"    => $nwell_layer,
  "lvpwell"  => $lvpwell_layer,
  "dualgate" => $dualgate_layer,
  "res_mk"   => $res_mk_layer,
  "ind_mk"   => $ind_mk_layer,
}

poly_avoid_layers = {
  "comp"     => $comp_layer,
  "poly"     => $poly_layer,
  "nwell"    => $nwell_layer,
  "m1"       => $m1_layer,
  "m2"       => $m2_layer,
  "pmndmy"   => $pmndmy_layer,
}

layer_information = {}

# layer_information["poly_dummy"] = {
#   "layer"              => $poly_dummy_layer,
#   "distance_to_layers" => 10,
#   "pattern_generator"  => method(:create_cross_pattern_cell),
#   "fc_origin"          => RBA::DPoint::new(0.0, 0.0),
#   "avoid_layers"       => poly_avoid_layers
# }

# layer_information["comp_dummy"] = {
#   "layer"              => $comp_dummy_layer,
#   "distance_to_layers" => 10,
#   "pattern_generator"  => method(:create_cross_pattern_cell),
#   "fc_origin"          => RBA::DPoint::new(0.0, 0.0),
#   "avoid_layers"       => comp_avoid_layers
# }

##
# Returns a map that fill metal1. Result can be modified to fill each metal

def metal_layer_info
  {
    "layer"              => $m1_dummy_layer,
    "distance_to_layers" => 5, # Deprecated: 
    "pattern_generator"  => method(:create_metal_filler_cell),
    "fc_origin"          => RBA::DPoint::new(0.0, 0.0), # On metals this should be shifted
    "fc_separation"      => RBA::DPoint::new(0.6, 0.6), # This should not be used, use row_step and column_step instead
    "fc_row_step"        => RBA::DVector::new(0.0, 1.2), # DM.{2, 10}
    "fc_column_step"     => RBA::DVector::new(1.2, 0.5), # DM.{2, 10}
    "avoid_layers"       => {
      "m_cur"    => {
        "layer"    => $m1_layer,
        "distance" => 2.0, # DM.3
      },
      "m_next"   => {
        "layer"    => $m2_layer,
        "distance" => 1.0, # DM.4
      },
      "m_prev"   => {
        "layer"    => $poly_layer,
        "distance" => 1.0, # DM.5
      },
      "fusetop" => {
        "layer"    => $fusetop_layer,
        "distance" => 6.0, # DM.8
      },
      "polyfuse" => {
        "layer"    => $polyfuse_layer,
        "distance" => 6.0, # DM.8
      },
      "fusewindow_d" => {
        "layer"    => $fusewindow_d_layer,
        "distance" => 6.0, # DM.8
      },
      "pmndmy"   => {
        "layer"    => $pmndmy_layer,
        "distance" => 6.0, # DM.8
      },
      "mtp_mk" => {
        "layer"    => $mtp_mk_layer,
        "distance" => 6.0, # DM.8
      },
      "otp_mk" => {
        "layer"    => $otp_mk_layer,
        "distance" => 6.0, # DM.8
      },
    }
  }
end

layer_information["m1_dummy"] = metal_layer_info
layer_information["m2_dummy"] = metal_layer_info
layer_information["m3_dummy"] = metal_layer_info
layer_information["m4_dummy"] = metal_layer_info
layer_information["m5_dummy"] = metal_layer_info

layer_information["m2_dummy"]["layer"] = $m2_dummy_layer
layer_information["m2_dummy"]["fc_origin"] += RBA::DPoint::new(0.5, 0.5) *  1.0
layer_information["m2_dummy"]["avoid_layers"]["m_prev"]["layer"] = $m1_layer
layer_information["m2_dummy"]["avoid_layers"]["m_cur"]["layer"]  = $m2_layer
layer_information["m2_dummy"]["avoid_layers"]["m_next"]["layer"] = $m3_layer

layer_information["m3_dummy"]["layer"] = $m3_dummy_layer
layer_information["m3_dummy"]["fc_origin"] += RBA::DPoint::new(0.5, 0.5) *  2.0
layer_information["m3_dummy"]["avoid_layers"]["m_prev"]["layer"] = $m2_layer
layer_information["m3_dummy"]["avoid_layers"]["m_cur"]["layer"]  = $m3_layer
layer_information["m3_dummy"]["avoid_layers"]["m_next"]["layer"] = $m4_layer

layer_information["m4_dummy"]["layer"] = $m4_dummy_layer
layer_information["m4_dummy"]["fc_origin"] += RBA::DPoint::new(0.5, 0.5) *  3.0
layer_information["m4_dummy"]["avoid_layers"]["m_prev"]["layer"] = $m3_layer
layer_information["m4_dummy"]["avoid_layers"]["m_cur"]["layer"]  = $m4_layer
layer_information["m4_dummy"]["avoid_layers"]["m_next"]["layer"] = $m5_layer

layer_information["m5_dummy"]["layer"] = $m5_dummy_layer
layer_information["m5_dummy"]["fc_origin"] += RBA::DPoint::new(0.5, 0.5) *  4.0
layer_information["m5_dummy"]["avoid_layers"]["m_prev"]["layer"] = $m4_layer
layer_information["m5_dummy"]["avoid_layers"]["m_cur"]["layer"]  = $m5_layer
layer_information["m5_dummy"]["avoid_layers"].delete("m_next")
layer_information["m5_dummy"]["pattern_generator"] = method(:create_metal5_filler_cell)
layer_information["m5_dummy"]["fc_separation"] = RBA::DPoint::new(1.0, 1.0)

# density_filler(layer_information["poly_dummy"], "poly_dummy", user_space)
# density_filler(layer_information["comp_dummy"], "comp_dummy", user_space)
density_filler(layer_information["m1_dummy"], "m1_dummy", user_space)
density_filler(layer_information["m2_dummy"], "m2_dummy", user_space)
density_filler(layer_information["m3_dummy"], "m3_dummy", user_space)
density_filler(layer_information["m4_dummy"], "m4_dummy", user_space)
density_filler(layer_information["m5_dummy"], "m5_dummy", user_space)

# queue_command = []
# queue_command.append 'var exclude = "hola"'
# queue_command.append 'exclude = exclude + " amigos"'
# queue_command.append 'exclude = exclude + " amigos"'
# queue_command.append 'exclude = exclude + " amigos"'

# puts queue_command.join("\n")
# puts RBA::Expression.eval(queue_command.join(";"))