function [FCData] = A10()
	
	% Set Case Title and Plot Option
    VLData.Title = 'Farchild A-10 Wing';
    VLData.Plot = 'true';
    
    % Set Reference Conditions
    VLData.Reference.Area = 506.0;      % Reference Wing Area, ft^2
    VLData.Reference.Span = 57.5;       % Reference Span, ft
    VLData.Reference.Chord = 9.9583;    % Reference Chord Length, ft
    VLData.Reference.X = 5.55;          % x Coordinate of the Reference Moment Center
    VLData.Reference.Y = 0;             % y Coordinate of the Reference Moment Center
    VLData.Reference.Z = 0;             % z Coordinate of the Reference Moment Center
    
	% Set Geometry - NACA 6716
    VLData.Element(1).Name = 'Wing Segment 1';      % Lifting Element Name
    VLData.Element(1).Area = 92.0;                  % Lifting Element Area
    VLData.Element(1).Span = 9.20;                  % Lifting Element Span
    VLData.Element(1).Taper = 1.0;                  % Lifting Element Taper Ratio
    VLData.Element(1).Sweep = 0.0;                  % Lifting Element Sweep @ Quarter Chord (deg)
    VLData.Element(1).Dihedral = 0.0;               % Lifting Element Dihedral Angle (deg)
    VLData.Element(1).X.Root = 0;                   % Lifting Element x Coordinate @ Quarter Chord
    VLData.Element(1).Y.Root = 0;                   % Lifting Element y Coordinate @ Quarter Chord
    VLData.Element(1).Z.Root = 0;                   % Lifting Element z Coordinate @ Quarter Chord
    VLData.Element(1).Incidence.Root = 0;           % Lifting Element Root Incidence Angle (deg)
    VLData.Element(1).Incidence.Tip = 0;            % Lifting Element Tip Incidence Angle (deg)
    VLData.Element(1).cm0 = -0.2;                   % Lifting Element Airfoil zero lift moment coefficient
    VLData.Element(1).cl0 = 0.7;                    % Lifting Element Airfoil lift coefficient at alpha=0
    VLData.Element(1).cla = 5.73;                   % Lifting Element Airfoil lift coefficient slope (1/rad)
    VLData.Element(1).nspan = 9;                    % Lifting Element Number of Spanwise Panels
    VLData.Element(1).ncpan = 4;                    % Lifting Element Number of Chordwise Panels
    VLData.Element(1).reflectgeometry = 'true';
    VLData.Element(1).wakelocation = 1;
    

    % NACA 6713
    VLData.Element(2).Name = 'Wing Segment 2';
    VLData.Element(2).Area = 161.00;
    VLData.Element(2).Span = 19.55;
    VLData.Element(2).Taper = 0.65;
    VLData.Element(2).Sweep = 3.0;%5.7333
    VLData.Element(2).Dihedral = 7;
    VLData.Element(2).X.Root = 0;
    VLData.Element(2).Y.Root = 9.2042;
    VLData.Element(2).Z.Root = 0;
    VLData.Element(2).Incidence.Root = 0;
    VLData.Element(2).Incidence.Tip = 0;
    VLData.Element(2).cm0 = -0.2;
    VLData.Element(2).cl0 = 0.7;
	VLData.Element(2).cla = 5.73;
    VLData.Element(2).nspan = 20;
    VLData.Element(2).ncpan = 4;
    VLData.Element(2).reflectgeometry = 'true';
    VLData.Element(2).wakelocation = 1;
    
    
    % % Aileron
    % VLData.Element(3).Name = 'Wing Aileron';
    % VLData.Element(3).Area = 2*9.76;
    % VLData.Element(3).Span = 9.76;
    % VLData.Element(3).Taper = 0.9;
    % VLData.Element(3).Sweep = -3.5;
    % VLData.Element(3).Dihedral = 7;
    % VLData.Element(3).X.Root = 5.15;
    % VLData.Element(3).Y.Root = 18.91;
    % VLData.Element(3).Z.Root = 1.2;
    % VLData.Element(3).Incidence.Root = 0;
    % VLData.Element(3).Incidence.Tip = 0;
    % VLData.Element(3).cm0 = 0;
    % VLData.Element(3).cl0 = 0.7;
    % VLData.Element(3).cla = 2*pi;
    % VLData.Element(3).nspan = 10;
    % VLData.Element(3).ncpan = 1;
    % VLData.Element(3).reflectgeometry = 'true';
    % VLData.Element(3).wakelocation = 1;
    
    
    % Set Flight Condition Data
    FCData.Mach  = 0.45;  	% Freestream Mach number
    FCData.alpha = 0;       % Angle of attack (deg)
    FCData.beta  = 5;       % Sideslip angle (deg)
    FCData.phat  = 0;       % Nondimensional roll rate (rad/sec)
    FCData.qhat  = 0;       % Nondimensional pitch rate (rad/sec)
    FCData.rhat  = 0;       % Nondimensional yaw rate (rad/sec)
    
    
% Run Aero Analysis
[FCData] = VorLat(VLData,FCData);

% % Aircraft Lift vs. AoA
% alpha = linspace(-5,22,28);
% for i = 1:length(alpha)
%     FCData.alpha = alpha(i);
%     [FCData] = VorLin(VLData,FCData);
%     CL(i) = FCData.CL;
% end
% figure
% plot(alpha,CL)
% xlabel('AoA [deg]')
% ylabel('CL')
% %title(sprintf('Mach: %0.3f',FCData.Mach))
% grid on


% Print Analysis Results
disp(FCData)
disp(FCData.CL)
disp(FCData.CD)
disp(FCData.e)

% % % Data Useful for Load Calculations in Body Axis (Cz,Cx,Cm)
% % % note that section Cm is reference wrt VLData.Reference.XYZ points a moment
% % % location point transfer is required to calculate moment on elastic axis
% openvar FCData.ylocal
% openvar FCData.Cz_section
% openvar FCData.Cx_section
% openvar FCData.Cm_section

% Wing Cl
figure
plot(FCData.ylocal,FCData.Cl_section)
xlabel('wingspan location ft')
ylabel('local C_l')

% Wing Cl c / CL barc
figure
plot(FCData.ylocal,FCData.L_section)
xlabel('wingspan location ft')
ylabel('Cl c / CL barc')
