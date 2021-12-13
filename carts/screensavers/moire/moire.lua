_trail={}

--https://stackoverflow.com/questions/640642/how-do-you-copy-a-lua-table-by-value
function copy(obj, seen)
    if type(obj) ~= 'table' then return obj end
    if seen and seen[obj] then return seen[obj] end
    local s = seen or {}
    local res = setmetatable({}, getmetatable(obj))
    s[obj] = res
    for k, v in pairs(obj) do res[copy(k, s)] = copy(v, s) end
    return res
  end

--https://www.lexaloffle.com/bbs/?tid=29397
--random number between inclusive (bi) low (l) and high (h)
function randbi(l,h) --inclusive
    return flr(rnd(h+1-l))+l
end

function _init()
    --clear the screen once
    cls()
    --make the new trail with max length
    _trail=new_trail(25,5)

    --make the new line from 2 points
    local pt1=new_point(flr(rnd(127)),flr(rnd(127)),randbi(2,5),randbi(2,5))
    local pt2=new_point(flr(rnd(127)),flr(rnd(127)),randbi(2,5),randbi(2,5))
    local line=new_line(pt1,pt2,0)

    --add the line to the trail
    _trail:add(line)
end

function _update()
    _trail:update()
end

function _draw()
    _trail:draw()
end