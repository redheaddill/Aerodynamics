function [CDo] = ParaDragMidFuse(h,V,c,d,DynVisc,S)%

Q = 1.01;

Fineness = c/d;

[TempRat, PresRat, DensRat, SpeedSound] = ISA(h);

M = V*1.688/SpeedSound;

AirDens = DensRat*2.3769*10^-3; %Slug/ft^3

Re = AirDens*V*1.688*c/DynVisc;

ReCut = 38.21*(c/(2.08*10^(-5)));

if ReCut < Re 
    
    Cf = PerLamFlow*1.328/sqrt(Re)+(1-PerLamFlow)*0.455/((log10(ReCut)^2.58)*(1+0.144*(M)^2)^0.65);

else

    Cf = PerLamFlow*1.328/sqrt(Re)+(1-PerLamFlow)*0.455/((log10(Re)^2.58)*(1+0.144*(M)^2)^0.65);
    
end

FF = (1+60/(Fineness^3)+Fineness/400);

SWet = pi*d*c;

CDo = Cf*FF*Q*SWet/S;

