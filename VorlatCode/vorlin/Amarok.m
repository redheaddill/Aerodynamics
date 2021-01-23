% function [] = Semestre_2_ailes
    
    clear all
    
    % Set Case Title and Plot Option
    VLData.Title = 'Semestre_2_ailes';
    VLData.Plot = 'true';
    
    % Set Reference Conditions
    VLData.Reference.Area = 700;    % Reference Wing Area
    VLData.Reference.Span = 70;       % Reference Span
    VLData.Reference.Chord = 10.77;    % Reference Chord Length
    VLData.Reference.X = 24.7;       % x Coordinate of the Reference Moment Center
    VLData.Reference.Y = 0;             % y Coordinate of the Reference Moment Center
    VLData.Reference.Z = 0;             % z Coordinate of the Reference Moment Center 
    
    % Set Geometry 
    VLData.Element(1).Name = 'FH1';      % Lifting Element Name
    VLData.Element(1).Area = 71.25;                % Lifting Element Area
    VLData.Element(1).Span = 4.75;                  % Lifting Element Span
    VLData.Element(1).Taper = 1;                    % Lifting Element Taper Ratio
    VLData.Element(1).Sweep = 0;                    % Lifting Element Sweep @ Quarter Chord (deg)
    VLData.Element(1).Dihedral = 0;                 % Lifting Element Dihedral Angle (deg)
    VLData.Element(1).X.Root = 3.75;                   % Lifting Element x Coordinate @ Quarter Chord
    VLData.Element(1).Y.Root = 0;                   % Lifting Element y Coordinate @ Quarter Chord
    VLData.Element(1).Z.Root = -5.75;                   % Lifting Element z Coordinate @ Quarter Chord
    VLData.Element(1).Incidence.Root = 0;     % Lifting Element Root Incidence Angle (deg)
    VLData.Element(1).Incidence.Tip = 0;      % Lifting Element Tip Incidence Angle (deg)
    VLData.Element(1).cdp0 = 0;                % Lifting Element Airfoil zero lift PARASITE DRAG coefficient
    VLData.Element(1).cdp1 = 0;               % Lifting Element Airfoil linear lift dependent PARASITE DRAG term
    VLData.Element(1).cdp2 = 0;                % Lifting Element Airfoil quadratic lift dependent PARASITE DRAG term
    VLData.Element(1).cm0 = 0;                  % Lifting Element Airfoil zero lift moment coefficient
    VLData.Element(1).clmax = 0;                % Lifting Element Airfoil maximum lift coefficient
    VLData.Element(1).cl0 = 5;                  % Lifting Element Airfoil lift coefficient at alpha=0
    VLData.Element(1).cla = 2*pi;                   % Lifting Element Airfoil lift coefficient slope (1/rad)
    VLData.Element(1).npan = 19;                     % Lifting Element Number of Spanwise Panels
    VLData.Element(1).reflectgeometry = 'true';     % Lifting Element Reflect Geometry Flag
    VLData.Element(1).wakelocation = 1;
     
    
    VLData.Element(2).Name = 'FH2';      % Lifting Element Name
    VLData.Element(2).Area = 71.25;                % Lifting Element Area
    VLData.Element(2).Span = 4.75;                  % Lifting Element Span
    VLData.Element(2).Taper = 1;                    % Lifting Element Taper Ratio
    VLData.Element(2).Sweep = 0;                    % Lifting Element Sweep @ Quarter Chord (deg)
    VLData.Element(2).Dihedral = 0;                 % Lifting Element Dihedral Angle (deg)
    VLData.Element(2).X.Root = 18.75;                   % Lifting Element x Coordinate @ Quarter Chord
    VLData.Element(2).Y.Root = 0;                   % Lifting Element y Coordinate @ Quarter Chord
    VLData.Element(2).Z.Root = -5.75;                   % Lifting Element z Coordinate @ Quarter Chord
    VLData.Element(2).Incidence.Root = 0;     % Lifting Element Root Incidence Angle (deg)
    VLData.Element(2).Incidence.Tip = 0;      % Lifting Element Tip Incidence Angle (deg)
    VLData.Element(2).cdp0 = 0;                % Lifting Element Airfoil zero lift PARASITE DRAG coefficient
    VLData.Element(2).cdp1 = 0;               % Lifting Element Airfoil linear lift dependent PARASITE DRAG term
    VLData.Element(2).cdp2 = 0;                % Lifting Element Airfoil quadratic lift dependent PARASITE DRAG term
    VLData.Element(2).cm0 = 0;                  % Lifting Element Airfoil zero lift moment coefficient
    VLData.Element(2).clmax = 0;                % Lifting Element Airfoil maximum lift coefficient
    VLData.Element(2).cl0 = 5;                  % Lifting Element Airfoil lift coefficient at alpha=0
    VLData.Element(2).cla = 2*pi;                   % Lifting Element Airfoil lift coefficient slope (1/rad)
    VLData.Element(2).npan = 19;                     % Lifting Element Number of Spanwise Panels
    VLData.Element(2).reflectgeometry = 'true';     % Lifting Element Reflect Geometry Flag
    VLData.Element(2).wakelocation = 1;
     
    
    VLData.Element(3).Name = 'FH3';      % Lifting Element Name
    VLData.Element(3).Area = 71.25;                % Lifting Element Area
    VLData.Element(3).Span = 4.75;                  % Lifting Element Span
    VLData.Element(3).Taper = 1;                    % Lifting Element Taper Ratio
    VLData.Element(3).Sweep = 0;                    % Lifting Element Sweep @ Quarter Chord (deg)
    VLData.Element(3).Dihedral = 0;                 % Lifting Element Dihedral Angle (deg)
    VLData.Element(3).X.Root = 33.75;                   % Lifting Element x Coordinate @ Quarter Chord
    VLData.Element(3).Y.Root = 0;                   % Lifting Element y Coordinate @ Quarter Chord
    VLData.Element(3).Z.Root = -5.75;                   % Lifting Element z Coordinate @ Quarter Chord
    VLData.Element(3).Incidence.Root = 0;     % Lifting Element Root Incidence Angle (deg)
    VLData.Element(3).Incidence.Tip = 0;      % Lifting Element Tip Incidence Angle (deg)
    VLData.Element(3).cdp0 = 0;                % Lifting Element Airfoil zero lift PARASITE DRAG coefficient
    VLData.Element(3).cdp1 = 0;               % Lifting Element Airfoil linear lift dependent PARASITE DRAG term
    VLData.Element(3).cdp2 = 0;                % Lifting Element Airfoil quadratic lift dependent PARASITE DRAG term
    VLData.Element(3).cm0 = 0;                  % Lifting Element Airfoil zero lift moment coefficient
    VLData.Element(3).clmax = 0;                % Lifting Element Airfoil maximum lift coefficient
    VLData.Element(3).cl0 = 5;                  % Lifting Element Airfoil lift coefficient at alpha=0
    VLData.Element(3).cla = 2*pi;                   % Lifting Element Airfoil lift coefficient slope (1/rad)
    VLData.Element(3).npan = 19;                     % Lifting Element Number of Spanwise Panels
    VLData.Element(3).reflectgeometry = 'true';     % Lifting Element Reflect Geometry Flag
    VLData.Element(3).wakelocation = 1;
     
    
    VLData.Element(4).Name = 'FH4';      % Lifting Element Name
    VLData.Element(4).Area = 71.25;                % Lifting Element Area
    VLData.Element(4).Span = 4.75;                  % Lifting Element Span
    VLData.Element(4).Taper = 1;                    % Lifting Element Taper Ratio
    VLData.Element(4).Sweep = 0;                    % Lifting Element Sweep @ Quarter Chord (deg)
    VLData.Element(4).Dihedral = 0;                 % Lifting Element Dihedral Angle (deg)
    VLData.Element(4).X.Root = 48.75;                   % Lifting Element x Coordinate @ Quarter Chord
    VLData.Element(4).Y.Root = 0;                   % Lifting Element y Coordinate @ Quarter Chord
    VLData.Element(4).Z.Root = -5.75;                   % Lifting Element z Coordinate @ Quarter Chord
    VLData.Element(4).Incidence.Root = 0;     % Lifting Element Root Incidence Angle (deg)
    VLData.Element(4).Incidence.Tip = 0;      % Lifting Element Tip Incidence Angle (deg)
    VLData.Element(4).cdp0 = 0;                % Lifting Element Airfoil zero lift PARASITE DRAG coefficient
    VLData.Element(4).cdp1 = 0;               % Lifting Element Airfoil linear lift dependent PARASITE DRAG term
    VLData.Element(4).cdp2 = 0;                % Lifting Element Airfoil quadratic lift dependent PARASITE DRAG term
    VLData.Element(4).cm0 = 0;                  % Lifting Element Airfoil zero lift moment coefficient
    VLData.Element(4).clmax = 0;                % Lifting Element Airfoil maximum lift coefficient
    VLData.Element(4).cl0 = 5;                  % Lifting Element Airfoil lift coefficient at alpha=0
    VLData.Element(4).cla = 2*pi;                   % Lifting Element Airfoil lift coefficient slope (1/rad)
    VLData.Element(4).npan = 19;                     % Lifting Element Number of Spanwise Panels
    VLData.Element(4).reflectgeometry = 'true';     % Lifting Element Reflect Geometry Flag
    VLData.Element(4).wakelocation = 1;
 
    VLData.Element(5).Name = 'Wing Segment 1';      % Lifting Element Name
    VLData.Element(5).Area = 369;                % Lifting Element Area
    VLData.Element(5).Span = 35;                  % Lifting Element Span
    VLData.Element(5).Taper = 0.35;                    % Lifting Element Taper Ratio
    VLData.Element(5).Sweep = 20.18;                    % Lifting Element Sweep @ Quarter Chord (deg)
    VLData.Element(5).Dihedral = -3.5;                 % Lifting Element Dihedral Angle (deg)
    VLData.Element(5).X.Root = 21;                   % Lifting Element x Coordinate @ Quarter Chord
    VLData.Element(5).Y.Root = 0;                   % Lifting Element y Coordinate @ Quarter Chord
    VLData.Element(5).Z.Root = 0;                   % Lifting Element z Coordinate @ Quarter Chord
    VLData.Element(5).Incidence.Root = 2;     % Lifting Element Root Incidence Angle (deg)
    VLData.Element(5).Incidence.Tip = 2;      % Lifting Element Tip Incidence Angle (deg)
    VLData.Element(5).cdp0 = 0;                % Lifting Element Airfoil zero lift PARASITE DRAG coefficient
    VLData.Element(5).cdp1 = 0;               % Lifting Element Airfoil linear lift dependent PARASITE DRAG term
    VLData.Element(5).cdp2 = 0;                % Lifting Element Airfoil quadratic lift dependent PARASITE DRAG term
    VLData.Element(5).cm0 = -0.025;                  % Lifting Element Airfoil zero lift moment coefficient
    VLData.Element(5).clmax = 1.5;                % Lifting Element Airfoil maximum lift coefficient
    VLData.Element(5).cl0 = 0.1;                  % Lifting Element Airfoil lift coefficient at alpha=0
    VLData.Element(5).cla = 2*pi;                   % Lifting Element Airfoil lift coefficient slope (1/rad)
    VLData.Element(5).npan = 140;                     % Lifting Element Number of Spanwise Panels
    VLData.Element(5).reflectgeometry = 'true';     % Lifting Element Reflect Geometry Flag
    VLData.Element(5).wakelocation = 1;
    
    VLData.Element(6).Name = 'HT';
    VLData.Element(6).Area = 87;
    VLData.Element(6).Span = 13;
    VLData.Element(6).Taper = 0.43;
    VLData.Element(6).Sweep = 23.27;
    VLData.Element(6).Dihedral = -0.03;
    VLData.Element(6).X.Root = 53.76;
    VLData.Element(6).Y.Root = 0;
    VLData.Element(6).Z.Root = 11.6;
    VLData.Element(6).Incidence.Root = 0.86;
    VLData.Element(6).Incidence.Tip = 0.86;
    VLData.Element(6).cdp0 = 0;
    VLData.Element(6).cdp1 = 0;
    VLData.Element(6).cdp2 = 0;
    VLData.Element(6).cm0 = 0;
    VLData.Element(6).clmax = 1.15;
    VLData.Element(6).cl0 = 0;
    VLData.Element(6).cla = 2*pi;
    VLData.Element(6).npan = 42;
    VLData.Element(6).reflectgeometry = 'true';
    VLData.Element(6).wakelocation = 1;
   
    VLData.Element(7).Name = 'VT';
    VLData.Element(7).Area = 110;
    VLData.Element(7).Span = 10.5;
    VLData.Element(7).Taper = 0.8;
    VLData.Element(7).Sweep = 27.55;
    VLData.Element(7).Dihedral = 90;
    VLData.Element(7).X.Root = 48.3;
    VLData.Element(7).Y.Root = 0;
    VLData.Element(7).Z.Root = 0;
    VLData.Element(7).Incidence.Root = 0;
    VLData.Element(7).Incidence.Tip = 0;
    VLData.Element(7).cdp0 = 0;
    VLData.Element(7).cdp1 = 0;
    VLData.Element(7).cdp2 = 0;
    VLData.Element(7).cm0 = 0;
    VLData.Element(7).clmax = 1.5;
    VLData.Element(7).cl0 = 0;
    VLData.Element(7).cla = 2*pi;
    VLData.Element(7).npan = 42;
    VLData.Element(7).reflectgeometry = 'false';
    VLData.Element(7).wakelocation = 1;
    
    % Set Flight Condition Data
    FCData.Mach  = 0.8125;  % Freestream Mach number
    FCData.alpha = 2.5;     % Angle of attack (deg)
    FCData.beta  = 0;       % Sideslip angle (deg)
    FCData.phat  = 0.00;       % Nondimensional roll rate (1)
    FCData.qhat  = 0.000;       % Nondimensional pitch rate (1)
    FCData.rhat  = 0.00;       % Nondimensional raw rate (1)
    
% Run Aero Analysis
[FCData] = VorLin(VLData,FCData);
 
% Print Analysis Results
disp(FCData)
 
 
% Data Useful for Load Calculations in Body Axis (Cz,Cx,Cm)
% note that section Cm is reference wrt VLData.Reference.XYZ points a moment
% location point transfer is required to calculate moment on elastic axis 
 
Cz = FCData.Cz_section';
openvar Cz
Cx = FCData.Cx_section';
openvar Cx
Cm = FCData.Cm_section';
openvar Cm
Cy = FCData.Cy_section';
openvar Cy
 
ylocal = FCData.ylocal;
openvar ylocal
  
 
% Wing Cl (19 panels)
figure
plot(FCData.ylocal(1:19),FCData.Cl_section(1:19))
% HT Cl (6 panels)
figure
plot(FCData.ylocal(20:25),FCData.Cl_section(20:25))
% VT Cl (5 panels)
figure
plot(FCData.ylocal(26:30),FCData.Cl_section(26:30))


