--min number of steps to solve the level/puzzle
--this might not always be known
_sln_steps=nil
--which puzzle 
_cur_level=nil
--keep track of the player's score per level
_level_score={}

function _init()
    _state:init(_states.play)
end

function _update()
    _state:update()
end

function _draw()
    _state:draw()
end