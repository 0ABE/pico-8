function new_line(pt1,pt2,color)
    return {
        pt1=pt1 or 0,
        pt2=pt2 or 0,
        color=color or 0,

        step = function(self)
            self.pt1:step()
            self.pt2:step()
        end,

        draw = function(self,color)
            self.color=color or self.color
            line(self.pt1.x,self.pt1.y,self.pt2.x,self.pt2.y,self.color)
        end
    }
end
