function [] = Vanguard()
	
	% Set Case Title and Plot Option
    VLData.Title = 'AEE-12 Vanguard';
    VLData.Plot = 'true';
    
    % Set Reference Conditions
    VLData.Reference.Area = 375.0;    	% Reference Wing Area (ft^2)
    VLData.Reference.Span = 49.0;     	% Reference Span (ft)
    VLData.Reference.Chord = 8.24;      % Reference Chord Length (MAC, ft)
    VLData.Reference.X = 0;             % x Coordinate of the Reference Moment Center
    VLData.Reference.Y = 0;             % y Coordinate of the Reference Moment Center
    VLData.Reference.Z = 0;             % z Coordinate of the Reference Moment Center
    
	% Set Geometry
    VLData.Element(1).Name = 'Wing Segment 1';    	% Lifting Element Name
    VLData.Element(1).Area = 37.8345;               % Lifting Element Area (ft^2)
    VLData.Element(1).Span = 3.5;                   % Lifting Element Span (ft)
    VLData.Element(1).Taper = 0.906859;             % Lifting Element Taper Ratio
    VLData.Element(1).Sweep = -4.6;                 % Lifting Element Sweep @ Quarter Chord (deg)
    VLData.Element(1).Dihedral = 0;                 % Lifting Element Dihedral Angle (deg)
    VLData.Element(1).X.Root = 0;                   % Lifting Element x Coordinate @ Quarter Chord
    VLData.Element(1).Y.Root = 0;                   % Lifting Element y Coordinate @ Quarter Chord
    VLData.Element(1).Z.Root = 0;                   % Lifting Element z Coordinate @ Quarter Chord
    VLData.Element(1).Incidence.Root = 0;           % Lifting Element Root Incidence Angle (deg)
    VLData.Element(1).Incidence.Tip = 0;            % Lifting Element Tip Incidence Angle (deg)
    VLData.Element(1).cdp0 = 0;                     % Lifting Element Airfoil zero lift parasite drag coefficient
    VLData.Element(1).cdp1 = 0;                     % Lifting Element Airfoil linear lift dependent parasite drag term
    VLData.Element(1).cdp2 = 0;                     % Lifting Element Airfoil quadratic lift dependent parasite drag term
    VLData.Element(1).cm0 = 0;                      % Lifting Element Airfoil zero lift moment coefficient
    VLData.Element(1).clmax = 2.0;                  % Lifting Element Airfoil maximum lift coefficient
    VLData.Element(1).cl0 = 0;                      % Lifting Element Airfoil lift coefficient at alpha=0
    VLData.Element(1).cla = 2*pi;                   % Lifting Element Airfoil lift coefficient slope (1/rad)
    VLData.Element(1).npan = 4;                     % Lifting Element Number of Spanwise Panels
    VLData.Element(1).reflectgeometry = 'true';     % Lifting Element Reflect Geometry Flag
    VLData.Element(1).wakelocation = 1;
    
    VLData.Element(2).Name = 'Wing Segment 2';
    VLData.Element(2).Area = 34.13843;
    VLData.Element(2).Span = 3.5;
    VLData.Element(2).Taper = 0.897293;
    VLData.Element(2).Sweep = -4.6;
    VLData.Element(2).Dihedral = 0;
    VLData.Element(2).X.Root = -0.2816;
    VLData.Element(2).Y.Root = 3.5;
    VLData.Element(2).Z.Root = 0;
    VLData.Element(2).Incidence.Root = 0;
    VLData.Element(2).Incidence.Tip = 0;
    VLData.Element(2).cdp0 = 0;
    VLData.Element(2).cdp1 = 0;
    VLData.Element(2).cdp2 = 0;
    VLData.Element(2).cm0 = 0;
    VLData.Element(2).clmax = 2.0;
    VLData.Element(2).cl0 = 0;
    VLData.Element(2).cla = 2*pi;
    VLData.Element(2).npan = 4;
    VLData.Element(2).reflectgeometry = 'true';
    VLData.Element(2).wakelocation = 1;

    VLData.Element(3).Name = 'Wing Segment 3';
    VLData.Element(3).Area = 30.44236;
    VLData.Element(3).Span = 3.5;
    VLData.Element(3).Taper = 0.885537;
    VLData.Element(3).Sweep = -4.6;
    VLData.Element(3).Dihedral = 0;
    VLData.Element(3).X.Root = -0.5632;
    VLData.Element(3).Y.Root = 7;
    VLData.Element(3).Z.Root = 0;
    VLData.Element(3).Incidence.Root = 0;
    VLData.Element(3).Incidence.Tip = 0;
    VLData.Element(3).cdp0 = 0;
    VLData.Element(3).cdp1 = 0;
    VLData.Element(3).cdp2 = 0;
    VLData.Element(3).cm0 = 0;
    VLData.Element(3).clmax = 2.0;
    VLData.Element(3).cl0 = 0;
    VLData.Element(3).cla = 2*pi;
    VLData.Element(3).npan = 4;
    VLData.Element(3).reflectgeometry = 'true';
    VLData.Element(3).wakelocation = 1;
    
    VLData.Element(4).Name = 'Wing Segment 4';
    VLData.Element(4).Area = 26.74629;
    VLData.Element(4).Span = 3.5;
    VLData.Element(4).Taper = 0.870741;
    VLData.Element(4).Sweep = -4.6;
    VLData.Element(4).Dihedral = 0;
    VLData.Element(4).X.Root = -0.8448;
    VLData.Element(4).Y.Root = 10.5;
    VLData.Element(4).Z.Root = 0;
    VLData.Element(4).Incidence.Root = 0;
    VLData.Element(4).Incidence.Tip = 0;
    VLData.Element(4).cdp0 = 0;
    VLData.Element(4).cdp1 = 0;
    VLData.Element(4).cdp2 = 0;
    VLData.Element(4).cm0 = 0;
    VLData.Element(4).clmax = 2.0;
    VLData.Element(4).cl0 = 0;
    VLData.Element(4).cla = 2*pi;
    VLData.Element(4).npan = 4;
    VLData.Element(4).reflectgeometry = 'true';
    VLData.Element(4).wakelocation = 1;
    
    VLData.Element(5).Name = 'Wing Segment 5';
    VLData.Element(5).Area = 23.05022;
    VLData.Element(5).Span = 3.5;
    VLData.Element(5).Taper = 0.851553;
    VLData.Element(5).Sweep = -4.6;
    VLData.Element(5).Dihedral = 0;
    VLData.Element(5).X.Root = -1.1264;
    VLData.Element(5).Y.Root = 14;
    VLData.Element(5).Z.Root = 0;
    VLData.Element(5).Incidence.Root = 0;
    VLData.Element(5).Incidence.Tip = 0;
    VLData.Element(5).cdp0 = 0;
    VLData.Element(5).cdp1 = 0;
    VLData.Element(5).cdp2 = 0;
    VLData.Element(5).cm0 = 0;
    VLData.Element(5).clmax = 2.0;
    VLData.Element(5).cl0 = 0;
    VLData.Element(5).cla = 2*pi;
    VLData.Element(5).npan = 4;
    VLData.Element(5).reflectgeometry = 'true';
    VLData.Element(5).wakelocation = 1;
   
    VLData.Element(6).Name = 'Wing Segment 6';
    VLData.Element(6).Area = 19.35415;
    VLData.Element(6).Span = 3.5;
    VLData.Element(6).Taper = 0.825675;
    VLData.Element(6).Sweep = -4.6;
    VLData.Element(6).Dihedral = 0;
    VLData.Element(6).X.Root = -1.408;
    VLData.Element(6).Y.Root = 17.5;
    VLData.Element(6).Z.Root = 0;
    VLData.Element(6).Incidence.Root = 0;
    VLData.Element(6).Incidence.Tip = 0;
    VLData.Element(6).cdp0 = 0;
    VLData.Element(6).cdp1 = 0;
    VLData.Element(6).cdp2 = 0;
    VLData.Element(6).cm0 = 0;
    VLData.Element(6).clmax = 2.0;
    VLData.Element(6).cl0 = 0;
    VLData.Element(6).cla = 2*pi;
    VLData.Element(6).npan = 4;
    VLData.Element(6).reflectgeometry = 'true';
    VLData.Element(6).wakelocation = 1;
   
    VLData.Element(7).Name = 'Wing Segment 7';
    VLData.Element(7).Area = 15.65808;
    VLData.Element(7).Span = 3.5;
    VLData.Element(7).Taper = 0.78887;
    VLData.Element(7).Sweep = -4.6;
    VLData.Element(7).Dihedral = 0;
    VLData.Element(7).X.Root = -1.6896;
    VLData.Element(7).Y.Root = 21;
    VLData.Element(7).Z.Root = 0;
    VLData.Element(7).Incidence.Root = 0;
    VLData.Element(7).Incidence.Tip = 0;
    VLData.Element(7).cdp0 = 0;
    VLData.Element(7).cdp1 = 0;
    VLData.Element(7).cdp2 = 0;
    VLData.Element(7).cm0 = 0;
    VLData.Element(7).clmax = 2.0;
    VLData.Element(7).cl0 = 0;
    VLData.Element(7).cla = 2*pi;
    VLData.Element(7).npan = 4;
    VLData.Element(7).reflectgeometry = 'true';
    VLData.Element(7).wakelocation = 1;
    
    VLData.Element(8).Name = 'HT';
    VLData.Element(8).Area = 48.5;
    VLData.Element(8).Span = 10.9;
    VLData.Element(8).Taper = 0.57;
    VLData.Element(8).Sweep = 15;
    VLData.Element(8).Dihedral = 0;
    VLData.Element(8).X.Root = 18.8;
    VLData.Element(8).Y.Root = 0;
    VLData.Element(8).Z.Root = 0;
    VLData.Element(8).Incidence.Root = 0;
    VLData.Element(8).Incidence.Tip = 0;
    VLData.Element(8).cdp0 = 0.0052;
    VLData.Element(8).cdp1 = -0.0141;
    VLData.Element(8).cdp2 = 0.0208;
    VLData.Element(8).cm0 = 0;
    VLData.Element(8).clmax = 1.21;
    VLData.Element(8).cl0 = 0;
    VLData.Element(8).cla = 2*pi;
    VLData.Element(8).npan = 12;
    VLData.Element(8).reflectgeometry = 'true';
    VLData.Element(8).wakelocation = 1;
    
    VLData.Element(9).Name = 'VT';
    VLData.Element(9).Area = 25;
    VLData.Element(9).Span = 7.1;
    VLData.Element(9).Taper = 0.53;
    VLData.Element(9).Sweep = 23;
    VLData.Element(9).Dihedral = 90;
    VLData.Element(9).X.Root = 21.5;
    VLData.Element(9).Y.Root = 10.9;
    VLData.Element(9).Z.Root = -1;
    VLData.Element(9).Incidence.Root = 0;
    VLData.Element(9).Incidence.Tip = 0;
    VLData.Element(9).cdp0 = 0.0052;
    VLData.Element(9).cdp1 = -0.0141;
    VLData.Element(9).cdp2 = 0.0208;
    VLData.Element(9).cm0 = 0;
    VLData.Element(9).clmax = 1.21;
    VLData.Element(9).cl0 = 0;
    VLData.Element(9).cla = 2*pi;
    VLData.Element(9).npan = 8;
    VLData.Element(9).reflectgeometry = 'true';
    VLData.Element(9).wakelocation = 1;
    
    VLData.Element(10).Name = 'Fuselage Horizontal Segment 1';
    VLData.Element(10).Area = 42.0;
    VLData.Element(10).Span = 2.625;
    VLData.Element(10).Taper = 1;
    VLData.Element(10).Sweep = 0;
    VLData.Element(10).Dihedral = 0;
    VLData.Element(10).X.Root = -10;
    VLData.Element(10).Y.Root = 0;
    VLData.Element(10).Z.Root = -2.625;
    VLData.Element(10).Incidence.Root = 0;
    VLData.Element(10).Incidence.Tip = 0;
    VLData.Element(10).cdp0 = 0;
    VLData.Element(10).cdp1 = 0;
    VLData.Element(10).cdp2 = 0;
    VLData.Element(10).cm0 = 0;
    VLData.Element(10).clmax = 2.0;
    VLData.Element(10).cl0 = 0;
    VLData.Element(10).cla = 2*pi;
    VLData.Element(10).npan = 3;
    VLData.Element(10).reflectgeometry = 'true';
    VLData.Element(10).wakelocation = 1;
    
    VLData.Element(11).Name = 'Fuselage Horizontal Segment 2';
    VLData.Element(11).Area = 42.0;
    VLData.Element(11).Span = 2.625;
    VLData.Element(11).Taper = 1;
    VLData.Element(11).Sweep = 0;
    VLData.Element(11).Dihedral = 0;
    VLData.Element(11).X.Root = 6;
    VLData.Element(11).Y.Root = 0;
    VLData.Element(11).Z.Root = -2.625;
    VLData.Element(11).Incidence.Root = 0;
    VLData.Element(11).Incidence.Tip = 0;
    VLData.Element(11).cdp0 = 0;
    VLData.Element(11).cdp1 = 0;
    VLData.Element(11).cdp2 = 0;
    VLData.Element(11).cm0 = 0;
    VLData.Element(11).clmax = 2.0;
    VLData.Element(11).cl0 = 0;
    VLData.Element(11).cla = 2*pi;
    VLData.Element(11).npan = 3;
    VLData.Element(11).reflectgeometry = 'true';
    VLData.Element(11).wakelocation = 1;
    
    VLData.Element(12).Name = 'Fuselage Horizontal Segment 3';
    VLData.Element(12).Area = 44.6250;
    VLData.Element(12).Span = 2.625;
    VLData.Element(12).Taper = 1;
    VLData.Element(12).Sweep = 0;
    VLData.Element(12).Dihedral = 0;
    VLData.Element(12).X.Root = 22;
    VLData.Element(12).Y.Root = 0;
    VLData.Element(12).Z.Root = -2.625;
    VLData.Element(12).Incidence.Root = 0;
    VLData.Element(12).Incidence.Tip = 0;
    VLData.Element(12).cdp0 = 0;
    VLData.Element(12).cdp1 = 0;
    VLData.Element(12).cdp2 = 0;
    VLData.Element(12).cm0 = 0;
    VLData.Element(12).clmax = 2.0;
    VLData.Element(12).cl0 = 0;
    VLData.Element(12).cla = 2*pi;
    VLData.Element(12).npan = 3;
    VLData.Element(12).reflectgeometry = 'true';
    VLData.Element(12).wakelocation = 1;
    
    VLData.Element(13).Name = 'Fuselage Vertical Segment 1';
    VLData.Element(13).Area = 84;
    VLData.Element(13).Span = 5.25;
    VLData.Element(13).Taper = 1;
    VLData.Element(13).Sweep = 0;
    VLData.Element(13).Dihedral = 90;
    VLData.Element(13).X.Root = -10;
    VLData.Element(13).Y.Root = 0;
    VLData.Element(13).Z.Root = -5.25;
    VLData.Element(13).Incidence.Root = 0;
    VLData.Element(13).Incidence.Tip = 0;
    VLData.Element(13).cdp0 = 0;
    VLData.Element(13).cdp1 = 0;
    VLData.Element(13).cdp2 = 0;
    VLData.Element(13).cm0 = 0;
    VLData.Element(13).clmax = 2.0;
    VLData.Element(13).cl0 = 0;
    VLData.Element(13).cla = 2*pi;
    VLData.Element(13).npan = 6;
    VLData.Element(13).reflectgeometry = 'false';
    VLData.Element(13).wakelocation = 1;
    
    VLData.Element(14).Name = 'Fuselage Vertical Segment 2';
    VLData.Element(14).Area = 84;
    VLData.Element(14).Span = 5.25;
    VLData.Element(14).Taper = 1;
    VLData.Element(14).Sweep = 0;
    VLData.Element(14).Dihedral = 90;
    VLData.Element(14).X.Root = 6;
    VLData.Element(14).Y.Root = 0;
    VLData.Element(14).Z.Root = -5.25;
    VLData.Element(14).Incidence.Root = 0;
    VLData.Element(14).Incidence.Tip = 0;
    VLData.Element(14).cdp0 = 0;
    VLData.Element(14).cdp1 = 0;
    VLData.Element(14).cdp2 = 0;
    VLData.Element(14).cm0 = 0;
    VLData.Element(14).clmax = 2.0;
    VLData.Element(14).cl0 = 0;
    VLData.Element(14).cla = 2*pi;
    VLData.Element(14).npan = 6;
    VLData.Element(14).reflectgeometry = 'false';
    VLData.Element(14).wakelocation = 1;
    
    VLData.Element(15).Name = 'Fuselage Vertical Segment 3';
    VLData.Element(15).Area = 89.25;
    VLData.Element(15).Span = 5.25;
    VLData.Element(15).Taper = 1;
    VLData.Element(15).Sweep = 0;
    VLData.Element(15).Dihedral = 90;
    VLData.Element(15).X.Root = 22;
    VLData.Element(15).Y.Root = 0;
    VLData.Element(15).Z.Root = -5.25;
    VLData.Element(15).Incidence.Root = 0;
    VLData.Element(15).Incidence.Tip = 0;
    VLData.Element(15).cdp0 = 0;
    VLData.Element(15).cdp1 = 0;
    VLData.Element(15).cdp2 = 0;
    VLData.Element(15).cm0 = 0;
    VLData.Element(15).clmax = 2.0;
    VLData.Element(15).cl0 = 0;
    VLData.Element(15).cla = 2*pi;
    VLData.Element(15).npan = 6;
    VLData.Element(15).reflectgeometry = 'false';
    VLData.Element(15).wakelocation = 1;
    
    FCData.Mach  = 0;       % Freestream Mach number (Cruise 250 kts)
    FCData.alpha = 5;       % Angle of attack (deg)
    FCData.beta  = 0;       % Sideslip angle (deg)
    FCData.phat  = 0;       % Nondimensional roll rate (rad/sec)
    FCData.qhat  = 0;       % Nondimensional pitch rate (rad/sec)
    FCData.rhat  = 0;       % Nondimensional yaw rate (rad/sec)
    

% Run Aero Analysis
[FCData] = VorLin(VLData,FCData);

% Print Analysis Results
disp(FCData)


% % Data Useful for Load Calculations in Stability Axis (CL,CD,Cm)
% % note that section Cm is reference wrt VLData.Reference.XYZ points a moment
% % location point transfer is required to calculate moment on elastic axis 
% openvar FCData.CL_section
% openvar FCData.CD_section
% openvar FCData.Cm_section

% % Data Useful for Load Calculations in Body Axis (Cz,Cx,Cm)
% % note that section Cm is reference wrt VLData.Reference.XYZ points a moment
% % location point transfer is required to calculate moment on elastic axis
% openvar FCData.Cz_section
% openvar FCData.Cx_section
% openvar FCData.Cm_section

% Wing Cl (28 panels)
figure
plot(FCData.ylocal(1:28),FCData.Cl_section(1:28),'o')
% HT Cl (12 panels)
figure
plot(FCData.ylocal(29:40),FCData.Cl_section(29:40),'o')
% VT Cl (8 panels)
figure
plot(FCData.zlocal(41:48),FCData.Cl_section(41:48),'o')
