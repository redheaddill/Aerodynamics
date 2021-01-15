function [c] = YehudiChord(y,Yehudi,Cr,TaperRatio,b)
    
    if y<=Yehudi
        
        c = Cr;
        
    else
        
        c = Cr*(1-(1-TaperRatio)*2*((y-Yehudi)/(b-2*Yehudi)));
        
    end
end

