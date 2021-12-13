function new_trail(maxlen,maxcolors)
    return {
        --how many lines in the trail. 50 by default
        maxlen=maxlen or 50,
        --color tracker
        ctrack=new_ctrack(maxcolors or maxlen),
        --store the lines here
        lines={},

        add = function(self, line)
            line.color=self.ctrack:nxt_color()
            add(self.lines, line)
        end,

        --update by adding a new line to the tail
        --and deleting a line from the head
        update = function(self)
            --make it seem like it's falling down
            --print("")

            local line=copy(self.lines[#self.lines])
            line:step()
            self:add(line)
        
            if (#self.lines>maxlen) then
                del(self.lines,self.lines[1])
            end
        end,

        draw = function(self)
            -- draw the newest line
            self.lines[#self.lines]:draw()
            -- "undraw" or "overdraw" the oldest line
            self.lines[1]:draw(0)
        end
    }
end
