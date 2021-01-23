function [] = Cessna172()
	
	% Set Case Title and Plot Option
    VLData.Title = 'Cessna 172';
    VLData.Plot = 'true';
    
    % Set Reference Conditions
    VLData.Reference.Area = 16.4249;    % Reference Wing Area
    VLData.Reference.Span = 11.0;       % Reference Span
    VLData.Reference.Chord = 1.5118;    % Reference Chord Length
    VLData.Reference.X = -0.4075;       % x Coordinate of the Reference Moment Center
    VLData.Reference.Y = 0;             % y Coordinate of the Reference Moment Center
    VLData.Reference.Z = 0;             % z Coordinate of the Reference Moment Center
    
	% Set Geometry
    VLData.Element(1).Name = 'Wing Segment 1';      % Lifting Element Name
    VLData.Element(1).Area = 0.9454;                % Lifting Element Area
    VLData.Element(1).Span = 0.58;                  % Lifting Element Span
    VLData.Element(1).Taper = 1;                    % Lifting Element Taper Ratio
    VLData.Element(1).Sweep = 0;                    % Lifting Element Sweep @ Quarter Chord (deg)
    VLData.Element(1).Dihedral = 0;                 % Lifting Element Dihedral Angle (deg)
    VLData.Element(1).X.Root = 0;                   % Lifting Element x Coordinate @ Quarter Chord
    VLData.Element(1).Y.Root = 0;                   % Lifting Element y Coordinate @ Quarter Chord
    VLData.Element(1).Z.Root = 0;                   % Lifting Element z Coordinate @ Quarter Chord
    VLData.Element(1).Incidence.Root = 1.48969;     % Lifting Element Root Incidence Angle (deg)
    VLData.Element(1).Incidence.Tip = 1.20321;      % Lifting Element Tip Incidence Angle (deg)
    VLData.Element(1).cdp0 = 0.0024;                % Lifting Element Airfoil zero lift parasite drag coefficient
    VLData.Element(1).cdp1 = -0.0069;               % Lifting Element Airfoil linear lift dependent parasite drag term
    VLData.Element(1).cdp2 = 0.0107;                % Lifting Element Airfoil quadratic lift dependent parasite drag term
    VLData.Element(1).cm0 = -0.05;                  % Lifting Element Airfoil zero lift moment coefficient
    VLData.Element(1).clmax = 1.445;                % Lifting Element Airfoil maximum lift coefficient
    VLData.Element(1).cl0 = 0.259;                  % Lifting Element Airfoil lift coefficient at alpha=0
    VLData.Element(1).cla = 5.4;                   % Lifting Element Airfoil lift coefficient slope (1/rad)
    VLData.Element(1).npan = 2;                     % Lifting Element Number of Spanwise Panels
    VLData.Element(1).reflectgeometry = 'true';     % Lifting Element Reflect Geometry Flag
    VLData.Element(1).wakelocation = 1;
    
    VLData.Element(2).Name = 'Wing Segment 2';
    VLData.Element(2).Area = 3.2111;
    VLData.Element(2).Span = 1.97;
    VLData.Element(2).Taper = 1;
    VLData.Element(2).Sweep = 0;
    VLData.Element(2).Dihedral = 0;
    VLData.Element(2).X.Root = 0;
    VLData.Element(2).Y.Root = 0.58;
    VLData.Element(2).Z.Root = 0;
    VLData.Element(2).Incidence.Root = 1.20321;
    VLData.Element(2).Incidence.Tip = 0.11459;
    VLData.Element(2).cdp0 = 0.0024;
    VLData.Element(2).cdp1 = -0.0069;
    VLData.Element(2).cdp2 = 0.0107;
    VLData.Element(2).cm0 = -0.0465;
    VLData.Element(2).clmax = 1.36;
    VLData.Element(2).cl0 = 0.259;
	VLData.Element(2).cla = 5.4;
    VLData.Element(2).npan = 7;
    VLData.Element(2).reflectgeometry = 'true';
    VLData.Element(2).wakelocation = 1;

    VLData.Element(3).Name = 'Wing Segment 3';
    VLData.Element(3).Area = 4.05596975;
    VLData.Element(3).Span = 2.95;
    VLData.Element(3).Taper = 0.687;
    VLData.Element(3).Sweep = 0;
    VLData.Element(3).Dihedral = 1.71887;
    VLData.Element(3).X.Root = 0;
    VLData.Element(3).Y.Root = 2.55;
    VLData.Element(3).Z.Root = 0;
    VLData.Element(3).Incidence.Root = 0.11459;
    VLData.Element(3).Incidence.Tip = -1.48969;
    VLData.Element(3).cdp0 = 0.0052;
    VLData.Element(3).cdp1 = -0.0141;
    VLData.Element(3).cdp2 = 0.0208;
    VLData.Element(3).cm0 = 0;
    VLData.Element(3).clmax = 1.21;
    VLData.Element(3).cl0 = 0;
	VLData.Element(3).cla = 5.4;
    VLData.Element(3).npan = 10;
    VLData.Element(3).reflectgeometry = 'true';
    VLData.Element(3).wakelocation = 1;
    
    VLData.Element(4).Name = 'HT';
    VLData.Element(4).Area = 1.7766875;
    VLData.Element(4).Span = 1.75;
    VLData.Element(4).Taper = 0.55;
    VLData.Element(4).Sweep = 5;
    VLData.Element(4).Dihedral = 0;
    VLData.Element(4).X.Root = 4.37;
    VLData.Element(4).Y.Root = 0;
    VLData.Element(4).Z.Root = -0.51;
    VLData.Element(4).Incidence.Root = -2.5;
    VLData.Element(4).Incidence.Tip = -2.5;
    VLData.Element(4).cdp0 = 0.0052;
    VLData.Element(4).cdp1 = -0.0141;
    VLData.Element(4).cdp2 = 0.0208;
    VLData.Element(4).cm0 = 0;
    VLData.Element(4).clmax = 1.21;
    VLData.Element(4).cl0 = 0;
	VLData.Element(4).cla = 5.4;
    VLData.Element(4).npan = 6;
    VLData.Element(4).reflectgeometry = 'true';
    VLData.Element(4).wakelocation = 1;
    
    VLData.Element(5).Name = 'VT';
    VLData.Element(5).Area = 1.6936;
    VLData.Element(5).Span = 1.46;
    VLData.Element(5).Taper = 0.45;
    VLData.Element(5).Sweep = 35.00;
    VLData.Element(5).Dihedral = 90;
    VLData.Element(5).X.Root = 3.93;
    VLData.Element(5).Y.Root = 0;
    VLData.Element(5).Z.Root = -0.51;
    VLData.Element(5).Incidence.Root = 0;
    VLData.Element(5).Incidence.Tip = 0;
    VLData.Element(5).cdp0 = 0.0052;
    VLData.Element(5).cdp1 = -0.0141;
    VLData.Element(5).cdp2 = 0.0208;
    VLData.Element(5).cm0 = 0;
    VLData.Element(5).clmax = 1.21;
    VLData.Element(5).cl0 = 0;
	VLData.Element(5).cla = 5.4;
    VLData.Element(5).npan = 5;
    VLData.Element(5).reflectgeometry = 'false';
    VLData.Element(5).wakelocation = 1;
    
    % Set Flight Condition Data
    FCData.Mach  = 0.1630;  % Freestream Mach number
    FCData.alpha = 13;     % Angle of attack (deg)
    FCData.beta  = 0;       % Sideslip angle (deg)
    FCData.phat  = 0;       % Nondimensional roll rate (rad/sec)
    FCData.qhat  = 0;       % Nondimensional pitch rate (rad/sec)
    FCData.rhat  = 0;       % Nondimensional yaw rate (rad/sec)
    
    
% Run Aero Analysis
[FCData] = VorLin(VLData,FCData);

% Print Analysis Results
disp(FCData)


% Data Useful for Load Calculations in Stability Axis (CL,CD,Cm)
% note that section Cm is reference wrt VLData.Reference.XYZ points a moment
% location point transfer is required to calculate moment on elastic axis 
openvar FCData.CL_section
openvar FCData.CD_section
openvar FCData.Cm_section

% Data Useful for Load Calculations in Body Axis (Cz,Cx,Cm)
% note that section Cm is reference wrt VLData.Reference.XYZ points a moment
% location point transfer is required to calculate moment on elastic axis 
openvar FCData.Cz_section
openvar FCData.Cx_section
openvar FCData.Cm_section

% Wing Cl (19 panels)
figure
plot(FCData.ylocal(1:19),FCData.Cl_section(1:19))
% % HT Cl (6 panels)
% figure
% plot(FCData.ylocal(20:25),FCData.Cl_section(20:25))
% % VT Cl (5 panels)
% figure
% plot(FCData.ylocal(26:30),FCData.Cl_section(26:30))
