% Cm(wing) vs V trade study for Antoine
run master_data.m

% First comment out every surface except the wing in VLM 
% (and make sure to uncomment the rest after)

M = 0:0.08:0.8;
alt = 0;
xCG = 43.5; %he wants the moment around the 0.4c (0.25c is at 41ft, cr = 16.69ft)
zCG = acftdata.general.zCG;
Sw = acftdata.wing.S;
mac = acftdata.wing.mac;

for i= 1:length(M)
    Vft(i) = M(i)*speedSound(alt); %V in ft/s
    Vkt(i) = Vft(i)/1.688; %V in kts
    Cmw(i) = Vanguard_VLM(M(i),0,0,0,0,0,0,0,xCG,zCG); %Cm around the quarter chord
    m(i) = Cmw(i)*0.5*0.0023769*sigma(alt)*Vft(i)^2*Sw*mac; %dimensionalized moment
end

figure()
hold on
plot(Vkt,m,'-b')
ax = gca();
ax.YRuler.Exponent = 0;
xlabel('V [kts]')
ylabel('Wing moment around 0.4c [ft*lb_{f}]')
grid on
box on


    


