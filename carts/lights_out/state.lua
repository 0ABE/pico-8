_states={menu=1,play=2,over=3}
_state={}

function _state:init(st)
    self.st=st or _states.menu
    if (self.st==_states.menu) then init_menu()
    elseif (self.st==_states.play) then init_game()
    elseif (self.st==_states.over) then init_over()
    end
end

function _state:update()
    if (self.st==_states.menu) then update_menu()
    elseif (self.st==_states.play) then update_game()
    elseif (self.st==_states.over) then update_over()
    end
end

function _state:draw()
    if (self.st==_states.menu) then draw_menu()
    elseif (self.st==_states.play) then draw_game()
    elseif (self.st==_states.over) then draw_over()
    end
end

function init_game()
    --setup the tile selector
    _sel:init()
    --setup up the board
    _tiles:init(4) --start with puzzle number
    --override the tile selected by the level
    --_sel:select(1)
end

function update_game()
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

function draw_game()
    rectfill(0,0,127,127,0)
    _tiles:draw()
    _sel:draw()
end