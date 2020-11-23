function [CDo] = ParaDragNacelle(h,V,LNacelle,DNacelle,DynVisc,S)
PerLamFlow = 0.1;

Q = 1.5;

Fineness = LNacelle/DNacelle;

[TempRat, PresRat, DensRat, SpeedSound] = ISA(h);

M = V*1.688/SpeedSound;

AirDens = DensRat*2.3769*10^-3; %Slug/ft^3

Re = AirDens*V*1.688*LNacelle/DynVisc;

ReCut = 38.21*(LNacelle/(2.08*10^(-5)));

if ReCut < Re 
    
    Cf = PerLamFlow*1.32824/sqrt(Re)+(1-PerLamFlow)*0.455/((log10(ReCut)^2.58)*(1+0.144*(M)^2)^0.65)

else

    Cf = PerLamFlow*1.32824/sqrt(Re)+(1-PerLamFlow)*0.455/((log10(Re)^2.58)*(1+0.144*(M)^2)^0.65)
    
end

FF = 1 + 0.35/Fineness

SWet = pi*DNacelle*LNacelle

CDo = Cf*FF*Q*SWet/S

end

