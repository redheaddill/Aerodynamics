clear all
close all

    run AircraftData.mlx;
    
    taper1 = 32;
    taper2 = 44;
    taper3 = 56.05;
    
    InstallAngle = 2.8;
    YehudiTwist = .35;
    TaperTwist1 = 1.5;
    TaperTwist2 = 1;
    
    flapDeflec = 40; %Deg
    
    dClMax = 1.9855;
	
	% Set Case Title and Plot Option
    VLData.Title = 'CC-421 Vanguard';
    VLData.Plot = 'true';
    
    % Set Reference Conditions
    VLData.Reference.Area = Vanguard.Wing.S;    	% Reference Wing Area (ft^2)
    VLData.Reference.Span = Vanguard.Wing.b;     	% Reference Span (ft)
    VLData.Reference.Chord = Vanguard.Wing.MAC;      % Reference Chord Length (MAC, ft)
    VLData.Reference.X = 0;             % x Coordinate of the Reference Moment Center
    VLData.Reference.Y = 0;             % y Coordinate of the Reference Moment Center
    VLData.Reference.Z = 0;             % z Coordinate of the Reference Moment Center
    
	% Set Geometry
    VLData.Element(1).Name = 'Yehudi1';            	% Lifting Element Name
    VLData.Element(1).Area = Vanguard.Wing.Yehudi/2*Vanguard.Wing.Cr;                 % Lifting Element Area (ft^2)
    VLData.Element(1).Span = Vanguard.Wing.Yehudi/2;                  % Lifting Element Span (ft)
    VLData.Element(1).Taper = 1;                 % Lifting Element Taper Ratio
    VLData.Element(1).Sweep = 0;                 % Lifting Element Sweep @ Quarter Chord (deg)
    VLData.Element(1).Dihedral = 0;                 % Lifting Element Dihedral Angle (deg)
    VLData.Element(1).X.Root = 41.4725;                   % Lifting Element x Coordinate @ Quarter Chord
    VLData.Element(1).Y.Root = 0;                   % Lifting Element y Coordinate @ Quarter Chord
    VLData.Element(1).Z.Root = 11.5;                   % Lifting Element z Coordinate @ Quarter Chord
    VLData.Element(1).Incidence.Root = InstallAngle;           % Lifting Element Root Incidence Angle (deg)
    VLData.Element(1).Incidence.Tip = InstallAngle;            % Lifting Element Tip Incidence Angle (deg)
    VLData.Element(1).cdp0 = 0;                  % Lifting Element Airfoil zero lift parasite drag coefficient
    VLData.Element(1).cdp1 = 0;                     % Lifting Element Airfoil linear lift dependent parasite drag term
    VLData.Element(1).cdp2 = 0;                     % Lifting Element Airfoil quadratic lift dependent parasite drag term
    VLData.Element(1).cm0 = 0;                      % Lifting Element Airfoil zero lift moment coefficient
    VLData.Element(1).clmax = Vanguard.Wing.Airfoil.Clmax;                 % Lifting Element Airfoil maximum lift coefficient
    VLData.Element(1).cl0 = Vanguard.Wing.Airfoil.Clo;                   % Lifting Element Airfoil lift coefficient at alpha=0
    VLData.Element(1).cla = Vanguard.Wing.Airfoil.Cla*180/pi;                   % Lifting Element Airfoil lift coefficient slope (1/rad)
    VLData.Element(1).ncpan = 6;
    VLData.Element(1).nspan = 8;                    % Lifting Element Number of Spanwise Panels
    VLData.Element(1).reflectgeometry = 'true';     % Lifting Element Reflect Geometry Flag
    VLData.Element(1).wakelocation = 1;
    
    VLData.Element(2).Name = 'Yehudi2';            	% Lifting Element Name
    VLData.Element(2).Area = Vanguard.Wing.Yehudi/2*Vanguard.Wing.Cr;                 % Lifting Element Area (ft^2)
    VLData.Element(2).Span = Vanguard.Wing.Yehudi/2;                  % Lifting Element Span (ft)
    VLData.Element(2).Taper = 1;                 % Lifting Element Taper Ratio
    VLData.Element(2).Sweep = 0;                 % Lifting Element Sweep @ Quarter Chord (deg)
    VLData.Element(2).Dihedral = 0;                 % Lifting Element Dihedral Angle (deg)
    VLData.Element(2).X.Root = 41.4725;                   % Lifting Element x Coordinate @ Quarter Chord
    VLData.Element(2).Y.Root = Vanguard.Wing.Yehudi/2;                   % Lifting Element y Coordinate @ Quarter Chord
    VLData.Element(2).Z.Root = 11.5;                   % Lifting Element z Coordinate @ Quarter Chord
    VLData.Element(2).Incidence.Root = InstallAngle;           % Lifting Element Root Incidence Angle (deg)
    VLData.Element(2).Incidence.Tip = InstallAngle-YehudiTwist;            % Lifting Element Tip Incidence Angle (deg)
    VLData.Element(2).cdp0 = 0;                  % Lifting Element Airfoil zero lift parasite drag coefficient
    VLData.Element(2).cdp1 = 0;                     % Lifting Element Airfoil linear lift dependent parasite drag term
    VLData.Element(2).cdp2 = 0;                     % Lifting Element Airfoil quadratic lift dependent parasite drag term
    VLData.Element(2).cm0 = 0;                      % Lifting Element Airfoil zero lift moment coefficient
    VLData.Element(2).clmax = Vanguard.Wing.Airfoil.Clmax;                 % Lifting Element Airfoil maximum lift coefficient
    VLData.Element(2).cl0 = Vanguard.Wing.Airfoil.Clo;                   % Lifting Element Airfoil lift coefficient at alpha=0
    VLData.Element(2).cla = Vanguard.Wing.Airfoil.Cla*180/pi;                   % Lifting Element Airfoil lift coefficient slope (1/rad)
    VLData.Element(2).ncpan = 6;
    VLData.Element(2).nspan = 8;                    % Lifting Element Number of Spanwise Panels
    VLData.Element(2).reflectgeometry = 'true';     % Lifting Element Reflect Geometry Flag
    VLData.Element(2).wakelocation = 1;
    
    VLData.Element(3).Name = 'Taper1';
    VLData.Element(3).Area = (YehudiChord(Vanguard.Wing.Yehudi)+YehudiChord(taper1))/2*(taper1-20);
    VLData.Element(3).Span = (taper1-20);
    VLData.Element(3).Taper = YehudiChord(taper1)/YehudiChord(Vanguard.Wing.Yehudi);
    VLData.Element(3).Sweep = 0;
    VLData.Element(3).Dihedral = 0;
    VLData.Element(3).X.Root = 41.4725;
    VLData.Element(3).Y.Root = Vanguard.Wing.Yehudi;
    VLData.Element(3).Z.Root = 11.5;
    VLData.Element(3).Incidence.Root = InstallAngle-YehudiTwist;
    VLData.Element(3).Incidence.Tip = InstallAngle-YehudiTwist-TaperTwist1;
    VLData.Element(3).cdp0 = 0;
    VLData.Element(3).cdp1 = 0;
    VLData.Element(3).cdp2 = 0;
    VLData.Element(3).cm0 = 0;
    VLData.Element(3).clmax = Vanguard.Wing.Airfoil.Clmax;
    VLData.Element(3).cl0 = Vanguard.Wing.Airfoil.Clo;
    VLData.Element(3).cla = Vanguard.Wing.Airfoil.Cla*180/pi;
    VLData.Element(3).ncpan = 6;
    VLData.Element(3).nspan = 8;
    VLData.Element(3).reflectgeometry = 'true';
    VLData.Element(3).wakelocation = 1;
    
    VLData.Element(4).Name = 'Taper2';
    VLData.Element(4).Area = (YehudiChord(taper1)+YehudiChord(taper2))/2*(taper2-taper1);
    VLData.Element(4).Span = (taper2-taper1);
    VLData.Element(4).Taper = YehudiChord(taper2)/YehudiChord(taper1);
    VLData.Element(4).Sweep = 0;
    VLData.Element(4).Dihedral = 0;
    VLData.Element(4).X.Root = 41.4725;
    VLData.Element(4).Y.Root = taper1;
    VLData.Element(4).Z.Root = 11.5;
    VLData.Element(4).Incidence.Root = InstallAngle-YehudiTwist-TaperTwist1;
    VLData.Element(4).Incidence.Tip = InstallAngle-YehudiTwist-TaperTwist1-TaperTwist2;
    VLData.Element(4).cdp0 = 0;
    VLData.Element(4).cdp1 = 0;
    VLData.Element(4).cdp2 = 0;
    VLData.Element(4).cm0 = 0;
    VLData.Element(4).clmax = Vanguard.Wing.Airfoil.Clmax;                 
    VLData.Element(4).cl0 = Vanguard.Wing.Airfoil.Clo;                  
    VLData.Element(4).cla = Vanguard.Wing.Airfoil.Cla*180/pi;
    VLData.Element(4).ncpan = 6;
    VLData.Element(4).nspan = 8;
    VLData.Element(4).reflectgeometry = 'true';
    VLData.Element(4).wakelocation = 1;
   
    VLData.Element(5).Name = 'Aileron';    
    VLData.Element(5).Area = (YehudiChord(taper2)+YehudiChord(taper3))/2*(taper3-taper2);
    VLData.Element(5).Span = (taper3-taper2);
    VLData.Element(5).Taper = YehudiChord(taper3)/YehudiChord(taper2);
    VLData.Element(5).Sweep = 0;
    VLData.Element(5).Dihedral = 0;
    VLData.Element(5).X.Root = 41.4725;
    VLData.Element(5).Y.Root = taper2;
    VLData.Element(5).Z.Root = 11.5;
    VLData.Element(5).Incidence.Root = InstallAngle-YehudiTwist-TaperTwist1-TaperTwist2;
    VLData.Element(5).Incidence.Tip = InstallAngle-YehudiTwist-TaperTwist1-TaperTwist2;
    VLData.Element(5).cdp0 = 0;
    VLData.Element(5).cdp1 = 0;
    VLData.Element(5).cdp2 = 0;
    VLData.Element(5).cm0 = 0;
    VLData.Element(5).clmax = Vanguard.Wing.Airfoil.Clmax;                 
    VLData.Element(5).cl0 = Vanguard.Wing.Airfoil.Clo;                  
    VLData.Element(5).cla = Vanguard.Wing.Airfoil.Cla*180/pi;
    VLData.Element(5).ncpan = 6;
    VLData.Element(5).nspan = 8;
    VLData.Element(5).reflectgeometry = 'true';
    VLData.Element(5).wakelocation = 1;
    
    VLData.Element(6).Name = 'Tip';
    VLData.Element(6).Area = (YehudiChord(Vanguard.Wing.Aileron)+YehudiChord(59))/2*(59-Vanguard.Wing.Aileron);
    VLData.Element(6).Span = (59-Vanguard.Wing.Aileron);
    VLData.Element(6).Taper = YehudiChord(59)/YehudiChord(Vanguard.Wing.Aileron);
    VLData.Element(6).Sweep = 0;
    VLData.Element(6).Dihedral = 0;
    VLData.Element(6).X.Root = 41.4725;
    VLData.Element(6).Y.Root = Vanguard.Wing.Aileron;
    VLData.Element(6).Z.Root = 11.5;
    VLData.Element(6).Incidence.Root = InstallAngle-YehudiTwist-TaperTwist1-TaperTwist2;
    VLData.Element(6).Incidence.Tip = InstallAngle-YehudiTwist-TaperTwist1-TaperTwist2;
    VLData.Element(6).cdp0 = 0;
    VLData.Element(6).cdp1 = 0;
    VLData.Element(6).cdp2 = 0;
    VLData.Element(6).cm0 = 0;
    VLData.Element(6).clmax = Vanguard.Wing.Airfoil.Clmax;                 
    VLData.Element(6).cl0 = Vanguard.Wing.Airfoil.Clo;                  
    VLData.Element(6).cla = Vanguard.Wing.Airfoil.Cla*180/pi; 
    VLData.Element(6).ncpan = 6;
    VLData.Element(6).nspan = 2;
    VLData.Element(6).reflectgeometry = 'true';
    VLData.Element(6).wakelocation = 1;
    
    
    % Set Flight Condition Data
    FCData.Mach  = 0.6233;  	% Freestream Mach number
    FCData.alpha = 0;       % Angle of attack (deg)
    FCData.beta  = 0;       % Sideslip angle (deg)
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
