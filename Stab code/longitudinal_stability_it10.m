%% General
W = 147661; %lbf
alt = 25000; %ft
V = 250*1.688; %ft/s
g = 32.2; %ft/s^2
xCG = 41.5; %ft
fwdCG = 41.02; %ft
aftCG = 46.15; %ft
fwdCGVTOL = 45.66; %ft
aftCGVTOL = 46.00; %ft

%% Wing
Sw = 1578; %ft^2
cw = 13.85; %ft^2
crw = 16.69; %ft
bw = 118; %ft
ARw = 8.82;
CLw_a = 0.0876*(180/pi()); %CLw_a converted to rad^-1
Cmairfoil = -0.075;
qcsweep = 0;
Cmw = Cmairfoil*((ARw*cos(qcsweep)^2)/(ARw+2*cos(qcsweep)));
iw = 1.72*(pi()/180); %iw converted to rad
aL0w = -3*(pi()/180); %a_L=0,w converted to rad
xw = 41; %ft at quarter chord
lw = xw-xCG; %ft

%% H stab
Sh = 400; %ft^2
ch = 9.64; %ft
CLh_a = 4; %rad^-1
Cmh_de = -0.5; %rad^-1
nh = 1; %tail efficiency usually 0.8 to 1.2, assumed 1 for CD (s2p38)
ih = 0*(pi()/180); %ih converted to rad;
xh = 92.8; %ft at quarter chord
lh = xh-xCG; %ft
Ee = 0.5; %elevator effectiveness

%% Fuselage, engines, etc.
df = 15.83; %ft max diameter of fuselage
Sf = (pi()/4)*df^2; %ft^2  max cross-section area
xfac = 53.975;
lf = (xfac/2)-xCG; %ft xACf-xCG 
cf = 98.6; %ft length of fuselage
lp = 0; %ft  xp-xCG
dp = 0; %ft prop diameter
w = 0; %rad/s prop rotational velocity
CNp_a = 0; %rad^-1 change in normal force wrt a
J = ((2*pi()*V)/(w*dp));

%% Estimating downwash
Kv = 1.05; %s2p87
Kb = 0.76; %s2p88
Kp = 0.49; %s2p89
Ks = 1; %s2p90
Kd = (Kv*Kp*Ks)/Kb;
x = lh-lw;
y = 0; %ft hh-hw
xbar = x/(0.5*bw*Kb);
ybar = y/(0.5*bw*Kb);
Ed_a = Kd*(CLw_a/ARw);
Ed0 = Ed_a*(iw-aL0w);

%% Equations
CL_a = CLw_a + (Sh/Sw)*nh*CLh_a*(1-Ed_a);
Cm_awt = -(lw/cw)*CLw_a - (Sh*lh/(Sw*cw))*nh*CLh_a*(1-Ed_a);
deltaCm_af = -2*((Sf*lf)/(Sw*cw))*(1-1.76*(df/cf)^(3/2));
deltaCm_ap = -2*((dp^2*lp*CNp_a)/(Sw*cw*J^2))*(1-Ed_a);
Cm_a = Cm_awt + deltaCm_af + deltaCm_ap;
CL_de = (Sh/Sw)*nh*CLh_a*Ee;
Cm_de = (Sh*ch*nh*Cmh_de/(Sw*cw)) - (Sh*lh*nh*CLh_a*Ee/(Sw*cw));
CL_ih = CLh_a*(Sh/Sw);
Cm_ih = -CLh_a*((Sh*lh)/(Sw*cw));
CL = W/(0.5*0.0023769*sigma(alt)*V^2*Sw);
CL0 = CLw_a*(iw-aL0w) + (Sh/Sw)*nh*CLh_a*(ih-Ed0);
Cm0 = Cmw - (lw/cw)*CLw_a*(iw-aL0w) - ((Sh*lh)/(Sw*cw))*nh*CLh_a*(ih-Ed0);

    A = [CL_a CL_de ;
         Cm_a Cm_de];
    B = [CL-CL0;
          Cm0 ];
    X = linsolve(A,B);
    a = X(1)*(180/pi());
    de = X(2)*(180/pi());

CW = W/(0.5*sigma(alt)*0.0023769*V^2*Sw);
CL_q = 2*(lw/cw)*CLw_a + 2*((Sh*lh)/(Sw*cw))*nh*CLh_a;
Cm_q = -2*(lw^2/cw^2)*CLw_a - 2*((Sh*lh^2)/(Sw*cw^2))*nh*CLh_a;

    ddedn = -((CW*Cm_a+(CL_a*Cm_q-CL_q*Cm_a)*((g*cw)/(2*V^2)))/(CL_a*Cm_de-CL_de*Cm_a));
    SM = -Cm_a/CL_a;
    MM = SM - ((Cm_q*((g*cw)/(2*V^2)))/(CW-CL_q*((g*cw)/(2*V^2))));



%% Sub Scripts
% % Finding optimal ih
%     I = -5:0.25:5;
%     for i = I
%         [x,y] = incidence(W,alt,V,g,Sw,crw,cw,bw,ARw,CLw_a,Cmw,iw,aL0w,xw,lw,Sh,ch,CLh_a,Cmh_de,nh,i,lh,Ee,Sf,lf,cf,df,lp,dp,w,CNp_a,J,Kv,Kb,Kp,Ks,Kd,x,y,xbar,ybar,Ed_a,Ed0);
%         a_i(i/0.25+21) = x;
%         de_i(i/0.25+21) = y;
%     end
%     figure()
%     hold on
%     plot(I,a_i,'displayname','Angle of Attack (\alpha)')
%     plot(I,de_i,'displayname','Elevator Deflection (\delta_{e})')
%     xline(3.34,'handlevisibility','off')
%     grid
%     box
%     legend
%     ylabel('\alpha, \delta_{e} [degrees]')
%     xlabel('Horizontal Tail Installation Angle (i_{h}) [degrees]')
%     text(3.36,-1.8,'\leftarrow i_{h}=3.34\circ')
%     hold off

% % Effect of Sh on elevator angle per g, SM, and MM
%     I = 200:450;
%     for i = I
%         [x,y,z] = margins(W,alt,V,g,Sw,crw,cw,bw,ARw,CLw_a,Wmc,iw,aL0w,xw,lw,i,ch,CLh_a,Cmh_de,nh,ih,lh,Ee,Sf,lf,cf,df,lp,dp,w,CNp_a,J,Kv,Kb,Kp,Ks,Kd,x,y,xbar,ybar,Ed_a,Ed0);
%         ddedn_i(i-199) = x;
%         SM(i-199) = y*100;
%         MM(i-199) = z*100;
%     end
%     figure()
%     hold on
%     plot(I,SM,'displayname','Static Margin (l_{np}/c_{w})')
%     plot(I,MM,'displayname','Manoeuvre Margin (l_{mp}/c_{w})')
%     grid
%     box
%     legend('location','nw')
%     ylabel('Static and Manoeuvre Margins [%]')
%     xlabel('Horizontal Tail Area (S_{h}) [ft^{2}]')
%     hold off

% % Trim diagram
%     figure()
%     domain = [0 10];
%     hold on
%     fplot(@(a) cl(CL0,CL_a,CL_ih,CL_de,a*pi()/180,0,0),domain)
%     fplot(@(a) cl(CL0,CL_a,CL_ih,CL_de,a*pi()/180,0,10*pi()/180),domain)
%     fplot(@(a) cl(CL0,CL_a,CL_ih,CL_de,a*pi()/180,0,-10*pi()/180),domain)
%     fplot(@(a) cl(CL0,CL_a,CL_ih,CL_de,a*pi()/180,0,-20*pi()/180),domain)
%     axis([domain 0 1.4])
%     hold off
%     figure()
%     domain = [0 10];
%     hold on
%     fplot(@(a) cm(Cm0,Cm_a,Cm_ih,Cm_de,a*pi()/180,0,0),domain)
%     fplot(@(a) cm(Cm0,Cm_a,Cm_ih,Cm_de,a*pi()/180,0,10*pi()/180),domain)
%     fplot(@(a) cm(Cm0,Cm_a,Cm_ih,Cm_de,a*pi()/180,0,-10*pi()/180),domain)
%     fplot(@(a) cm(Cm0,Cm_a,Cm_ih,Cm_de,a*pi()/180,0,-20*pi()/180),domain)
%     hold off
%     figure()
%     Cm = -1:0.01:1;
%     mfwd = 1/((xCG-fwdCG)/crw); %slope of forward limit line
%     maft = 1/((xCG-aftCG)/crw); %slope of aft limit line
%     CLfwd = mfwd*Cm;
%     CLaft = maft*Cm;
%     hold on
%     plot(polyshape([-0.35378 0 0.17413],[1.71442 0 1.57722]),'facecolor',[(128/255) (128/255) (128/255)],'facealpha',0.5,'linestyle','none','displayname','Trim Envelope')
%     fplot(@(Cm) aline(0,Cm,ih,CL0,CL_a,CL_ih,CL_de,Cm0,Cm_a,Cm_ih,Cm_de,0),'--k','displayname','Angle of Attack')
%     fplot(@(Cm) aline(5*pi()/180,Cm,ih,CL0,CL_a,CL_ih,CL_de,Cm0,Cm_a,Cm_ih,Cm_de,0),'--k','handlevisibility','off')
%     fplot(@(Cm) aline(10*pi()/180,Cm,ih,CL0,CL_a,CL_ih,CL_de,Cm0,Cm_a,Cm_ih,Cm_de,0),'--k','handlevisibility','off')
%     fplot(@(Cm) aline(12.5*pi()/180,Cm,ih,CL0,CL_a,CL_ih,CL_de,Cm0,Cm_a,Cm_ih,Cm_de,0),'--k','handlevisibility','off')
%     fplot(@(Cm) deline(-25*pi()/180,Cm,ih,CL0,CL_a,CL_ih,CL_de,Cm0,Cm_a,Cm_ih,Cm_de),'-k','displayname','Elevator Deflection')
%     fplot(@(Cm) deline(-20*pi()/180,Cm,ih,CL0,CL_a,CL_ih,CL_de,Cm0,Cm_a,Cm_ih,Cm_de),'-k','handlevisibility','off')
%     fplot(@(Cm) deline(-10*pi()/180,Cm,ih,CL0,CL_a,CL_ih,CL_de,Cm0,Cm_a,Cm_ih,Cm_de),'-k','handlevisibility','off')
%     fplot(@(Cm) deline(0*pi()/180,Cm,ih,CL0,CL_a,CL_ih,CL_de,Cm0,Cm_a,Cm_ih,Cm_de),'-k','handlevisibility','off')
%     fplot(@(Cm) deline(10*pi()/180,Cm,ih,CL0,CL_a,CL_ih,CL_de,Cm0,Cm_a,Cm_ih,Cm_de),'-k','handlevisibility','off')
%     fplot(@(Cm) deline(20*pi()/180,Cm,ih,CL0,CL_a,CL_ih,CL_de,Cm0,Cm_a,Cm_ih,Cm_de),'-k','handlevisibility','off')
%     plot(Cm,CLfwd,'-b','displayname','CG Limit')
%     plot(Cm,CLaft,'-b','handlevisibility','off')
%     axis([-0.5 0.5 0 2])
%     set(gca,'xdir','reverse')
%     xticks(-10:0.1:10)
%     yticks(0:0.2:10)
%     xlabel('Moment Coefficient,{\it C_{m} }')
%     ylabel('Lift Coefficient,{\it C_{L} }')
% %     text(0.38,0.1,'\delta_{e} = -20\circ','fontweight','bold')
% %     text(0.39,0.1,'-10\circ','fontweight','bold')
% %     text(0.19,0.1,'\delta_{e} = 0\circ','fontweight','bold')
% %     text(-0.07,0.1,'10\circ','fontweight','bold')
% %     annotation('textbox',[.5 .865 .2 .1],'String','\delta_{e} = -20\circ','fontweight','bold','EdgeColor','none')
%     annotation('textbox',[.26 .865 .2 .1],'String','\delta_{e} = -25\circ','fontweight','bold','EdgeColor','none')
%     annotation('textbox',[.405 .865 .2 .1],'String','-20\circ','fontweight','bold','EdgeColor','none')
%     annotation('textbox',[.635 .865 .1 .1],'String','-10\circ','fontweight','bold','EdgeColor','none')
%     annotation('textbox',[.87 .865 .1 .1],'String','0\circ','fontweight','bold','EdgeColor','none')
%     annotation('textbox',[.905 .585 .1 .1],'String','10\circ','fontweight','bold','EdgeColor','none')
%     annotation('textbox',[.905 .28 .1 .1],'String','20\circ','fontweight','bold','EdgeColor','none')
%     text(0.49,1.56,'\alpha = 12.4\circ','fontweight','bold')
%     text(0.49,1.325,'10\circ','fontweight','bold')
%     text(0.49,0.865,'5\circ','fontweight','bold')
%     text(0.49,0.425,'0\circ','fontweight','bold')
%     legend('location','nw')
%     box on
%     grid on

% % Trim Analysis (points)
%     alt_points = [0 0 0 0 0 5000 5000 5000 5000 5000 15000 15000 15000 15000 25000 25000 25000 25000 35000 35000 35000 35000 48000 48000];
%     V_points = [70 150 250 350 450 76 150 250 350 450 150 250 350 450 150 250 350 450 150 250 350 450 220 450];
%     for i = 1:length(alt_points)
%     [a_points(i),de_points(i)] = envelope(W,alt_points(i),V_points(i),g,Sw,crw,cw,bw,ARw,CLw_a,Cmw,iw,aL0w,xw,lw,Sh,ch,CLh_a,Cmh_de,nh,ih,lh,Ee,Sf,lf,cf,df,lp,dp,w,CNp_a,J,Kv,Kb,Kp,Ks,Kd,x,y,xbar,ybar,Ed_a,Ed0);
%     end
%     spec = '\\alpha = %.1f \n\\delta_{e} = %.1f';
%     txt = {};
%     for i = 1:length(alt_points)
%         txt{i} = sprintf(spec,a_points(i),de_points(i));
%     end
%     openfig('1G-CDR.fig');
%     hold on
%     scatter(V_points,alt_points,'handlevisibility','off','markerfacecolor','b','markeredgecolor','b')
%     text(V_points+2,alt_points,txt)
%     axis([0 550 0 60000])
%     legend('location','nw')
%     grid off
%     grid
%     grid minor
%     ax = gca;
%     ax.GridAlpha = 0.25;
%     ax.MinorGridAlpha = 0.075;
%     ax.MinorGridLineStyle = '-';
%     box on
%     title('  ')
%     ylabel('Altitude [ft ASL]')
%     xlabel('Airspeed [KTAS]')
%     set(gcf, 'Position',  [100, 100, 500, 400])
    
% % Trim Analysis (contour)
%     alt_points = 0:2000:60000;
%     V_points = 0:20:540;
%     for i = 1:length(alt_points)
%         for j = 1:length(V_points)
%             [a_surf(i,j),de_surf(i,j)] = envelope(W,alt_points(i),V_points(j),g,Sw,crw,cw,bw,ARw,CLw_a,Cmw,iw,aL0w,xw,lw,Sh,ch,CLh_a,Cmh_de,nh,ih,lh,Ee,Sf,lf,cf,df,lp,dp,w,CNp_a,J,Kv,Kb,Kp,Ks,Kd,x,y,xbar,ybar,Ed_a,Ed0);
%         end
%     end
%     figure()
%     hold on
%     contourf(V_points,alt_points,a_surf,[-15 -10 -3 5 10 15],'linestyle','none');
%     axis([0 540 0 60000])
%     yticks(0:10000:60000)
%     hold off

% % Wing and Tail Loading
%     xCG = [fwdCG aftCG];
%     spec = {'Fwd CG: Fw=%.0f lbf, Fh=%.0f lbf','Aft CG: Fw=%.0f lbf, Fh=%.0f lbf'};
%     for i = 1:2
%         lw = xw-xCG(i); %ft
%         lh = xh-xCG(i); %ft
%         A1 = [ 1   1  ;
%               -lw -lh];
%         B1 = [W ;
%               0];
%         X1 = linsolve(A1,B1);
%         sprintf(string(spec(i)),X1(1),X1(2))
%     end             

% % Tail Thrust Requirement (for equilibrium)
%     xCG = fwdCG-2:0.1:aftCG+2; %setting input x range
%     xt = 106; %ft
%     for i = 1:length(xCG)
%         lw = xw-xCG(i); %ft
%         lt = xt-xCG(i); %ft
%         A2 = [ 1   1  ;
%               -lw -lt];
%         B2 = [W ;
%               0];
%         X2 = linsolve(A2,B2);
%         Ft(i) = X2(2); %tail thrust required for each CG point
%     end
%     figure()
%     hold on
%     plot(xCG,Ft,'b','displayname','Tail Thrust Required')
%     xline(fwdCGVTOL,'--','displayname','W&B VTOL CG Limits')
%     xline(aftCGVTOL,'--','handlevisibility','off')
%     ax = gca;
%     ax.YAxis.Exponent = 0;
%     yticks(-20000:2000:20000)
%     xlim([38 46])
%     ylabel('Thrust [lb_{f}]')
%     xlabel('CG Location, FS [ft]')
%     title('Thrust Required At Tail To Maintain Equilibrium')
%     grid on
%     box on
%     legend('location','nw')
%     hold off

% % Constant rate pitch up
%     n = 3;
%     q = (n-1)*(g/V);
%     qbar = ((q*cw)/(2*V));
%     A = [CL_a CL_de ;
%          Cm_a Cm_de];
%     B = [n*CW-CL0-CL_q*(n-1)*((g*cw)/(2*V^2));
%          -Cm0-Cm_q*(n-1)*((g*cw)/(2*V^2))];
%     X = linsolve(A,B);
%     a = X(1);
%     de = X(2);
%     a_deg = a*(180/pi())
%     de_deg = de*(180/pi())
%     CLh = (Sh/Sw)*nh*CLh_a*(a+(2/cw)*lh*qbar+ih-Ed0+Ed_a*a+Ee*de)
%     Lh = 0.5*0.0023769*sigma(alt)*V^2*Sw*CLh 
    
    
    
%% Functions  
function [a,de] = incidence(W,alt,V,g,Sw,crw,cw,bw,ARw,CLw_a,Cmw,iw,aL0w,xw,lw,Sh,ch,CLh_a,Cmh_de,nh,i,lh,Ee,Sf,lf,cf,df,lp,dp,w,CNp_a,J,Kv,Kb,Kp,Ks,Kd,x,y,xbar,ybar,Ed_a,Ed0)
ih = i*(pi()/180); %ih converted to rad;
CL_a = CLw_a + (Sh/Sw)*nh*CLh_a*(1-Ed_a);
Cm_awt = -(lw/cw)*CLw_a - (Sh*lh/(Sw*cw))*nh*CLh_a*(1-Ed_a);
deltaCm_af = -2*((Sf*lf)/(Sw*cw))*(1-1.76*(df/cf)^(3/2));
deltaCm_ap = -2*((dp^2*lp*CNp_a)/(Sw*cw*J^2))*(1-Ed_a);
Cm_a = Cm_awt + deltaCm_af + deltaCm_ap;
CL_de = (Sh/Sw)*nh*CLh_a*Ee;
Cm_de = (Sh*ch*nh*Cmh_de/(Sw*cw)) - (Sh*lh*nh*CLh_a*Ee/(Sw*cw));
CL = W/(0.5*0.0023769*sigma(alt)*V^2*Sw);
CL0 = CLw_a*(iw-aL0w) + (Sh/Sw)*nh*CLh_a*(ih-Ed0);
Cm0 = Cmw - (lw/cw)*CLw_a*(iw-aL0w) - ((Sh*lh)/(Sw*cw))*nh*CLh_a*(ih-Ed0);
    A = [CL_a CL_de;
         Cm_a Cm_de];
    B = [CL-CL0;
         Cm0];
    X = linsolve(A,B);
    a = X(1)*(180/pi());
    de = X(2)*(180/pi());
CW = W/(0.5*sigma(alt)*0.0023769*V^2*Sw);
CL_q = 2*(lw/cw)*CLw_a + 2*((Sh*lh)/(Sw*cw))*nh*CLh_a;
Cm_q = -2*(lw^2/cw^2)*CLw_a - 2*((Sh*lh^2)/(Sw*cw^2))*nh*CLh_a;
    ddedn = -((CW*Cm_a+(CL_a*Cm_q-CL_q*Cm_a)*((g*cw)/(2*V^2)))/(CL_a*Cm_de-CL_de*Cm_a));
    SM = -Cm_a/CL_a;
    MM = SM - ((Cm_q*((g*cw)/(2*V^2)))/(CW-CL_q*((g*cw)/(2*V^2))));
end

function [ddedn,SM,MM] = margins(W,alt,V,g,Sw,crw,cw,bw,ARw,CLw_a,Cmw,iw,aL0w,xw,lw,i,ch,CLh_a,Cmh_de,nh,ih,lh,Ee,Sf,lf,cf,df,lp,dp,w,CNp_a,J,Kv,Kb,Kp,Ks,Kd,x,y,xbar,ybar,Ed_a,Ed0)
Sh = i; %ft^2
CL_a = CLw_a + (Sh/Sw)*nh*CLh_a*(1-Ed_a);
Cm_awt = -(lw/cw)*CLw_a - (Sh*lh/(Sw*cw))*nh*CLh_a*(1-Ed_a);
deltaCm_af = -2*((Sf*lf)/(Sw*cw))*(1-1.76*(df/cf)^(3/2));
deltaCm_ap = -2*((dp^2*lp*CNp_a)/(Sw*cw*J^2))*(1-Ed_a);
Cm_a = Cm_awt + deltaCm_af + deltaCm_ap;
CL_de = (Sh/Sw)*nh*CLh_a*Ee;
Cm_de = (Sh*ch*nh*Cmh_de/(Sw*cw)) - (Sh*lh*nh*CLh_a*Ee/(Sw*cw));
CL = W/(0.5*0.0023769*sigma(alt)*V^2*Sw);
CL0 = CLw_a*(iw-aL0w) + (Sh/Sw)*nh*CLh_a*(ih-Ed0);
Cm0 = Cmw - (lw/cw)*CLw_a*(iw-aL0w) - ((Sh*lh)/(Sw*cw))*nh*CLh_a*(ih-Ed0);
    A = [CL_a CL_de;
         Cm_a Cm_de];
    B = [CL-CL0;
         Cm0];
    X = linsolve(A,B);
    a = X(1)*(180/pi());
    de = X(2)*(180/pi());
CW = W/(0.5*sigma(alt)*0.0023769*V^2*Sw);
CL_q = 2*(lw/cw)*CLw_a + 2*((Sh*lh)/(Sw*cw))*nh*CLh_a;
Cm_q = -2*(lw^2/cw^2)*CLw_a - 2*((Sh*lh^2)/(Sw*cw^2))*nh*CLh_a;
    ddedn = -((CW*Cm_a+(CL_a*Cm_q-CL_q*Cm_a)*((g*cw)/(2*V^2)))/(CL_a*Cm_de-CL_de*Cm_a));
    SM = -Cm_a/CL_a;
    MM = SM - ((Cm_q*((g*cw)/(2*V^2)))/(CW-CL_q*((g*cw)/(2*V^2))));
end

function CL = cl(CL0,CL_a,CL_ih,CL_de,a,ih,de)
CL = CL0 + CL_a*a + CL_ih*ih + CL_de*de;
end

function Cm = cm(Cm0,Cm_a,Cm_ih,Cm_de,a,ih,de)
Cm = Cm0 + Cm_a*a + Cm_ih*ih + Cm_de*de;
end

function CL = aline(a,Cm,ih,CL0,CL_a,CL_ih,CL_de,Cm0,Cm_a,Cm_ih,Cm_de,type)
if type == 0 %constant ih => elevator configuration
    de1 = 10*pi()/180;
    de2 = 0;
    ih1 = ih;
    ih2 = ih;
elseif type == 1 %constant de => stabilator configuration
    de1 = 0;
    de2 = 0;
    ih1 = 10*pi()/180;
    ih2 = 0;
end
m = (cl(CL0,CL_a,CL_ih,CL_de,a,ih1,de1)-cl(CL0,CL_a,CL_ih,CL_de,a,ih2,de2))/(cm(Cm0,Cm_a,Cm_ih,Cm_de,a,ih1,de1)-cm(Cm0,Cm_a,Cm_ih,Cm_de,a,ih2,de2));
b = cl(CL0,CL_a,CL_ih,CL_de,a,ih1,de1) - m*cm(Cm0,Cm_a,Cm_ih,Cm_de,a,ih1,de1);
CL = m*Cm + b;
end

function CL = deline(de,Cm,ih,CL0,CL_a,CL_ih,CL_de,Cm0,Cm_a,Cm_ih,Cm_de)
a1 = 0;
a2 = 5*pi()/180;
m = (cl(CL0,CL_a,CL_ih,CL_de,a1,ih,de)-cl(CL0,CL_a,CL_ih,CL_de,a2,ih,de))/(cm(Cm0,Cm_a,Cm_ih,Cm_de,a1,ih,de)-cm(Cm0,Cm_a,Cm_ih,Cm_de,a2,ih,de));
b = cl(CL0,CL_a,CL_ih,CL_de,a1,ih,de) - m*cm(Cm0,Cm_a,Cm_ih,Cm_de,a1,ih,de);
CL = m*Cm + b;
end

function CL = ihline(ih,Cm,CL0,CL_a,CL_ih,CL_de,Cm0,Cm_a,Cm_ih,Cm_de)
a1 = 0;
a2 = 5*pi()/180;
de = 0;
m = (cl(CL0,CL_a,CL_ih,CL_de,a1,ih,de)-cl(CL0,CL_a,CL_ih,CL_de,a2,ih,de))/(cm(Cm0,Cm_a,Cm_ih,Cm_de,a1,ih,de)-cm(Cm0,Cm_a,Cm_ih,Cm_de,a2,ih,de));
b = cl(CL0,CL_a,CL_ih,CL_de,a1,ih,de) - m*cm(Cm0,Cm_a,Cm_ih,Cm_de,a1,ih,de);
CL = m*Cm + b;
end

function [a,de] = envelope(W,alt,v,g,Sw,crw,cw,bw,ARw,CLw_a,Cmw,iw,aL0w,xw,lw,Sh,ch,CLh_a,Cmh_de,nh,ih,lh,Ee,Sf,lf,cf,df,lp,dp,w,CNp_a,J,Kv,Kb,Kp,Ks,Kd,x,y,xbar,ybar,Ed_a,Ed0)
V = v*1.688;
CL_a = CLw_a + (Sh/Sw)*nh*CLh_a*(1-Ed_a);
Cm_awt = -(lw/cw)*CLw_a - (Sh*lh/(Sw*cw))*nh*CLh_a*(1-Ed_a);
deltaCm_af = -2*((Sf*lf)/(Sw*cw))*(1-1.76*(df/cf)^(3/2));
deltaCm_ap = -2*((dp^2*lp*CNp_a)/(Sw*cw*J^2))*(1-Ed_a);
Cm_a = Cm_awt + deltaCm_af + deltaCm_ap;
CL_de = (Sh/Sw)*nh*CLh_a*Ee;
Cm_de = (Sh*ch*nh*Cmh_de/(Sw*cw)) - (Sh*lh*nh*CLh_a*Ee/(Sw*cw));
CL_ih = CLh_a*(Sh/Sw);
Cm_ih = -CLh_a*((Sh*lh)/(Sw*cw));
CL = W/(0.5*0.0023769*sigma(alt)*V^2*Sw);
CL0 = CLw_a*(iw-aL0w) + (Sh/Sw)*nh*CLh_a*(ih-Ed0);
Cm0 = Cmw - (lw/cw)*CLw_a*(iw-aL0w) - ((Sh*lh)/(Sw*cw))*nh*CLh_a*(ih-Ed0);

    A = [CL_a CL_de;
         Cm_a Cm_de];
    B = [CL-CL0;
         Cm0];
    X = linsolve(A,B);
    a = X(1)*(180/pi());
    de = X(2)*(180/pi());
end

    
