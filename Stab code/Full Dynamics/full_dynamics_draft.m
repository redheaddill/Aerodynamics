run master_data.m

% Inputs
alt = 25000; %ft
V = 250*1.688; %ft/s
xCG = 41.75; %ft

zCG = acftdata.general.zCG;
CD0 = acftdata.general.CD0;
M = V/speedSound(alt);
Q = 0.5*0.0023769*sigma(alt)*V^2;
[a,de] = trimfn(alt,V,xCG);
Sw = acftdata.wing.S;
cw = acftdata.wing.mac;
W = acftdata.general.weight;
Ixx = acftdata.general.Ixx;
Iyy = acftdata.general.Iyy;
Izz = acftdata.general.Izz;
Ixz = acftdata.general.Ixz;
g = 32.2;
theta_0 = 0;

% Slope calculation setup
M1 = M; 
M2 = M+0.01;
a1 = 0; %deg
a2 = 1; %deg
de1 = 0; %deg
de2 = 1; %deg
q1 = 0; %rad/s
q2 = 0.0175; %rad/s
B1 = 0; %deg
B2 = 1; %deg

% % CD CL Cm
% [CDi,CL,Cm,~,~,~] = Vanguard_VLM(M,a,0,de,0,0,0,0,xCG,zCG);
% CD = CD0+CDi;
% 
% % M derivatives
% [CD1,CL1,Cm1,~,~,~] = Vanguard_VLM(M1,0,0,0,0,0,0,0,xCG,zCG);
% [CD2,CL2,Cm2,~,~,~] = Vanguard_VLM(M2,0,0,0,0,0,0,0,xCG,zCG);
% CD_M = (CD2-CD1)/(M2-M1);
% CL_M = (CL2-CL1)/(M2-M1);
% Cm_M = (Cm2-Cm1)/(M2-M1);
% 
% % alpha derivatives
% [CD1,CL1,Cm1,~,~,~] = Vanguard_VLM(M,a1,0,0,0,0,0,0,xCG,zCG);
% [CD2,CL2,Cm2,~,~,~] = Vanguard_VLM(M,a2,0,0,0,0,0,0,xCG,zCG);
% CD_a = (CD2-CD1)/deg2rad(a2-a1);
% CL_a = (CL2-CL1)/deg2rad(a2-a1);
% Cm_awtn = (Cm2-Cm1)/deg2rad(a2-a1); %Cm,a from wing, tail, and nacelles (from VLM code)
% [Cm_af,~,~] = fuselagefn(alt,V,xCG);
% Cm_a = Cm_awtn + Cm_af;
% 
% % alpha(dot) derivatives
% CD_adot = 0; %per Roskam SC deriv p6.1
% CL_adot = 0;  % work in progress............
% Cm_adot = Cm_adotfn(alt,V,xCG); %seems a lil sketch to me that it's -10.7 ............................
% 
% % q derivatives
% [~,CL1,Cm1,~,~,~] = Vanguard_VLM(M,0,0,0,0,q1,0,0,xCG,zCG);
% [~,CL2,Cm2,~,~,~] = Vanguard_VLM(M,0,0,0,0,q2,0,0,xCG,zCG);
% CD_q = 0; %per Roskam SC deriv p5.1
% CL_q = (CL2-CL1)/(q2-q1);
% Cm_q = (Cm2-Cm1)/(q2-q1);
% 
% % de derivatives
% [CD1,CL1,Cm1,~,~,~] = Vanguard_VLM(M,0,0,de1,0,0,0,0,xCG,zCG);
% [CD2,CL2,Cm2,~,~,~] = Vanguard_VLM(M,0,0,de2,0,0,0,0,xCG,zCG);
% CD_de = (CD2-CD1)/deg2rad(de2-de1);
% CL_de = (CL2-CL1)/deg2rad(de2-de1);
% Cm_de = (Cm2-Cm1)/deg2rad(de2-de1);
% 
% % dT derivatives
% CD_dT = 0; %no dT input, this makes the 2nd col of the control matrix 0
% CL_dT = 0; %no dT input, this makes the 2nd col of the control matrix 0
% Cm_dT = 0; %no dT input, this makes the 2nd col of the control matrix 0

% beta derivatives
[~,~,~,CY1,~,Cn1] = Vanguard_VLM(M,0,B1,0,0,0,0,0,xCG,zCG);
[~,~,~,CY2,~,Cn2] = Vanguard_VLM(M,0,B2,0,0,0,0,0,xCG,zCG);
[~,Cn_Bf,Cl_Bf] = fuselagefn(alt,V,xCG);
CY_B = (CY2-CY1)/deg2rad(B2-B1);
Cl_B = ClBfn(alt,V,xCG);
Cn_B = (Cn2-Cn1)/deg2rad(B2-B1) + Cn_Bf;

% p derivatives





clear CD1 CD2 CL1 CL2 Cm1 Cm2 CY1 CY2 Cl1 Cl2 Cn1 Cn2

run longitudinal_dynamics.m











