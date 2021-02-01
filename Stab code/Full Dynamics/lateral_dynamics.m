% Lateral dynamics derivatives and matrices

YB = ((Q*Sw)/W)*CY_B;
Yp = ((Q*Sw)/W)*(bw/(2*V))*CY_p;
Yr = ((Q*Sw)/W)*(bw/(2*V))*CY_r;
Yda = ((Q*Sw)/W)*CY_da;
Ydr = ((Q*Sw)/W)*CY_dr;

LB = ((Q*Sw*bw)/Ixx)*Cl_B;
Lp = ((Q*Sw*bw)/Ixx)*(bw/(2*V))*Cl_p;
Lr = ((Q*Sw*bw)/Ixx)*(bw/(2*V))*Cl_r;
Lda = ((Q*Sw*bw)/Ixx)*Cl_da;
Ldr = ((Q*Sw*bw)/Ixx)*Cl_dr;

NB = ((Q*Sw*bw)/Izz)*Cn_b;
Np = ((Q*Sw*bw)/Izz)*(bw/(2*V))*Cn_p;
Nr = ((Q*Sw*bw)/Izz)*(bw/(2*V))*Cn_r;
Nda = ((Q*Sw*bw)/Izz)*Cn_da;
Ndr = ((Q*Sw*bw)/Izz)*Cn_dr;

latdenom = 1-(Ixz^2/(Ixx*Izz));

latplant(1,1) = YB/V;
latplant(1,2) = Yp/V;
latplant(1,3) = (g/V)*cos(theta_0);
latplant(1,4) = (Yr-V)/V;

latplant(2,1) = (LB+NB*(Ixz/Ixx))/latdenom;
latplant(2,2) = (Lp+Np*(Ixz/Ixx))/latdenom;
latplant(2,3) = 0;
latplant(2,4) = (Lr+Nr*(Ixz/Ixx))/latdenom;

latplant(3,1) = 0;
latplant(3,2) = 1;
latplant(3,3) = 0;
latplant(3,4) = 0;

latplant(4,1) = (NB+LB*(Ixz/Izz))/latdenom;
latplant(4,2) = (Np+Lp*(Ixz/Izz))/latdenom;
latplant(4,3) = 0;
latplant(4,4) = (Nr+Lr*(Ixz/Izz))/latdenom;

latcontrol(1,1) = Ydr/V;
latcontrol(1,2) = Yda/V;

latcontrol(2,1) = (Ldr+Ndr*(Ixz/Ixx))/latdenom;
latcontrol(2,2) = (Lda+Nda*(Ixz/Ixx))/latdenom;

latcontrol(3,1) = 0;
latcontrol(3,2) = 0;

latcontrol(4,1) = (Ndr+Ldr*(Ixz/Izz))/latdenom;
latcontrol(4,2) = (Nda+Lda*(Ixz/Izz))/latdenom;

