%function [CL] = Vanguard_VLM(AoA)
	
clear all
close all

    run AircraftData.mlx;
    
    taper1 = 32;
    taper2 = 44;
    taper3 = 56.05;
    

	% Set Case Title and Plot Option
    VLData.Title = 'AEE-421 Vanguard';
    VLData.Plot = 'true';
    
    % Set Reference Conditions
    VLData.Reference.Area = 3600;    	% Reference Wing Area (ft^2)
    VLData.Reference.Span = 180;     	% Reference Span (ft)
    VLData.Reference.Chord = 20;      % Reference Chord Length (MAC, ft)
    VLData.Reference.X = 7.1425;             % x Coordinate of the Reference Moment Center
    VLData.Reference.Y = 0;             % y Coordinate of the Reference Moment Center
    VLData.Reference.Z = 0;             % z Coordinate of the Reference Moment Center
    
	% Set Geometry
    VLData.Element(1).Name = 'Wing';            	% Lifting Element Name
    VLData.Element(1).Area = 1800;                 % Lifting Element Area (ft^2)
    VLData.Element(1).Span = 90;                  % Lifting Element Span (ft)
    VLData.Element(1).Taper = 0.4;                 % Lifting Element Taper Ratio
    VLData.Element(1).Sweep = 0;                 % Lifting Element Sweep @ Quarter Chord (deg)
    VLData.Element(1).Dihedral = 3.0;                 % Lifting Element Dihedral Angle (deg)
    VLData.Element(1).X.Root = 0;                   % Lifting Element x Coordinate @ Quarter Chord
    VLData.Element(1).Y.Root = 0;                   % Lifting Element y Coordinate @ Quarter Chord
    VLData.Element(1).Z.Root = 0;                   % Lifting Element z Coordinate @ Quarter Chord
    VLData.Element(1).Incidence.Root = 0;           % Lifting Element Root Incidence Angle (deg)
    VLData.Element(1).Incidence.Tip = -2;            % Lifting Element Tip Incidence Angle (deg)
    VLData.Element(1).cdp0 = 0;                  % Lifting Element Airfoil zero lift parasite drag coefficient
    VLData.Element(1).cdp1 = 0;                     % Lifting Element Airfoil linear lift dependent parasite drag term
    VLData.Element(1).cdp2 = 0;                     % Lifting Element Airfoil quadratic lift dependent parasite drag term
    VLData.Element(1).cm0 = 0;                      % Lifting Element Airfoil zero lift moment coefficient
    VLData.Element(1).clmax = 1.4;                 % Lifting Element Airfoil maximum lift coefficient
    VLData.Element(1).cl0 = 0.2;                   % Lifting Element Airfoil lift coefficient at alpha=0
    VLData.Element(1).cla = 2*pi;                   % Lifting Element Airfoil lift coefficient slope (1/rad)
    VLData.Element(1).npan = 30;                    % Lifting Element Number of Spanwise Panels
    VLData.Element(1).reflectgeometry = 'true';     % Lifting Element Reflect Geometry Flag
    VLData.Element(1).wakelocation = 1;


    
    FCData.Mach  = 0.17;    % Freestream Mach number (Cruise 375 kts)
    FCData.alpha = 14.056300;       % Angle of attack (deg)
    FCData.beta  = 0;       % Sideslip angle (deg)
    FCData.phat  = 0;    % Nondimensional roll rate (rad/sec)
    FCData.qhat  = 0;       % Nondimensional pitch rate (rad/sec)
    FCData.rhat  = 0;       % Nondimensional yaw rate (rad/sec)
    

% Run Aero Analysis
[FCData] = VorLin(VLData,FCData);

% Print Analysis Results

CL = FCData.CL;


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

% Wing Cl
% figure
% plot(FCData.ylocal(1:27)/(Vanguard.Wing.b/2),FCData.Cl_section(1:27),'black')
% %title('Relative Wing Lift Distribution');
% xlabel('Spanwise Location, ^{y}/_{b/2}');
% ylabel('^{C_l c}/_{c_{ref}}');
% xline(taper2/(Vanguard.Wing.b/2),'--');
% xline(taper3/(Vanguard.Wing.b/2),'--');
% grid on 
% grid minor



% % HT Cl (12 panels)
% figure
% plot(FCData.ylocal(29:40),FCData.Cl_section(29:40))
% title('HT Section Lift Coefficient');
% xlabel('Spanwise Location');
% ylabel('Lift Coefficient');
% % VT Cl (8 panels)
% figure
% plot(FCData.zlocal(41:48),FCData.Cl_section(41:48))
% title('VT Section Lift Coefficient');
% xlabel('Spanwise Location');
% ylabel('Lift Coefficient');
% Wing Lift Distribution (28 panels)
% figure


% figure
% plot(FCData.ylocal(1:27),L)
% title('Wing Lift Distribution');
% xlabel('Spanwise Location');
% ylabel('Lift');
% grid on 
% grid minor


%end