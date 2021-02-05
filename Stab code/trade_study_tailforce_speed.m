run master_data.m

v = [50:50:500];

for i = 1:length(v)



%% General
alt = 0; %ft
V = v(i)*1.688; %ft/s
g = 32.2; %ft/s^2
xCG = 41.75; %ft

W = acftdata.general.weight;
Q = 0.5*0.0023769*sigma(alt)*V^2;
fwdCG = acftdata.general.fwd_xCG;
aftCG = acftdata.general.aft_xCG;
fwdCGVTOL = acftdata.general.fwd_xCG_VTOL;
aftCGVTOL = acftdata.general.aft_xCG_VTOL;
zCG = acftdata.general.zCG;

%% Wing
%----------data----------
Kl = 1; %s4p81
Kgamma = 0.84; %s4p81

Sw = acftdata.wing.S;
cw = acftdata.wing.mac;
crw = acftdata.wing.cr;
bw = acftdata.wing.b;
ARw = acftdata.wing.AR;
iw = acftdata.wing.i;
aL0w = acftdata.wing.aL0;
qcsweep = acftdata.wing.qcsweep;
CLw_a = acftdata.wing.CL_a;
Cmairfoil = acftdata.wing.Cmairfoil;
xw = acftdata.wing.x;
zw = acftdata.wing.z;
%----------calcs----------
lw = xw-xCG; %ft
hw = zw-zCG;
CLw = W/(0.5*0.0023769*sigma(alt)*V^2*Sw);
Cmw = Cmairfoil*((ARw*cos(qcsweep)^2)/(ARw+2*cos(qcsweep)));

%% H stab
%----------data----------
Sh = acftdata.ht.S;
ch = acftdata.ht.mac;
ih = acftdata.ht.i;
CLh_a = acftdata.ht.CL_a;
nh = acftdata.ht.n;
Cmh_de = acftdata.ht.Cmh_de;
xh = acftdata.ht.x;
zh = acftdata.ht.z;
Ee = acftdata.ht.Ee;
%----------calcs----------
lh = xh-xCG; %ft
hh = zh-zCG; %ft

%% V stab
%----------data----------
Sv = acftdata.vt.S;
cv = acftdata.vt.mac;
bv = acftdata.vt.b;
CLv_a = acftdata.vt.CL_a;
nv = acftdata.vt.n;
xv = acftdata.vt.x;
zv = acftdata.vt.z;
Er = acftdata.vt.Er;
%----------calcs----------
lv = xv-xCG;
hv = zv-zCG;

%% Fuselage, engines, etc.
%----------data----------
lp = 0; %ft  xp-xCG
dp = 0; %ft prop diameter
omega = 0; %rad/s prop rotational velocity
CNp_a = 0; %rad^-1 change in normal force wrt a

df = acftdata.fuselage.d;
cf = acftdata.fuselage.c;
gamma_f = acftdata.fuselage.gamma;
xfac = acftdata.fuselage.x;
%----------calcs----------
Sf = (pi/4)*df^2; %ft^2  max cross-section area
lf = (xfac/2)-xCG; %ft xACf-xCG
J = ((2*pi*V)/(omega*dp));

%% Estimating downwash
%----------data----------
Kv = 1.05; %s2p87
Kb = 0.76; %s2p88
Kp = 0.49; %s2p89
Ks = 1; %s2p90
%----------calcs----------
Kd = (Kv*Kp*Ks)/Kb;
xbar_d = (lh-lw)/(0.5*bw*Kb);
ybar_d = (hh-hw)/(0.5*bw*Kb);
Ed_a = Kd*(CLw_a/ARw);
Ed0 = Ed_a*(iw-aL0w);

%% Estimating sidewash
%----------data----------
KB = 0.18; %s4p60
%---------calcs----------
xbar_s = ((lv-lw)/(0.5*bw*Kb))-tan(qcsweep);
ybar_s = ((hv-hw)/(0.5*bw*Kb));
Es_B = -((Kv*KB*CLw)/(Kb*ARw));

%% Equations
CL_a = CLw_a + (Sh/Sw)*nh*CLh_a*(1-Ed_a);
CL_de = (Sh/Sw)*nh*CLh_a*Ee;
CL_ih = CLh_a*(Sh/Sw);
CL_q = 2*(lw/cw)*CLw_a + 2*((Sh*lh)/(Sw*cw))*nh*CLh_a;
CL = W/(0.5*0.0023769*sigma(alt)*V^2*Sw);
CL0 = CLw_a*(iw-aL0w) + (Sh/Sw)*nh*CLh_a*(ih-Ed0);

Cm_awt = -(lw/cw)*CLw_a - (Sh*lh/(Sw*cw))*nh*CLh_a*(1-Ed_a);
Cm_af = -2*((Sf*lf)/(Sw*cw))*(1-1.76*(df/cf)^(3/2));
Cm_ap = -2*((dp^2*lp*CNp_a)/(Sw*cw*J^2))*(1-Ed_a);
Cm_a = Cm_awt + Cm_af + Cm_ap;
Cm_de = (Sh*ch*nh*Cmh_de/(Sw*cw)) - (Sh*lh*nh*CLh_a*Ee/(Sw*cw));
Cm_ih = -CLh_a*((Sh*lh)/(Sw*cw));
Cm_q = -2*(lw^2/cw^2)*CLw_a - 2*((Sh*lh^2)/(Sw*cw^2))*nh*CLh_a;
Cm0 = Cmw - (lw/cw)*CLw_a*(iw-aL0w) - ((Sh*lh)/(Sw*cw))*nh*CLh_a*(ih-Ed0);

SM = -Cm_a/CL_a;
MM = SM - ((Cm_q*((g*cw)/(2*V^2)))/(CL-CL_q*((g*cw)/(2*V^2))));
ddedn = -((CL*Cm_a+(CL_a*Cm_q-CL_q*Cm_a)*((g*cw)/(2*V^2)))/(CL_a*Cm_de-CL_de*Cm_a));

Cn_Bv = nv*((Sv*lv)/(Sw*bw))*CLv_a*(1-Es_B);
Cn_Bf = 2*((Sf*lf)/(Sw*bw))*(1-1.76*(df/cf)^1.5);
Cn_Bp = ((2*dp^2*lp)/(Sw*bw))*(1-Es_B)*(CNp_a/J^2);
Cn_B = Cn_Bv + Cn_Bf + Cn_Bp;

Cl_Bf = -((2*gamma_f)/(3*pi))*Kl*Kgamma*CLw_a;
Cl_Bv = -nv*((Sv*hv)/(Sw*bw))*(1-Es_B)*CLv_a;
Cl_Bh = 0.08*nv*((Sv*bv)/(Sw*bw))*(1-Es_B)*CLv_a;
Cl_B = Cl_Bf + Cl_Bv + Cl_Bh;

%% Sub scripts

% Constant rate pitch up
    n = 3;
    q = (n-1)*(g/V);
    qbar = ((q*cw)/(2*V));
    A = [CL_a CL_de ;
         Cm_a Cm_de];
    B = [n*CL-CL0-CL_q*(n-1)*((g*cw)/(2*V^2));
         -Cm0-Cm_q*(n-1)*((g*cw)/(2*V^2))];
    X = linsolve(A,B);
    a = X(1);
    de = X(2);
    a_deg(i) = a*(180/pi());
    de_deg = de*(180/pi());
    CLh = (Sh/Sw)*nh*CLh_a*(a+(2/cw)*lh*qbar+ih-Ed0+Ed_a*a+Ee*de);
    Lh(i) = 0.5*0.0023769*sigma(alt)*V^2*Sw*CLh;
    
end

figure()
plot(v,Lh)
ax = gca();
ax.YRuler.Exponent = 0;
grid on
box on
xlabel('V [KTAS]')
ylabel('Force on HT (upwards is positive) [lb_{f}]')

figure()
plot(v,a_deg)
ax = gca();
ax.YRuler.Exponent = 0;
ylim([-10 20])
grid on
box on
xlabel('V [KTAS]')
ylabel('AoA [deg]')







