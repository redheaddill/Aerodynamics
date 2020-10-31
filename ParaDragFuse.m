function [CDo] = ParaDragFuse(h,V,lCab,lNose,lTail,d,DynVisc,S)%Alt(ft), velocity(kts), CharLength(ft), Dia(ft), Dynamic Visc(Slug/ft-s), Reference Area(ft^2)

PerLamFlow = 0.01;

Q = 1.01;

c = lNose + lTail + lCab;

FinenessRatio = c/d;

[TempRat, PresRat, DensRat, SpeedSound] = ISA(h);

M = V*1.688/SpeedSound;

AirDens = DensRat*2.3769*10^-3; %Slug/ft^3

Re = AirDens*V*1.688*c/DynVisc;

ReCut = 38.21*(c/(2.08*10^(-5)));

if ReCut < Re 
    
    Cf = PerLamFlow*1.32824/sqrt(Re)+(1-PerLamFlow)*0.455/((log10(ReCut)^2.58)*(1+0.144*(M)^2)^0.65);

else

    Cf = PerLamFlow*1.32824/sqrt(Re)+(1-PerLamFlow)*0.455/((log10(Re)^2.58)*(1+0.144*(M)^2)^0.65);
    
end

FF = (1+60/(FinenessRatio^3)+FinenessRatio/400)

SWet = pi*d*lCab+0.75*pi*d*lNose+0.72*pi*d*lTail;

CDo = Cf*FF*Q*SWet/S;

