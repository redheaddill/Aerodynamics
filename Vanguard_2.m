% function [] = Vanguard()
	
clear all
close all

    run AircraftData.mlx
    
    taper1 = 32;
    taper2 = 44;
    taper3 = 56.05;

	% Set Case Title and Plot Option
    VLData.Title = 'AEE-421 Vanguard';
    VLData.Plot = 'true';
    
    % Set Reference Conditions
    VLData.Reference.Area = Vanguard.Wing.S;    	% Reference Wing Area (ft^2)
    VLData.Reference.Span = Vanguard.Wing.b;     	% Reference Span (ft)
    VLData.Reference.Chord = Vanguard.Wing.MAC;      % Reference Chord Length (MAC, ft)
    VLData.Reference.X = 0;             % x Coordinate of the Reference Moment Center
    VLData.Reference.Y = 0;             % y Coordinate of the Reference Moment Center
    VLData.Reference.Z = 0;             % z Coordinate of the Reference Moment Center
    
	% Set Geometry
    VLData.Element(1).Name = 'Yehudi';            	% Lifting Element Name
    VLData.Element(1).Area = Vanguard.Wing.Yehudi*Vanguard.Wing.Cr;                 % Lifting Element Area (ft^2)
    VLData.Element(1).Span = Vanguard.Wing.Yehudi;                  % Lifting Element Span (ft)
    VLData.Element(1).Taper = 1;                 % Lifting Element Taper Ratio
    VLData.Element(1).Sweep = 0;                 % Lifting Element Sweep @ Quarter Chord (deg)
    VLData.Element(1).Dihedral = 0;                 % Lifting Element Dihedral Angle (deg)
    VLData.Element(1).X.Root = 0;                   % Lifting Element x Coordinate @ Quarter Chord
    VLData.Element(1).Y.Root = 0;                   % Lifting Element y Coordinate @ Quarter Chord
    VLData.Element(1).Z.Root = 0;                   % Lifting Element z Coordinate @ Quarter Chord
    VLData.Element(1).Incidence.Root = 2;           % Lifting Element Root Incidence Angle (deg)
    VLData.Element(1).Incidence.Tip = 1;            % Lifting Element Tip Incidence Angle (deg)
    VLData.Element(1).cdp0 = 0;                  % Lifting Element Airfoil zero lift parasite drag coefficient
    VLData.Element(1).cdp1 = 0;                     % Lifting Element Airfoil linear lift dependent parasite drag term
    VLData.Element(1).cdp2 = 0;                     % Lifting Element Airfoil quadratic lift dependent parasite drag term
    VLData.Element(1).cm0 = 0;                      % Lifting Element Airfoil zero lift moment coefficient
    VLData.Element(1).clmax = Vanguard.Wing.Airfoil.Clmax;                 % Lifting Element Airfoil maximum lift coefficient
    VLData.Element(1).cl0 = Vanguard.Wing.Airfoil.Clo;                   % Lifting Element Airfoil lift coefficient at alpha=0
    VLData.Element(1).cla = Vanguard.Wing.Airfoil.Cla*180/pi;                   % Lifting Element Airfoil lift coefficient slope (1/rad)
    VLData.Element(1).npan = 10;                    % Lifting Element Number of Spanwise Panels
    VLData.Element(1).reflectgeometry = 'true';     % Lifting Element Reflect Geometry Flag
    VLData.Element(1).wakelocation = 1;
    
    VLData.Element(2).Name = 'Taper1';
    VLData.Element(2).Area = (YehudiChord(Vanguard.Wing.Yehudi)+YehudiChord(taper1))/2*(taper1-20);
    VLData.Element(2).Span = (taper1-20);
    VLData.Element(2).Taper = YehudiChord(taper1)/YehudiChord(Vanguard.Wing.Yehudi);
    VLData.Element(2).Sweep = 0;
    VLData.Element(2).Dihedral = 0;
    VLData.Element(2).X.Root = 0;
    VLData.Element(2).Y.Root = Vanguard.Wing.Yehudi;
    VLData.Element(2).Z.Root = 0;
    VLData.Element(2).Incidence.Root = 1;
    VLData.Element(2).Incidence.Tip = 0;
    VLData.Element(2).cdp0 = 0;
    VLData.Element(2).cdp1 = 0;
    VLData.Element(2).cdp2 = 0;
    VLData.Element(2).cm0 = 0;
    VLData.Element(2).clmax = Vanguard.Wing.Airfoil.Clmax;
    VLData.Element(2).cl0 = Vanguard.Wing.Airfoil.Clo;
    VLData.Element(2).cla = Vanguard.Wing.Airfoil.Cla*180/pi;
    VLData.Element(2).npan = 5;
    VLData.Element(2).reflectgeometry = 'true';
    VLData.Element(2).wakelocation = 1;
    
    VLData.Element(3).Name = 'Taper2';
    VLData.Element(3).Area = (YehudiChord(taper1)+YehudiChord(taper2))/2*(taper2-taper1);
    VLData.Element(3).Span = (taper2-taper1);
    VLData.Element(3).Taper = YehudiChord(taper2)/YehudiChord(taper1);
    VLData.Element(3).Sweep = 0;
    VLData.Element(3).Dihedral = 0;
    VLData.Element(3).X.Root = 0;
    VLData.Element(3).Y.Root = taper1;
    VLData.Element(3).Z.Root = 0;
    VLData.Element(3).Incidence.Root = 0;
    VLData.Element(3).Incidence.Tip = -1;
    VLData.Element(3).cdp0 = 0;
    VLData.Element(3).cdp1 = 0;
    VLData.Element(3).cdp2 = 0;
    VLData.Element(3).cm0 = 0;
    VLData.Element(3).clmax = Vanguard.Wing.Airfoil.Clmax;                 
    VLData.Element(3).cl0 = Vanguard.Wing.Airfoil.Clo;                  
    VLData.Element(3).cla = Vanguard.Wing.Airfoil.Cla*180/pi; 
    VLData.Element(3).npan = 5;
    VLData.Element(3).reflectgeometry = 'true';
    VLData.Element(3).wakelocation = 1;
   
    VLData.Element(4).Name = 'Taper3';    
    VLData.Element(4).Area = (YehudiChord(taper2)+YehudiChord(taper3))/2*(taper3-taper2);
    VLData.Element(4).Span = (taper3-taper2);
    VLData.Element(4).Taper = YehudiChord(taper3)/YehudiChord(taper2);
    VLData.Element(4).Sweep = 0;
    VLData.Element(4).Dihedral = 0;
    VLData.Element(4).X.Root = 0;
    VLData.Element(4).Y.Root = taper2;
    VLData.Element(4).Z.Root = 0;
    VLData.Element(4).Incidence.Root = -1;
    VLData.Element(4).Incidence.Tip = -2;
    VLData.Element(4).cdp0 = 0;
    VLData.Element(4).cdp1 = 0;
    VLData.Element(4).cdp2 = 0;
    VLData.Element(4).cm0 = 0;
    VLData.Element(4).clmax = Vanguard.Wing.Airfoil.Clmax;                 
    VLData.Element(4).cl0 = Vanguard.Wing.Airfoil.Clo;                  
    VLData.Element(4).cla = Vanguard.Wing.Airfoil.Cla*180/pi; 
    VLData.Element(4).npan = 5;
    VLData.Element(4).reflectgeometry = 'true';
    VLData.Element(4).wakelocation = 1;
    
    
   
    VLData.Element(5).Name = 'Ailerons';
    VLData.Element(5).Area = (YehudiChord(Vanguard.Wing.Aileron)+YehudiChord(59))/2*(59-Vanguard.Wing.Aileron);
    VLData.Element(5).Span = (59-Vanguard.Wing.Aileron);
    VLData.Element(5).Taper = YehudiChord(59)/YehudiChord(Vanguard.Wing.Aileron);
    VLData.Element(5).Sweep = 0;
    VLData.Element(5).Dihedral = 0;
    VLData.Element(5).X.Root = 0;
    VLData.Element(5).Y.Root = Vanguard.Wing.Aileron;
    VLData.Element(5).Z.Root = 0;
    VLData.Element(5).Incidence.Root = 0;
    VLData.Element(5).Incidence.Tip = 0;
    VLData.Element(5).cdp0 = 0;
    VLData.Element(5).cdp1 = 0;
    VLData.Element(5).cdp2 = 0;
    VLData.Element(5).cm0 = 0;
    VLData.Element(5).clmax = Vanguard.Wing.Airfoil.Clmax;                 
    VLData.Element(5).cl0 = Vanguard.Wing.Airfoil.Clo;                  
    VLData.Element(5).cla = Vanguard.Wing.Airfoil.Cla*180/pi; 
    VLData.Element(5).npan = 2;
    VLData.Element(5).reflectgeometry = 'true';
    VLData.Element(5).wakelocation = 1;
%     
%     VLData.Element(5).Name = 'Fuselage Horizontal Segment 2';
%     VLData.Element(5).Area = 42.0;
%     VLData.Element(5).Span = 2.625;
%     VLData.Element(5).Taper = 1;
%     VLData.Element(5).Sweep = 0;
%     VLData.Element(5).Dihedral = 0;
%     VLData.Element(5).X.Root = 4;
%     VLData.Element(5).Y.Root = 0;
%     VLData.Element(5).Z.Root = -2.625;
%     VLData.Element(5).Incidence.Root = 0;
%     VLData.Element(5).Incidence.Tip = 0;
%     VLData.Element(5).cdp0 = 0;
%     VLData.Element(5).cdp1 = 0;
%     VLData.Element(5).cdp2 = 0;
%     VLData.Element(5).cm0 = 0;
%     VLData.Element(5).clmax = 0;
%     VLData.Element(5).cl0 = 0;
%     VLData.Element(5).cla = 2*pi;
%     VLData.Element(5).npan = 4;
%     VLData.Element(5).reflectgeometry = 'true';
%     VLData.Element(5).wakelocation = 1;
%     
%     VLData.Element(6).Name = 'Fuselage Horizontal Segment 3';
%     VLData.Element(6).Area = 42;
%     VLData.Element(6).Span = 2.625;
%     VLData.Element(6).Taper = 1;
%     VLData.Element(6).Sweep = 0;
%     VLData.Element(6).Dihedral = 0;
%     VLData.Element(6).X.Root = 20;
%     VLData.Element(6).Y.Root = 0;
%     VLData.Element(6).Z.Root = -2.625;
%     VLData.Element(6).Incidence.Root = 0;
%     VLData.Element(6).Incidence.Tip = 0;
%     VLData.Element(6).cdp0 = 0;
%     VLData.Element(6).cdp1 = 0;
%     VLData.Element(6).cdp2 = 0;
%     VLData.Element(6).cm0 = 0;
%     VLData.Element(6).clmax = 0;
%     VLData.Element(6).cl0 = 0;
%     VLData.Element(6).cla = 2*pi;
%     VLData.Element(6).npan = 4;
%     VLData.Element(6).reflectgeometry = 'true';
%     VLData.Element(6).wakelocation = 1;
%     
%     VLData.Element(7).Name = 'Fuselage Vertical Segment 1';
%     VLData.Element(7).Area = 84;
%     VLData.Element(7).Span = 5.25;
%     VLData.Element(7).Taper = 1;
%     VLData.Element(7).Sweep = 0;
%     VLData.Element(7).Dihedral = 90;
%     VLData.Element(7).X.Root = -12;
%     VLData.Element(7).Y.Root = 0;
%     VLData.Element(7).Z.Root = -5.25;
%     VLData.Element(7).Incidence.Root = 0;
%     VLData.Element(7).Incidence.Tip = 0;
%     VLData.Element(7).cdp0 = 0;
%     VLData.Element(7).cdp1 = 0;
%     VLData.Element(7).cdp2 = 0;
%     VLData.Element(7).cm0 = 0;
%     VLData.Element(7).clmax = 0;
%     VLData.Element(7).cl0 = 0;
%     VLData.Element(7).cla = 2*pi;
%     VLData.Element(7).npan = 6;
%     VLData.Element(7).reflectgeometry = 'false';
%     VLData.Element(7).wakelocation = 1;
%     
%     VLData.Element(8).Name = 'Fuselage Vertical Segment 2';
%     VLData.Element(8).Area = 84;
%     VLData.Element(8).Span = 5.25;
%     VLData.Element(8).Taper = 1;
%     VLData.Element(8).Sweep = 0;
%     VLData.Element(8).Dihedral = 90;
%     VLData.Element(8).X.Root = 4;
%     VLData.Element(8).Y.Root = 0;
%     VLData.Element(8).Z.Root = -5.25;
%     VLData.Element(8).Incidence.Root = 0;
%     VLData.Element(8).Incidence.Tip = 0;
%     VLData.Element(8).cdp0 = 0;
%     VLData.Element(8).cdp1 = 0;
%     VLData.Element(8).cdp2 = 0;
%     VLData.Element(8).cm0 = 0;
%     VLData.Element(8).clmax = 0;
%     VLData.Element(8).cl0 = 0;
%     VLData.Element(8).cla = 2*pi;
%     VLData.Element(8).npan = 6;
%     VLData.Element(8).reflectgeometry = 'false';
%     VLData.Element(8).wakelocation = 1;
%     
%     VLData.Element(9).Name = 'Fuselage Vertical Segment 3';
%     VLData.Element(9).Area = 84;
%     VLData.Element(9).Span = 5.25;
%     VLData.Element(9).Taper = 1;
%     VLData.Element(9).Sweep = 0;
%     VLData.Element(9).Dihedral = 90;
%     VLData.Element(9).X.Root = 20;
%     VLData.Element(9).Y.Root = 0;
%     VLData.Element(9).Z.Root = -5.25;
%     VLData.Element(9).Incidence.Root = 0;
%     VLData.Element(9).Incidence.Tip = 0;
%     VLData.Element(9).cdp0 = 0;
%     VLData.Element(9).cdp1 = 0;
%     VLData.Element(9).cdp2 = 0;
%     VLData.Element(9).cm0 = 0;
%     VLData.Element(9).clmax = 0;
%     VLData.Element(9).cl0 = 0;
%     VLData.Element(9).cla = 2*pi;
%     VLData.Element(9).npan = 6;
%     VLData.Element(9).reflectgeometry = 'false';
%     VLData.Element(9).wakelocation = 1;
%     
%     VLData.Element(10).Name = 'Engine Segment 1';
%     VLData.Element(10).Area = 15;
%     VLData.Element(10).Span = 3;
%     VLData.Element(10).Taper = 1;
%     VLData.Element(10).Sweep = 0;
%     VLData.Element(10).Dihedral = 0;
%     VLData.Element(10).X.Root = -1;
%     VLData.Element(10).Y.Root = 9;
%     VLData.Element(10).Z.Root = -1.5;
%     VLData.Element(10).Incidence.Root = 0;
%     VLData.Element(10).Incidence.Tip = 0;
%     VLData.Element(10).cdp0 = 0;
%     VLData.Element(10).cdp1 = 0;
%     VLData.Element(10).cdp2 = 0;
%     VLData.Element(10).cm0 = 0;
%     VLData.Element(10).clmax = 0;
%     VLData.Element(10).cl0 = 0;
%     VLData.Element(10).cla = 2*pi;
%     VLData.Element(10).npan = 4;
%     VLData.Element(10).reflectgeometry = 'true';
%     VLData.Element(10).wakelocation = 1;
%     
%     VLData.Element(11).Name = 'Engine Segment 2';
%     VLData.Element(11).Area = 15;
%     VLData.Element(11).Span = 3;
%     VLData.Element(11).Taper = 1;
%     VLData.Element(11).Sweep = 0;
%     VLData.Element(11).Dihedral = 90;
%     VLData.Element(11).X.Root = -1;
%     VLData.Element(11).Y.Root = 10.5;
%     VLData.Element(11).Z.Root = -3;
%     VLData.Element(11).Incidence.Root = 0;
%     VLData.Element(11).Incidence.Tip = 0;
%     VLData.Element(11).cdp0 = 0;
%     VLData.Element(11).cdp1 = 0;
%     VLData.Element(11).cdp2 = 0;
%     VLData.Element(11).cm0 = 0;
%     VLData.Element(11).clmax = 0;
%     VLData.Element(11).cl0 = 0;
%     VLData.Element(11).cla = 2*pi;
%     VLData.Element(11).npan = 4;
%     VLData.Element(11).reflectgeometry = 'true';
%     VLData.Element(11).wakelocation = 1;
    
    FCData.Mach  = 0.58;    % Freestream Mach number (Cruise 250 kts)
    FCData.alpha = 10;       % Angle of attack (deg)
    FCData.beta  = 0;       % Sideslip angle (deg)
    FCData.phat  = 0;    % Nondimensional roll rate (rad/sec)
    FCData.qhat  = 0;       % Nondimensional pitch rate (rad/sec)
    FCData.rhat  = 0;       % Nondimensional yaw rate (rad/sec)
    

% Run Aero Analysis
[FCData] = VorLin(VLData,FCData);

% Print Analysis Results
disp(FCData)


% Data Useful for Load Calculations in Stability Axis (CL,CD,Cm)
% note that section Cm is reference wrt LAData.Reference.XYZ points a moment
% location point transfer is required to calculate moment on elastic axis
openvar FCData.CL_section
openvar FCData.CD_section
openvar FCData.Cm_section

% Data Useful for Load Calculations in Body Axis (Cz,Cx,Cm)
% note that section Cm is reference wrt LAData.Reference.XYZ points a moment
% location point transfer is required to calculate moment on elastic axis 
openvar FCData.Cz_section
openvar FCData.Cx_section
openvar FCData.Cm_section

% Wing Cl
figure
plot(FCData.ylocal(1:27),FCData.Cl_section(1:27))
title('Wing Section Lift Coefficient');
xlabel('Spanwise Location');
ylabel('Lift Coefficient');
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
figure
plot(FCData.ylocal(1:27),FCData.L_section(1:27))
title('Wing Lift Distribution');
xlabel('Spanwise Location');
ylabel('Lift');
% % HT Lift Distribution (12 panels)
% figure
% plot(FCData.ylocal(29:40),FCData.L_section(29:40))
% title('HT Lift Distribution');
% xlabel('Spanwise Location');
% ylabel('Lift');
