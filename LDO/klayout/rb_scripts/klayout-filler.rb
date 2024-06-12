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


| DCF | Description
| 1a  | Area between active polygons with spacing greater than 20 should have dummy comp filler.
| 1b  | Min global density: 25%
| 1c  | Staggered array of dummy 5x5 um
| 1d  | Maximum global density: 70%
| 2a  | Adjacent placement space between dummy comp: 3
| 2b  |
| 3   | Stagger both X and Y
| 4   | Space between dcomp and comp: 3.5
| 5   | 
| 6a  |
| 6b  |
| 6c  |
| 6d  |
| 7a  |
| 7b  |
| 7c  |
| 7d  |
| 8a  |
| 8b  |
| 9   |
| 10  |
| 11a |
| 11b |
| 12  |
| 13  |


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
$ndmy_layer     = ly.layer(111, 5)
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


def create_comp_filler_pattern (fc_name, fc_layer)
  create_box_cell fc_name, fc_layer, 2.5
end


def create_poly_filler_pattern (fc_name, fc_layer)
  create_box_cell fc_name, fc_layer, 1.0
end


def create_metal_filler_cell (fc_name, fc_layer)
  create_box_cell fc_name, fc_layer, 1.0
end


##
# Uses the information provided to instantiate a TilingProcessor that gathers
# the valid region that we can use to fill with dummy layers

def create_tiling_processor(top_cell, user_space, layers, tile_size, fc, fc_box, fc_origin)
  # prepare a tiling processor to compute the parts to put into the tiling algorithm
  ly = RBA::CellView::active.layout

  column_step = layers["fc_column_step"]
  row_step =    layers["fc_row_step"]

  puts "Creating Tiling Processor for #{fc.name}"

  tp = RBA::TilingProcessor::new
  tp.frame = user_space
  tp.dbu = ly.dbu
  tp.threads = Etc.nprocessors
  tp.tile_size(tile_size, tile_size)

  # Includes shapes outside the tile when fetching them.
  # Information is considered during computations.
  tp.tile_border(50.0, 50.0)

  #  output(channel_id, object_to_output,     clip_required?)
  tp.output("to_fill", TilingOperator::new(
    ly,
    top_cell,
    fc.cell_index,
    micron2dbu() * fc_box,
    row_step,
    column_step,
    fc_origin && (micron2dbu() * fc_origin))
  )

  # see https://www.klayout.de/doc/about/expressions.html
  queue_command = []
  queue_command.append 'var exclude = Region.new'

  layers.each do |layer_name, layer_content |
    layer_index = layer_content["layer"]
    distance_to_layer = layer_content["distance"]

    tp.input(layer_name, ly, top_cell.cell_index, layer_index)

    queue_command.append "exclude = exclude + #{layer_name}.sized(#{distance_to_layer/ly.dbu})"

  end
  
  queue_command.append "var fill_region = _tile & _frame - exclude"
  queue_command.append "_output(to_fill, fill_region)"

  puts queue_command.join("\n")
  puts "\n"
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
# Takes the description map and tiles dummy layer
# Internally uses a TilingProcessor to compute the valid region to put fillers

def density_filler(layer_information, area)
  ly = RBA::CellView::active.layout
  top_cell = ly.top_cell

  layer_name = layer_information["name"]
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
    fc_origin
  )
  apply_tiling(tp)
end


def main_comp_poly_fill
  padring_width=350
  user_space = RBA::DBox::new(
    0 + padring_width, 
    0 + padring_width, 
    2910 - padring_width, 
    2910 - padring_width
  )

  layer_information_comp_dummy = {
    "name"               => "comp_dummy",
    "layer"              => $comp_dummy_layer,
    "pattern_generator"  => method(:create_comp_filler_pattern),
    "fc_origin"          => RBA::DPoint::new(0.0, 0.0),
    "fc_separation"      => RBA::DPoint::new(1.5, 1.5), # Deprecated, use row_step and column_step instead
    "avoid_layers"       => {
      "comp"     => {
        "layer"    => $comp_layer,
        "distance" => 3.5, # DCF.4
      },
      "poly"     => {
        "layer"    => $poly_layer,
        "distance" => 1.5, # DCF.5
      },
      "nwell"    => {
        "layer"    => $nwell_layer,
        "distance" => 1.3, # DCF.6a
      },
      "dnwell"    => {
        "layer"    => $dnwell_layer,
        "distance" => 4, # DCF.6b
      },
      "lvpwell"  => {
        "layer"    => $lvpwell_layer,
        "distance" => 1.3, # DCF.6c
      },
      "dualgate" => {
        "layer"    => $dualgate_layer,
        "distance" => 1.3, # DCF.6.d
      },
      "res_mk"   => {
        "layer"    => $res_mk_layer,
        "distance" => 3.5, # DCF.8a
      },
      "ndmy"   => {
        "layer"    => $ndmy_layer,
        "distance" => 3.5, # DCF.11a
      },
      "ind_mk"   => {
        "layer"    => $ind_mk_layer,
        "distance" => 3.0, # DCF.12
      },
    }
  }

  # layer_information_poly_dummy = {
  #   "name"               => "poly_dummy",
  #   "layer"              => $poly_dummy_layer,
  #   "pattern_generator"  => method(:create_poly_filler_pattern),
  #   "fc_origin"          => RBA::DPoint::new(0.0, 0.0),
  #   "avoid_layers"       =>  {
  #     "comp"     => {
  #       "layer"    => $comp_layer,
  #       "distance" => 1.0, # ?
  #     },
  #     "poly"     => {
  #       "layer"    => $poly_layer,
  #       "distance" => 1.0, # ?
  #     },
  #     "nwell"    => {
  #       "layer"    => $nwell_layer,
  #       "distance" => 1.0, # ?
  #     },
  #     "m1"       => {
  #       "layer"    => $m1_layer,
  #       "distance" => 1.0, # ?
  #     },
  #     "m2"       => {
  #       "layer"    => $m2_layer,
  #       "distance" => 1.0, # ?
  #     },
  #     "pmndmy"   => {
  #       "layer"    => $pmndmy_layer,
  #       "distance" => 1.0, # ?
  #     },
  #   }
  # }

  density_filler(layer_information_comp_dummy, user_space)

  #density_filler(layer_information_poly_dummy, user_space)
end

##
# Returns a map that fill metal1. Result can be modified to fill each metal

def metal_layer_info
  {
    "name"               => "m1_dummy",
    "layer"              => $m1_dummy_layer,
    "pattern_generator"  => method(:create_metal_filler_cell), # DM.1
    "fc_origin"          => RBA::DPoint::new(0.0, 0.0), # On metals this should be shifted
    "fc_separation"      => RBA::DPoint::new(0.6, 0.6), # Deprecated, use row_step and column_step instead
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


def main_metal_fill
  padring_width=350
  user_space = RBA::DBox::new(
    0 + padring_width, 
    0 + padring_width, 
    2910 - padring_width, 
    2910 - padring_width
  )
  layer_information_dm1 = metal_layer_info
  layer_information_dm2 = metal_layer_info
  layer_information_dm3 = metal_layer_info
  layer_information_dm4 = metal_layer_info
  layer_information_dm5 = metal_layer_info

  layer_information_dm2["name"] = "m2_dummy"
  layer_information_dm2["layer"] = $m2_dummy_layer
  layer_information_dm2["fc_origin"] += RBA::DPoint::new(0.5, 0.5) *  1.0
  layer_information_dm2["avoid_layers"]["m_prev"]["layer"] = $m1_layer
  layer_information_dm2["avoid_layers"]["m_cur"]["layer"]  = $m2_layer
  layer_information_dm2["avoid_layers"]["m_next"]["layer"] = $m3_layer

  layer_information_dm3["name"] = "m3_dummy"
  layer_information_dm3["layer"] = $m3_dummy_layer
  layer_information_dm3["fc_origin"] += RBA::DPoint::new(0.5, 0.5) *  2.0
  layer_information_dm3["avoid_layers"]["m_prev"]["layer"] = $m2_layer
  layer_information_dm3["avoid_layers"]["m_cur"]["layer"]  = $m3_layer
  layer_information_dm3["avoid_layers"]["m_next"]["layer"] = $m4_layer

  layer_information_dm4["name"] = "m4_dummy"
  layer_information_dm4["layer"] = $m4_dummy_layer
  layer_information_dm4["fc_origin"] += RBA::DPoint::new(0.5, 0.5) *  3.0
  layer_information_dm4["avoid_layers"]["m_prev"]["layer"] = $m3_layer
  layer_information_dm4["avoid_layers"]["m_cur"]["layer"]  = $m4_layer
  layer_information_dm4["avoid_layers"]["m_next"]["layer"] = $m5_layer

  layer_information_dm5["name"] = "m5_dummy"
  layer_information_dm5["layer"] = $m5_dummy_layer
  layer_information_dm5["fc_origin"] += RBA::DPoint::new(0.5, 0.5) *  4.0
  layer_information_dm5["avoid_layers"]["m_prev"]["layer"] = $m4_layer
  layer_information_dm5["avoid_layers"]["m_cur"]["layer"]  = $m5_layer
  layer_information_dm5["avoid_layers"].delete("m_next")

  density_filler(layer_information_dm1, user_space)
  density_filler(layer_information_dm2, user_space)
  density_filler(layer_information_dm3, user_space)
  density_filler(layer_information_dm4, user_space)
  density_filler(layer_information_dm5, user_space)
end


def main_expression_test 
    # queue_command = []
    # queue_command.append 'var exclude = "hola"'
    # queue_command.append 'exclude = exclude + " amigos"'
    # queue_command.append 'exclude = exclude + " amigos"'
    # queue_command.append 'exclude = exclude + " amigos"'
    
    # puts queue_command.join("\n")
    # puts RBA::Expression.eval(queue_command.join(";"))
end


main_metal_fill
#main_comp_poly_fill