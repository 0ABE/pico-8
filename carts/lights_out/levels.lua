--default level size is 5 cols x 5 rows

_demo_level = {
    --cols=5,rows=5,
    --x_off=0,y_off=0,
    sel=13,
    steps=1,
    --tiles={8,12,13,14,18},
    board={
    0,0,0,0,0,
    0,0,1,0,0,
    0,1,1,1,0,
    0,0,1,0,0,
    0,0,0,0,0}
}

_level1 = {steps=6,tiles={11,13,15}}
_level2 = {steps=6,tiles={1,3,5,6,8,10,16,18,20,21,23,25}}
_level3 = {steps=6,tiles={2,4,6,7,9,10,11,12,14,15,16,17,19,20,22,24}}
_level4 = {steps=6,tiles={6,7,9,10,16,20,21,22,24,25}}


_levels = {
    _level1,_level2,_level3,_level4
}
