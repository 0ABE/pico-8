--min number of steps to solve the level/puzzle
--this might not always be known
_sln_steps=nil
--which puzzle 
_cur_level=nil
--keep track of the player's steps per level
_cur_score=0

function _init()
    --setup the tile selector
    _sel:init()
    --setup up the board
    _tiles:init(2) --start with puzzle number
    --override the tile selected by the level
    --_sel:select(1)
    
end

function _update()
    local next_sel=nil
    --player wants to move to a different tile
    if (btnp(0)) then next_sel=west(_sel.idx) end
    if (btnp(1)) then next_sel=east(_sel.idx) end
    if (btnp(2)) then next_sel=north(_sel.idx) end
    if (btnp(3)) then next_sel=south(_sel.idx) end
    --player moved to a new tile so select it
    if (next_sel) then _sel:select(next_sel) end
    --player wants to toggle the current tile on/off
    if (btnp(4) or btnp(5)) then _tiles:toggle(_sel.idx) end
end
    
function _draw()
    rectfill(0,0,127,127,0)
    _tiles:draw()
    _sel:draw()
end