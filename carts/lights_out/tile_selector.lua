--player interactivity: which tile is selected
_sel={}

function _sel:init()
    self.idx=1
    self.spr=2
end

--show the user which tile is active
function _sel:select(idx)
    self.idx=idx
end

function _sel:draw()
    --draw the selected sprite using the x,y values of the tile
    spr(self.spr,_tiles[self.idx].gfx.x,_tiles[self.idx].gfx.y)
end