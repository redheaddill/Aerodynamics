function [WingPlanformX,WingPlanformY,Chord,Wing_Span,Cr,Ct] = PlanformGenerator(SurfaceArea,Span,gammaLE,gammaTE,RootChord,crank_location,crank_angle)
%PLANFORM GENERATOR
%OCdt Wells, RF 28125; Aero Class of 2020
%This function generates the planform of the wing, so that it can be used to find the chords at each wing station, and to generate a plot for the user.
%It also generates a vector of chords at each wing station.

WingLEx = zeros(1,100);
WingTEx = zeros(1,100);
WingLEy = zeros(1,100);
WingTEy = zeros(1,100);

x = 0;
location = 0;
for i = 1:101
    location = i*((Span/2)/100)-(Span/2)/100;
    x = -location*tand(gammaLE);
    WingLEx(1,i) = x;
    WingLEy(1,i) = location;
end

location = 0;
for i = 1:101
    location = i*((Span/2)/100)-(Span/2)/100;
    x = location*tand(gammaTE)-RootChord;
    WingTEx(1,i) = x;
    WingTEy(1,i) = location;
end

place = crank_location*100;
increment = (WingTEy(1,2)-WingTEy(1,1))*tand(crank_angle);
for i = place:-1:2
    WingTEx(1,i-1) = WingTEx(1,i)-increment;
end

%Surface Area Calculation/Iterative Planform Scaling
S = 4000;
Chord = zeros(1,100);
while S > SurfaceArea
    S = 0;
    for i = 1:length(WingTEx)
        WingTEx(1,i) = WingTEx(1,i)/1.001;
    end
    for i = 1:length(WingTEy)
        WingLEy(1,i) = WingLEy(1,i)/1.009;
        WingTEy(1,i) = WingTEy(1,i)/1.009;
    end
    for i = 1:length(WingLEx)
        Chord(1,i) = WingLEx(1,i)-WingTEx(1,i);
    end
    for i = 1:(length(Chord)-1)
        S = S + Chord(1,i) * (WingLEy(1,2)-WingLEy(1,1));
    end
    S = S*2;
end

%First Wing Planform Creation
WingPlanformX = [WingLEx fliplr(WingTEx) WingLEx(1,1)];
WingPlanformY = [WingLEy fliplr(WingTEy) WingLEy(1,1)];  

Wing_Span = WingLEy(1,length(WingLEy))*2;

Cr = WingLEx(1,1)-WingTEx(1,1);
Ct = WingLEx(1,length(WingLEx)) - WingTEx(1,length(WingTEx));

end

