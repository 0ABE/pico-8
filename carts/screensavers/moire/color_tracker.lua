_ctrack={}

function new_ctrack(index)
    return {
        --rainbow of colors
        rbow={8,9,10,3,11,12,1,2,14,15,7,6,5},
        --rainbow index tracker
        ridx=1,
        --how many lines to draw of the same color
        count=index or 50,
        --the internal counter for incrementing to next color
        cidx=0,

        nxt_color = function(self)
            self.cidx=self.cidx+1
            if (self.cidx==self.count) then
                self.ridx=self.ridx+1
                self.cidx=0
            end
            if (self.ridx==#self.rbow) then self.ridx=1 end
            return self.rbow[self.ridx]
        end
    }
end