function [c] = YehudiChord(y)
    
    run AircraftData
    
    Yehudi = Vanguard.Wing.Yehudi;
    Cr = Vanguard.Wing.Cr;
    TaperRatio = Vanguard.Wing.TaperRatio;
    b = Vanguard.Wing.b;

    if y<=Yehudi
        
        c = Cr;
        
    else
        
        c = Cr*(1-(1-TaperRatio)*2*((y-Yehudi)/(b-2*Yehudi)));
        
    end
end

