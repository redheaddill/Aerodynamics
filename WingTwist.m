function [AoAChange] = WingTwist(y)

    run AircraftData;
    
    b = Vanguard.Wing.b;

    ZeroLiftAngle = Vanguard.Wing.Airfoil.ZeroLiftAngle;

    GeoTwist = Vanguard.Wing.GeoTwist;

    AoAChange = (GeoTwist/2-y/(b/2)*(GeoTwist) - ZeroLiftAngle)*pi/180;
    
end

