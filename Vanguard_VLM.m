function [CDout,CLout,Cmout,CYout,Clout,Cnout] = Vanguard_VLM(M,a,B,de,dr,p,q,r,xCG,zCG,da)

run AircraftData.mlx

taper1 = 32;
taper2 = 44;
taper3 = 56.05;

InstallAngle = 2.04;
YehudiTwist = 0.35;
TaperTwist1 = 1.5;
TaperTwist2 = 1;

wingCm0 = -0.075;

% Set Case Title and Plot Option
VLData.Title = 'AEE-421 Vanguard';
VLData.Plot = 'true';

% Set x and z positions

xw = 41;
zw = 15.5;

xES1 = 36.725;
zES1 = 12.6;

xES2 = 36.725;
zES2 = 9.85;

xES3 = 36.725;
zES3 = 12.6;

xES4 = 36.725;
zES4 = 9.85;

xh = 92.8;
zh = 15.5;

xv = 89.32;
zv = 15.5;

xe = 98.7;
ze = 15.5;

xr = 98.15;
zr = 15.5;

% Set Reference Conditions
VLData.Reference.Area = Vanguard.Wing.S;    	% Reference Wing Area (ft^2)
VLData.Reference.Span = Vanguard.Wing.b;     	% Reference Span (ft)
VLData.Reference.Chord = Vanguard.Wing.MAC;      % Reference Chord Length (MAC, ft)
VLData.Reference.X = xCG;             % x Coordinate of the Reference Moment Center
VLData.Reference.Y = 0;             % y Coordinate of the Reference Moment Center
VLData.Reference.Z = zCG;             % z Coordinate of the Reference Moment Center

% Set Geometry
VLData.Element(1).Name = 'Yehudi1';            	% Lifting Element Name
VLData.Element(1).Area = Vanguard.Wing.Yehudi/2*Vanguard.Wing.Cr;                 % Lifting Element Area (ft^2)
VLData.Element(1).Span = Vanguard.Wing.Yehudi/2;                  % Lifting Element Span (ft)
VLData.Element(1).Taper = 1;                 % Lifting Element Taper Ratio
VLData.Element(1).Sweep = 0;                 % Lifting Element Sweep @ Quarter Chord (deg)
VLData.Element(1).Dihedral = 0;                 % Lifting Element Dihedral Angle (deg)
VLData.Element(1).X.Root = xw;                   % Lifting Element x Coordinate @ Quarter Chord
VLData.Element(1).Y.Root = 0;                   % Lifting Element y Coordinate @ Quarter Chord
VLData.Element(1).Z.Root = zw;                   % Lifting Element z Coordinate @ Quarter Chord
VLData.Element(1).Incidence.Root = InstallAngle;           % Lifting Element Root Incidence Angle (deg)
VLData.Element(1).Incidence.Tip = InstallAngle;            % Lifting Element Tip Incidence Angle (deg)
VLData.Element(1).cdp0 = 0;                  % Lifting Element Airfoil zero lift parasite drag coefficient
VLData.Element(1).cdp1 = 0;                     % Lifting Element Airfoil linear lift dependent parasite drag term
VLData.Element(1).cdp2 = 0;                     % Lifting Element Airfoil quadratic lift dependent parasite drag term
VLData.Element(1).cm0 = wingCm0;                      % Lifting Element Airfoil zero lift moment coefficient
VLData.Element(1).clmax = Vanguard.Wing.Airfoil.Clmax;                 % Lifting Element Airfoil maximum lift coefficient
VLData.Element(1).cl0 = Vanguard.Wing.Airfoil.Clo;                   % Lifting Element Airfoil lift coefficient at alpha=0
VLData.Element(1).cla = Vanguard.Wing.Airfoil.Cla*180/pi;                   % Lifting Element Airfoil lift coefficient slope (1/rad)
VLData.Element(1).npan = 5;                    % Lifting Element Number of Spanwise Panels
VLData.Element(1).reflectgeometry = 'true';     % Lifting Element Reflect Geometry Flag
VLData.Element(1).wakelocation = 1;

VLData.Element(2).Name = 'Yehudi2';            	% Lifting Element Name
VLData.Element(2).Area = Vanguard.Wing.Yehudi/2*Vanguard.Wing.Cr;                 % Lifting Element Area (ft^2)
VLData.Element(2).Span = Vanguard.Wing.Yehudi/2;                  % Lifting Element Span (ft)
VLData.Element(2).Taper = 1;                 % Lifting Element Taper Ratio
VLData.Element(2).Sweep = 0;                 % Lifting Element Sweep @ Quarter Chord (deg)
VLData.Element(2).Dihedral = 0;                 % Lifting Element Dihedral Angle (deg)
VLData.Element(2).X.Root = xw;                   % Lifting Element x Coordinate @ Quarter Chord
VLData.Element(2).Y.Root = Vanguard.Wing.Yehudi/2;                   % Lifting Element y Coordinate @ Quarter Chord
VLData.Element(2).Z.Root = zw;                   % Lifting Element z Coordinate @ Quarter Chord
VLData.Element(2).Incidence.Root = InstallAngle;           % Lifting Element Root Incidence Angle (deg)
VLData.Element(2).Incidence.Tip = InstallAngle-YehudiTwist;            % Lifting Element Tip Incidence Angle (deg)
VLData.Element(2).cdp0 = 0;                  % Lifting Element Airfoil zero lift parasite drag coefficient
VLData.Element(2).cdp1 = 0;                     % Lifting Element Airfoil linear lift dependent parasite drag term
VLData.Element(2).cdp2 = 0;                     % Lifting Element Airfoil quadratic lift dependent parasite drag term
VLData.Element(2).cm0 = wingCm0;                      % Lifting Element Airfoil zero lift moment coefficient
VLData.Element(2).clmax = Vanguard.Wing.Airfoil.Clmax;                 % Lifting Element Airfoil maximum lift coefficient
VLData.Element(2).cl0 = Vanguard.Wing.Airfoil.Clo;                   % Lifting Element Airfoil lift coefficient at alpha=0
VLData.Element(2).cla = Vanguard.Wing.Airfoil.Cla*180/pi;                   % Lifting Element Airfoil lift coefficient slope (1/rad)
VLData.Element(2).npan = 5;                    % Lifting Element Number of Spanwise Panels
VLData.Element(2).reflectgeometry = 'true';     % Lifting Element Reflect Geometry Flag
VLData.Element(2).wakelocation = 1;

VLData.Element(3).Name = 'Taper1';
VLData.Element(3).Area = (YehudiChord(Vanguard.Wing.Yehudi)+YehudiChord(taper1))/2*(taper1-20);
VLData.Element(3).Span = (taper1-20);
VLData.Element(3).Taper = YehudiChord(taper1)/YehudiChord(Vanguard.Wing.Yehudi);
VLData.Element(3).Sweep = 0;
VLData.Element(3).Dihedral = 0;
VLData.Element(3).X.Root = xw;
VLData.Element(3).Y.Root = Vanguard.Wing.Yehudi;
VLData.Element(3).Z.Root = zw;
VLData.Element(3).Incidence.Root = InstallAngle-YehudiTwist;
VLData.Element(3).Incidence.Tip = InstallAngle-YehudiTwist-TaperTwist1;
VLData.Element(3).cdp0 = 0;
VLData.Element(3).cdp1 = 0;
VLData.Element(3).cdp2 = 0;
VLData.Element(3).cm0 = wingCm0;
VLData.Element(3).clmax = Vanguard.Wing.Airfoil.Clmax;
VLData.Element(3).cl0 = Vanguard.Wing.Airfoil.Clo;
VLData.Element(3).cla = Vanguard.Wing.Airfoil.Cla*180/pi;
VLData.Element(3).npan = 7;
VLData.Element(3).reflectgeometry = 'true';
VLData.Element(3).wakelocation = 1;

VLData.Element(4).Name = 'Taper2';
VLData.Element(4).Area = (YehudiChord(taper1)+YehudiChord(taper2))/2*(taper2-taper1);
VLData.Element(4).Span = (taper2-taper1);
VLData.Element(4).Taper = YehudiChord(taper2)/YehudiChord(taper1);
VLData.Element(4).Sweep = 0;
VLData.Element(4).Dihedral = 0;
VLData.Element(4).X.Root = xw;
VLData.Element(4).Y.Root = taper1;
VLData.Element(4).Z.Root = zw;
VLData.Element(4).Incidence.Root = InstallAngle-YehudiTwist-TaperTwist1;
VLData.Element(4).Incidence.Tip = InstallAngle-YehudiTwist-TaperTwist1-TaperTwist2;
VLData.Element(4).cdp0 = 0;
VLData.Element(4).cdp1 = 0;
VLData.Element(4).cdp2 = 0;
VLData.Element(4).cm0 = wingCm0;
VLData.Element(4).clmax = Vanguard.Wing.Airfoil.Clmax;                 
VLData.Element(4).cl0 = Vanguard.Wing.Airfoil.Clo;                  
VLData.Element(4).cla = Vanguard.Wing.Airfoil.Cla*180/pi; 
VLData.Element(4).npan = 5;
VLData.Element(4).reflectgeometry = 'true';
VLData.Element(4).wakelocation = 1;

VLData.Element(5).Name = 'Aileron';    
VLData.Element(5).Area = (YehudiChord(taper2)+YehudiChord(taper3))/2*(taper3-taper2);
VLData.Element(5).Span = (taper3-taper2);
VLData.Element(5).Taper = YehudiChord(taper3)/YehudiChord(taper2);
VLData.Element(5).Sweep = 0;
VLData.Element(5).Dihedral = 0;
VLData.Element(5).X.Root = xw;
VLData.Element(5).Y.Root = taper2;
VLData.Element(5).Z.Root = zw;
VLData.Element(5).Incidence.Root = InstallAngle-YehudiTwist-TaperTwist1-TaperTwist2;
VLData.Element(5).Incidence.Tip = InstallAngle-YehudiTwist-TaperTwist1-TaperTwist2;
VLData.Element(5).cdp0 = 0;
VLData.Element(5).cdp1 = 0;
VLData.Element(5).cdp2 = 0;
VLData.Element(5).cm0 = wingCm0;
VLData.Element(5).clmax = Vanguard.Wing.Airfoil.Clmax;                 
VLData.Element(5).cl0 = Vanguard.Wing.Airfoil.Clo;                  
VLData.Element(5).cla = Vanguard.Wing.Airfoil.Cla*180/pi; 
VLData.Element(5).npan = 5;
VLData.Element(5).reflectgeometry = 'true';
VLData.Element(5).wakelocation = 1;

VLData.Element(6).Name = 'Tip';
VLData.Element(6).Area = (YehudiChord(Vanguard.Wing.Aileron)+YehudiChord(59))/2*(59-Vanguard.Wing.Aileron);
VLData.Element(6).Span = (59-Vanguard.Wing.Aileron);
VLData.Element(6).Taper = YehudiChord(59)/YehudiChord(Vanguard.Wing.Aileron);
VLData.Element(6).Sweep = 0;
VLData.Element(6).Dihedral = 0;
VLData.Element(6).X.Root = xw;
VLData.Element(6).Y.Root = Vanguard.Wing.Aileron;
VLData.Element(6).Z.Root = zw;
VLData.Element(6).Incidence.Root = InstallAngle-YehudiTwist-TaperTwist1-TaperTwist2;
VLData.Element(6).Incidence.Tip = InstallAngle-YehudiTwist-TaperTwist1-TaperTwist2;
VLData.Element(6).cdp0 = 0;
VLData.Element(6).cdp1 = 0;
VLData.Element(6).cdp2 = 0;
VLData.Element(6).cm0 = wingCm0;
VLData.Element(6).clmax = Vanguard.Wing.Airfoil.Clmax;                 
VLData.Element(6).cl0 = Vanguard.Wing.Airfoil.Clo;                  
VLData.Element(6).cla = Vanguard.Wing.Airfoil.Cla*180/pi; 
VLData.Element(6).npan = 2;
VLData.Element(6).reflectgeometry = 'true';
VLData.Element(6).wakelocation = 1;

VLData.Element(7).Name = 'Engine Segment 1';
VLData.Element(7).Area = 51.15;
VLData.Element(7).Span = 5.5;
VLData.Element(7).Taper = 1;
VLData.Element(7).Sweep = 0;
VLData.Element(7).Dihedral = 0;
VLData.Element(7).X.Root = xES1;
VLData.Element(7).Y.Root = 17.75;
VLData.Element(7).Z.Root = zES1;
VLData.Element(7).Incidence.Root = 0;
VLData.Element(7).Incidence.Tip = 0;
VLData.Element(7).cdp0 = 0;
VLData.Element(7).cdp1 = 0;
VLData.Element(7).cdp2 = 0;
VLData.Element(7).cm0 = 0;
VLData.Element(7).clmax = 0;
VLData.Element(7).cl0 = 0;
VLData.Element(7).cla = 2*pi;
VLData.Element(7).npan = 4;
VLData.Element(7).reflectgeometry = 'true';
VLData.Element(7).wakelocation = 1;

VLData.Element(8).Name = 'Engine Segment 2';
VLData.Element(8).Area = 51.15;
VLData.Element(8).Span = 5.5;
VLData.Element(8).Taper = 1;
VLData.Element(8).Sweep = 0;
VLData.Element(8).Dihedral = 90;
VLData.Element(8).X.Root = xES2;
VLData.Element(8).Y.Root = 20.5;
VLData.Element(8).Z.Root = zES2;
VLData.Element(8).Incidence.Root = 0;
VLData.Element(8).Incidence.Tip = 0;
VLData.Element(8).cdp0 = 0;
VLData.Element(8).cdp1 = 0;
VLData.Element(8).cdp2 = 0;
VLData.Element(8).cm0 = 0;
VLData.Element(8).clmax = 0;
VLData.Element(8).cl0 = 0;
VLData.Element(8).cla = 2*pi;
VLData.Element(8).npan = 4;
VLData.Element(8).reflectgeometry = 'true';
VLData.Element(8).wakelocation = 1;

VLData.Element(9).Name = 'Engine Segment 3';
VLData.Element(9).Area = 51.15;
VLData.Element(9).Span = 5.5;
VLData.Element(9).Taper = 1;
VLData.Element(9).Sweep = 0;
VLData.Element(9).Dihedral = 0;
VLData.Element(9).X.Root = xES3;
VLData.Element(9).Y.Root = 39.75;
VLData.Element(9).Z.Root = zES3;
VLData.Element(9).Incidence.Root = 0;
VLData.Element(9).Incidence.Tip = 0;
VLData.Element(9).cdp0 = 0;
VLData.Element(9).cdp1 = 0;
VLData.Element(9).cdp2 = 0;
VLData.Element(9).cm0 = 0;
VLData.Element(9).clmax = 0;
VLData.Element(9).cl0 = 0;
VLData.Element(9).cla = 2*pi;
VLData.Element(9).npan = 4;
VLData.Element(9).reflectgeometry = 'true';
VLData.Element(9).wakelocation = 1;

VLData.Element(10).Name = 'Engine Segment 4';
VLData.Element(10).Area = 51.15;
VLData.Element(10).Span = 5.5;
VLData.Element(10).Taper = 1;
VLData.Element(10).Sweep = 0;
VLData.Element(10).Dihedral = 90;
VLData.Element(10).X.Root = xES4;
VLData.Element(10).Y.Root = 42.5;
VLData.Element(10).Z.Root = zES4;
VLData.Element(10).Incidence.Root = 0;
VLData.Element(10).Incidence.Tip = 0;
VLData.Element(10).cdp0 = 0;
VLData.Element(10).cdp1 = 0;
VLData.Element(10).cdp2 = 0;
VLData.Element(10).cm0 = 0;
VLData.Element(10).clmax = 0;
VLData.Element(10).cl0 = 0;
VLData.Element(10).cla = 2*pi;
VLData.Element(10).npan = 4;
VLData.Element(10).reflectgeometry = 'true';
VLData.Element(10).wakelocation = 1;

VLData.Element(11).Name = 'Horizontal Tail';
VLData.Element(11).Area = 200;
VLData.Element(11).Span = 21.5;
VLData.Element(11).Taper = 0.5;
VLData.Element(11).Sweep = 16.26;
VLData.Element(11).Dihedral = 0;
VLData.Element(11).X.Root = xh;
VLData.Element(11).Y.Root = 4;
VLData.Element(11).Z.Root = zh;
VLData.Element(11).Incidence.Root = 0;
VLData.Element(11).Incidence.Tip = 0;
VLData.Element(11).cdp0 = 0;
VLData.Element(11).cdp1 = 0;
VLData.Element(11).cdp2 = 0;
VLData.Element(11).cm0 = 0;
VLData.Element(11).clmax = 1.25;
VLData.Element(11).cl0 = 0;
VLData.Element(11).cla = 4;
VLData.Element(11).npan = 11;
VLData.Element(11).reflectgeometry = 'true';
VLData.Element(11).wakelocation = 1;

VLData.Element(12).Name = 'Vertical Tail';
VLData.Element(12).Area = 300;
VLData.Element(12).Span = 23;
VLData.Element(12).Taper = 0.55;
VLData.Element(12).Sweep = 28.17;
VLData.Element(12).Dihedral = 90;
VLData.Element(12).X.Root = xv;
VLData.Element(12).Y.Root = 0;
VLData.Element(12).Z.Root = zv;
VLData.Element(12).Incidence.Root = 0;
VLData.Element(12).Incidence.Tip = 0;
VLData.Element(12).cdp0 = 0;
VLData.Element(12).cdp1 = 0;
VLData.Element(12).cdp2 = 0;
VLData.Element(12).cm0 = 0;
VLData.Element(12).clmax = 1.25;
VLData.Element(12).cl0 = 0;
VLData.Element(12).cla = 4;
VLData.Element(12).npan = 10;
VLData.Element(12).reflectgeometry = 'false';
VLData.Element(12).wakelocation = 1;

VLData.Element(13).Name = 'Elevator';
VLData.Element(13).Area = 65;
VLData.Element(13).Span = 17.6;
VLData.Element(13).Taper = 0.5;
VLData.Element(13).Sweep = 10.25;
VLData.Element(13).Dihedral = 0;
VLData.Element(13).X.Root = xe;
VLData.Element(13).Y.Root = 7.9;
VLData.Element(13).Z.Root = ze;
VLData.Element(13).Incidence.Root = de;
VLData.Element(13).Incidence.Tip = de;
VLData.Element(13).cdp0 = 0;
VLData.Element(13).cdp1 = 0;
VLData.Element(13).cdp2 = 0;
VLData.Element(13).cm0 = 0;
VLData.Element(13).clmax = 0;
VLData.Element(13).cl0 = 0;
VLData.Element(13).cla = 2*pi;
VLData.Element(13).npan = 9;
VLData.Element(13).reflectgeometry = 'true';
VLData.Element(13).wakelocation = 1;

VLData.Element(14).Name = 'Rudder';
VLData.Element(14).Area = 90;
VLData.Element(14).Span = 23;
VLData.Element(14).Taper = 0.55;
VLData.Element(14).Sweep = 20;
VLData.Element(14).Dihedral = 90;
VLData.Element(14).X.Root = xr;
VLData.Element(14).Y.Root = 0;
VLData.Element(14).Z.Root = zr;
VLData.Element(14).Incidence.Root = -dr;
VLData.Element(14).Incidence.Tip = -dr;
VLData.Element(14).cdp0 = 0;
VLData.Element(14).cdp1 = 0;
VLData.Element(14).cdp2 = 0;
VLData.Element(14).cm0 = 0;
VLData.Element(14).clmax = 0;
VLData.Element(14).cl0 = 0;
VLData.Element(14).cla = 2*pi;
VLData.Element(14).npan = 10;
VLData.Element(14).reflectgeometry = 'false';
VLData.Element(14).wakelocation = 1;

VLData.Element(15).Name = 'RAileron';    
VLData.Element(15).Area = ((YehudiChord(taper2)+YehudiChord(taper3))/2*(taper3-taper2))*0.3;
VLData.Element(15).Span = (taper3-taper2);
VLData.Element(15).Taper = YehudiChord(taper3)/YehudiChord(taper2);
VLData.Element(15).Sweep = -7.6;
VLData.Element(15).Dihedral = 0;
VLData.Element(15).X.Root = xw+5.5;
VLData.Element(15).Y.Root = taper2;
VLData.Element(15).Z.Root = zw;
VLData.Element(15).Incidence.Root = InstallAngle-YehudiTwist-TaperTwist1-TaperTwist2-da;
VLData.Element(15).Incidence.Tip = InstallAngle-YehudiTwist-TaperTwist1-TaperTwist2-da;
VLData.Element(15).cdp0 = 0;
VLData.Element(15).cdp1 = 0;
VLData.Element(15).cdp2 = 0;
VLData.Element(15).cm0 = wingCm0;
VLData.Element(15).clmax = 0;                 
VLData.Element(15).cl0 = 0;                  
VLData.Element(15).cla = 2*pi; 
VLData.Element(15).npan = 5;
VLData.Element(15).reflectgeometry = 'false';
VLData.Element(15).wakelocation = 1;

VLData.Element(16).Name = 'LAileron';    
VLData.Element(16).Area = ((YehudiChord(taper2)+YehudiChord(taper3))/2*(taper3-taper2))*0.3;
VLData.Element(16).Span = (taper3-taper2);
VLData.Element(16).Taper = YehudiChord(taper3)/YehudiChord(taper2);
VLData.Element(16).Sweep = -7.6;
VLData.Element(16).Dihedral = 180;
VLData.Element(16).X.Root = xw+5.5;
VLData.Element(16).Y.Root = -taper2;
VLData.Element(16).Z.Root = zw;
VLData.Element(16).Incidence.Root = InstallAngle-YehudiTwist-TaperTwist1-TaperTwist2-da;
VLData.Element(16).Incidence.Tip = InstallAngle-YehudiTwist-TaperTwist1-TaperTwist2-da;
VLData.Element(16).cdp0 = 0;
VLData.Element(16).cdp1 = 0;
VLData.Element(16).cdp2 = 0;
VLData.Element(16).cm0 = wingCm0;
VLData.Element(16).clmax = 0;                 
VLData.Element(16).cl0 = 0;                  
VLData.Element(16).cla = 2*pi; 
VLData.Element(16).npan = 5;
VLData.Element(16).reflectgeometry = 'false';
VLData.Element(16).wakelocation = 1;

% Set Flight Condition
FCData.Mach  = M;    % Freestream Mach number (Cruise 375 kts)
FCData.alpha = a;       % Angle of attack (deg)
FCData.beta  = B;       % Sideslip angle (deg)
FCData.phat  = p;    % Nondimensional roll rate (rad/sec)
FCData.qhat  = q;       % Nondimensional pitch rate (rad/sec)
FCData.rhat  = r;       % Nondimensional yaw rate (rad/sec)

% Run Aero Analysis
[FCData] = VorLin(VLData,FCData);
close

% Print Analysis Results
CDout = FCData.CD;
CLout = FCData.CL;
Cmout = FCData.Cm;
CYout = FCData.Cy;
Clout = FCData.Cr;
Cnout = FCData.Cn;

% Data Useful for Load Calculations in Stability Axis (CL,CD,Cm)
% note that section Cm is reference wrt LAData.Reference.XYZ points a moment
% location point transfer is required to calculate moment on elastic axis
% openvar FCData.CL_section
% openvar FCData.CD_section
% openvar FCData.Cm_section

% Data Useful for Load Calculations in Body Axis (Cz,Cx,Cm)
% note that section Cm is reference wrt LAData.Reference.XYZ points a moment
% location point transfer is required to calculate moment on elastic axis 
% openvar FCData.Cz_section
% openvar FCData.Cx_section
% openvar FCData.Cm_section

end

