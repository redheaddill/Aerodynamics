function [CDo] = WingZeroLiftDrag(V,Q,TaperRatio,DynVisc,SweepQuartC,S,AR,b,h,LocMaxT,Df,PerLamFlow,Tmax)
%Q = 1.01 %For HIGH or MID wing

[TempRat, PresRat, DensRat, SpeedSound] = ISA(h);
AirDens = DensRat*2.3769*10^-3; %Slug/ft^3
V=V*1.688
M = V/SpeedSound


Cr = 2*S/(b*(1+TaperRatio))
Cmac = 2/3*((1+TaperRatio+TaperRatio^2)/(1+TaperRatio))*Cr
Ymac = b/6*((1+2*TaperRatio)/(1+TaperRatio))
SweepMaxT = atand(tand(SweepQuartC)-4/AR*((LocMaxT-0.25)*(1-TaperRatio)/(1+TaperRatio)))
Cf = Cr*(1-(1-TaperRatio)*2*Df/2/b)
Sexp = S-(Cf+Cr)/2*Df

Re = AirDens*V*1.688*Cmac/DynVisc
    
SweepMaxT = atand(tand(SweepQuartC)-4/AR*((LocMaxT-0.25)*(1-TaperRatio)/(1+TaperRatio)))

%Calc Zero Lift Drag
Re = AirDens*V*1.688*Cmac/DynVisc;
ReCut = 38.21*(Cmac/(2.08*10^(-5))); %Smooth Paint surface roughness
if ReCut < Re
    Cf = PerLamFlow*1.32824/sqrt(Re)+(1-PerLamFlow)*0.455/((log10(ReCut)^2.58)*(1+0.144*(M)^2)^0.65);
else
    Cf = PerLamFlow*1.32824/sqrt(Re)+(1-PerLamFlow)*0.455/((log10(Re)^2.58)*(1+0.144*(M)^2)^0.65);
end
FF = (1+0.6*Tmax/LocMaxT+100*Tmax^4)*(1.34*M^(0.18)*(cosd(SweepMaxT)^(0.28)))
Swet = (1.977+0.52*Tmax)*Sexp
CDo = Cf*FF*Q*Swet/S

end

