import pya
from cells.draw_fet import draw_pfet

# Get the current layout view
layout_view = pya.LayoutView.current()

# Check if the layout view is valid
if layout_view is None:
    raise Exception("No layout view is active. Open a GDS file in the KLayout viewer.")

# Get the current layout directly
layout = layout_view.active_cellview().layout()

# Get the top cell of the currently opened GDS file
top_cell = layout.top_cell()

############################################

path = [[1,1,0,1,0,0,1,0,0,1],[0,1,1,0,0,1,1,1,0,1]]

x = 4*1000   # separacion en x
y = 3.5*1000   # separacion en y

sep_ds=x-1920

width=380

X = 0.40800*1000
Y = 0.57800*1000

dl_x=X+1000+270
dl_y=Y+310

layer_number = 36
layer = layout.layer(layer_number, 0)

#box = pya.Box(pya.DPoint(dl_x,dl_y-1300), pya.DPoint(dl_x+x+sep_ds+width, dl_y-1300+width))
#top_cell.shapes(layer).insert(box)

c=0
for j in reversed(path):
  temp1=0
  prev2=0
  for i in range(len(j)-1):
    r = j[i]
    r_sig = j[i+1]
    if(r==r_sig):
      pos = i
      box = pya.Box(pya.DPoint(dl_x+x*pos,dl_y+y*c), pya.DPoint(dl_x+sep_ds+width+x*pos, dl_y+width+y*c))
      top_cell.shapes(layer).insert(box)
    else:
      if temp1==1:
        temp1=0
        box = pya.Box(pya.DPoint(dl_x+x*prev,dl_y-1300+y*c), pya.DPoint(dl_x+x*(prev+(i-prev))+sep_ds+width, dl_y-1300+width+y*c))
        top_cell.shapes(layer).insert(box)
        prev2=i
      else:
        prev=i
        temp1=1
        if prev2!=0:
          box = pya.Box(pya.DPoint(dl_x+x*prev2,dl_y-1900+y*c), pya.DPoint(dl_x+x*(prev2+(i-prev2))+sep_ds+width, dl_y-1900+width+y*c))
          top_cell.shapes(layer).insert(box)
  c+=1