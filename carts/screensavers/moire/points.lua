function new_point(x,y,dx,dy)
    return {
        x=x or 0,
        y=y or 0,
        dx=dx or 0,
        dy=dy or 0,

        step = function(self)
            self.x=self.x+self.dx
            self.y=self.y+self.dy
            if (self.x<1 or self.x>126) then self.dx=self.dx*-1 end
            if (self.y<1 or self.y>126) then self.dy=self.dy*-1 end
        end
    }
end