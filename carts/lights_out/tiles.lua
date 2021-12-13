--array for the game board
_tiles={}
--default size of game board (in tiles)
_cols=5
_rows=5
--default x and y offsets
_x_off=0
_y_off=0
--tile sizes
_wd=8 --width
_ht=8 --height

function _tiles:init(level_num)
    --set the current level
    _cur_level=level_num
    --get the level from the array of levels
    local level=_levels[level_num]
    --get min number of steps to solve (if known)
    if (level.steps) then _sln_steps=level.steps end
    local idx=0  --index of the game board tile
    local tidx=1 --index into the level tiles array
    --use level values if defined
    if (level.cols) then _cols=level.cols end
    if (level.rows) then _rows=level.rows end
    --use level values if defined
    if (level.x_off) then _x_off=level.x_off end
    if (level.y_off) then _y_off=level.y_off end
    --init tiles by each col per row
    for i=1,_rows do
        for j=1,_cols do
            idx=idx+1
            --init a tile array
            local tile={}
            tile.idx=idx
            tile.vis=false
            --prefer to use the tiles field
            if (level.tiles) then
                --check if the value of tiles[tidx] matches 
                --our board index
                if (level.tiles[tidx] == idx) then 
                    tile.vis=true
                    -- tidx was used so go to the next
                    tidx=tidx+1
                end
            --otherwise use the board field
            elseif (level.board[tile.idx]>0) then 
                tile.vis=true 
            end

            --init a graphics array
            tile.gfx={}
            --top left corner (x,y)
            tile.gfx.x=j*_wd-_wd+_x_off
            tile.gfx.y=i*_wd-_wd+_y_off
            --bottom right corner (x2,y2)
            tile.gfx.x2=tile.gfx.x+_wd
            tile.gfx.y2=tile.gfx.y+_wd
            --pick the sprite based on visibility
            if (tile.vis) then tile.gfx.spr=1
            else tile.gfx.spr=0 end

            add(_tiles, tile)

            --set which tile starts out selected
            if (level.sel and level.sel==idx) then 
                _sel:select(idx)
            end
        end
    end
end

--performs the action of toggling tiles on/off
function _tiles:toggle(idx)
    local n=north(idx)
    local e=east(idx)
    local s=south(idx)
    local w=west(idx)
    local near={n,e,s,w}
    --toggle this tile (located at idx)
    self[idx].vis=not self[idx].vis
    --update the graphics
    if (self[idx].vis) then self[idx].gfx.spr=1
    else self[idx].gfx.spr=0 end
    --toggle neighbors (n,e,s,w)
    for i=1,#near do
        --check if there's a valid neighbor in this direction
        if (near[i]) then
            --toggle the neighbor
            self[near[i]].vis=not self[near[i]].vis
            --update the neighbor graphics
            if (self[near[i]].vis) then self[near[i]].gfx.spr=1
            else self[near[i]].gfx.spr=0 end
        end
    end
end

--get the tile index to the north
function north(idx)
    local n
    if idx<=_cols then n=nil
    else  n=idx-_cols end
    return n
end

--get the tile index to the south
function south(idx)
    --last row min/max values (don't need max)
    --local max=cols*rows
    local s
    local min=(_cols*_rows)-_cols+1
    if idx>=min then s=nil
    else s=idx+_cols end
    return s
end

--get the tile index to the west
function west(idx)
    local w=idx-1
    local c1,r1=tileCoord(idx)
    local c2,r2=tileCoord(w)
    if c1==nil or c2==nil then w=nil
    else if c2>c1 then w=nil end end
    return w
end

--get the tile index to the east
function east(idx)
    local e=idx+1
    local c1,r1=tileCoord(idx)
    local c2,r2=tileCoord(e)
    if c1==nil or c2==nil then e=nil
    else if c2<c1 then e=nil end end
    return e
end

-- return col,row tile coord for any idx
function tileCoord(idx)
    local c,r
    if idx<=_cols then
        r=1
        if idx<1 then c=nil
        else c=idx end
    else
        r=flr(idx/_cols)
        if idx%_cols>0 then r=r+1 end
        c=idx-((r-1)*_cols)
    end
    return c,r
end

function _tiles:draw()
    for i=1,#self do
        spr(self[i].gfx.spr,self[i].gfx.x,self[i].gfx.y)
        --rect(_tiles[i].gfx.x,_tiles[i].gfx.y,_tiles[i].gfx.x2,_tiles[i].gfx.y2,4)
    end
end