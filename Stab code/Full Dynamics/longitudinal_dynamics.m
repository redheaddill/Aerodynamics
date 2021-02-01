% Longitudinal dynamics derivatives and matrices

Xu = ((-Q*Sw)/(W*V))*(2*CD+M*CD_M);
Xa = ((-Q*Sw)/W)*(CD_a-CL);
Xadot = ((-Q*Sw)/W)*(cw/(2*V))*CD_adot;
Xq = ((-Q*Sw)/W)*(cw/(2*V))*CD_q;
Xde = ((-Q*Sw)/W)*CD_de;
XdT = ((-Q*Sw)/W)*CD_dT;

Zu = ((-Q*Sw)/(W*V))*(2*CL+M*CL_M);
Za = ((-Q*Sw)/W)*(CD+CL_a);
Zadot = ((-Q*Sw)/W)*(cw/(2*V))*CL_adot;
Zq = ((-Q*Sw)/W)*(cw/(2*V))*CL_q;
Zde = ((-Q*Sw)/W)*CL_de;
ZdT = ((-Q*Sw)/W)*CL_dT;

Mu = ((Q*Sw*cw)/(Iyy*V))*M*Cm_M;
Ma = ((Q*Sw*cw)/(Iyy))*Cm_a;
Madot = ((Q*Sw*cw)/(Iyy*V))*(cw/(2*V))*Cm_adot;
Mq = ((Q*Sw*cw)/(Iyy*V))*(cw/(2*V))*Cm_q;
Mde = ((Q*Sw*cw)/(Iyy*V))*Cm_de;
MdT = ((Q*Sw*cw)/(Iyy*V))*Cm_dT;


longplant(1,1) = Xu;
longplant(1,2) = Xa/V;
longplant(1,3) = 0;
longplant(1,4) = -(g/V)*cos(theta_0);

longplant(2,1) = (V*Zu)/(V-Zadot);
longplant(2,2) = Za/(V-Zadot);
longplant(2,3) = (V+Zq)/(V-Zadot);
longplant(2,4) = -(g*sin(theta_0))/(V-Zadot);

longplant(3,1) = V*Mu+((Madot*V*Zu)/(V-Zadot));
longplant(3,2) = Ma+((Madot*Za)/(V-Zadot));
longplant(3,3) = Mq+((Madot*(V+Zq))/(V-Zadot));
longplant(3,4) = 0;

longplant(4,1) = 0;
longplant(4,2) = 0;
longplant(4,3) = 1;
longplant(4,4) = 0;

longcontrol(1,1) = Xde/V;
longcontrol(1,2) = XdT/V;

longcontrol(2,1) = Zde/(V-Zadot);
longcontrol(2,2) = ZdT/(V-Zadot);

longcontrol(3,1) = Mde+((Madot*Zde)/(V-Zadot));
longcontrol(3,2) = MdT+((Madot*ZdT)/(V-Zadot));

longcontrol(4,1) = 0;
longcontrol(4,2) = 0;




