--default level size is 5 cols x 5 rows

_level1 = {
    --cols=5,rows=5,
    --x_off=0,y_off=0,
    --sel=1,
    steps=1,
    --tiles={8,12,13,14,18},
    board={
    0,0,0,0,0,
    0,0,1,0,0,
    0,1,1,1,0,
    0,0,1,0,0,
    0,0,0,0,0}
}

_level2 = {
    steps=6,
    tiles={1,3,4,5,6,8,10,12,13,14,16,18,19,21,23}
}

_levels = {
    _level1,
    _level2
}
