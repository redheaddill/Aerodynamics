% Master stab & control aircraft data

acftdata.general.weight = 147661; %lbf
acftdata.general.Ixx = 1.24*10^7; %slug*ft^2
acftdata.general.Iyy = 2.05*10^7; %slug*ft^2
acftdata.general.Izz = 2.64*10^7; %slug*ft^2
acftdata.general.Ixz = 200262.6; %slug*ft^2
acftdata.general.fwd_xCG = 41.02; %ft
acftdata.general.aft_xCG = 41.74; %ft
acftdata.general.fwd_xCG_VTOL = 46.15; %ft
acftdata.general.aft_xCG_VTOL = 46.26; %ft
acftdata.general.zCG = 12.23; %ft

acftdata.wing.S = 1578; %ft^2
acftdata.wing.mac = 13.85; %ft^2
acftdata.wing.cr = 16.69; %ft
acftdata.wing.b = 118; %ft
acftdata.wing.AR = 8.82;
acftdata.wing.i = deg2rad(1.72); %iw converted to rad
acftdata.wing.aL0 = -3*(pi/180); %a_L=0,w converted to rad
acftdata.wing.qcsweep = 0;
acftdata.wing.CL_a = 0.0876*(180/pi); %CLw_a converted to rad^-1
acftdata.wing.Cmairfoil = -0.075;
acftdata.wing.x = 41; %ft at quarter chord
acftdata.wing.z = 15.5; %ft

acftdata.ht.S = 400; %ft^2
acftdata.ht.mac = 9.64; %ft
acftdata.ht.i = 0*(pi/180); %ih converted to rad;
acftdata.ht.CL_a = 4; %rad^-1
acftdata.ht.n = 1; %tail efficiency usually 0.8 to 1.2, assumed 1 for CD (s2p38)
acftdata.ht.Cmh_de = -0.5; %rad^-1
acftdata.ht.Ee = 0.5; %elevator effectiveness
acftdata.ht.x = 92.8; %ft at quarter chord
acftdata.ht.z = 15.5; %ft

acftdata.vt.S = 300; %ft^2
acftdata.vt.mac = 13.41; %ft
acftdata.vt.b = 23; %ft
acftdata.vt.CL_a = 2.4; %rad^-1
acftdata.vt.n = 1; %????????????????????????
acftdata.vt.Er = 0.5; %??????????????????????????
acftdata.vt.x = 89.32; %ft
acftdata.vt.z = 26.33; %ft

acftdata.fuselage.d = 15.83; %ft max diameter of fuselage
acftdata.fuselage.c = 98.6; %ft length of fuselage
acftdata.fuselage.gamma = deg2rad(2.5); %s4p90
acftdata.fuselage.x = 53.975; %location of fuselage ac

% acftdata.props.xp = 
% acftdata.props.dp =  %ft prop diameter
% acftdata.props.omega =  %rad/s prop rotational velocity
% acftdata.props.CN_a =  %rad^-1 change in normal force wrt a

