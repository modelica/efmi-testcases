within eFMI_TestCases.S003_VehicleModel.PlantModels;
partial model VehicleEquations
  "Single track model with roll augmentation (Odenthal)"
  extends Modelica.Blocks.Icons.Block;

  import SI = Modelica.SIunits;

  // Driven wheels:
  parameter SI.Force FdF = 0.3*50
    "Drive force of front tire";

  // Parameters according to table 6.4:
  parameter SI.Mass m = 14300
    "Overall vehicle mass";
  parameter SI.Mass m2 = 12487
    "Sprung mass";
  parameter SI.Length h = 1.15
    "Nominal height of CG2 over roll axis";
  parameter SI.Length lF = 1.95
    "Distance front axle to CG1";
  parameter SI.Length lR = 1.54
    "Distance rear axle to CG1";
  parameter SI.Acceleration g = 9.81
    "Acceleration due to gravity (= Modelica.Constants.g_n)";
  parameter SI.Inertia Jx2 = 24201
    "Roll moment of inertia, sprung mass m2";

  /*
  Variables of tire operating in linear area and within small angles, i.e.,
  cos(.) = 1, sin(.) = 0
  Road conditions:
    dry road: mu = 1.0
    wet road: mu = 0.5
    ice     : mu = 0.15
  */
  parameter Real mu(unit="1") = 1
    "Nominal road adhesion coefficient";
  parameter Real cF(unit="N/rad") = 582e3
    "Nominal front cornering stiffness (at nominal load and mu=1)";
  parameter Real cR(unit="N/rad") = 783e3
    "Nominal rear cornering stiffness (at nominal load and mu=1)";

  parameter SI.Inertia Jz1 = 3654
    "Deduced: Yaw moment of inertia, chassis mass m1";
  parameter SI.Inertia Jz2 = 34917
    "Deduced: Yaw moment of inertia, sprung mass m2";
  parameter SI.Inertia Jy2 = 0.1*34917
    "Deduced: pitch moment of inertia, sprung mass m2";
  parameter SI.Force FzR = m*g*lF/(lR+lF)
    "Deduced: Static load on rear tire";
  parameter SI.Force FzF = m*g - FzR
    "Deduced: Static load on front tire";
  parameter SI.RotationalSpringConstant cphi = 457e3
    "Roll stiffness of passive suspension";
  parameter SI.RotationalDampingConstant dphidot = 100e3
    "Roll damping of passive suspension";

  parameter Real b1 = 0.2;
  parameter Real b2 = 0.1;

  constant SI.Angle deltaR = 0.0
    "Rear wheel steering angle (=0 since no rear wheel steering considered in equations below)";
  parameter SI.Force FdR = 0
    "Drive force of rear tire";

// Inputs, to set somehow:
  SI.Angle delta
    "Front wheel steering angle";
  SI.Force FyD
    "Disturbance side force";

// Vehicle variables:
  SI.Angle betaF
    "Front chassis sideslip angle, equ. (6.3.13)";
  SI.Angle betaR
    "Rear chassis sideslip angle, equ. (6.3.13)";
  SI.Angle alphaF
    "Sideslip angle of front tire, equ. (6.3.10)";
  SI.Angle alphaR
    "Sideslip angle of rear tire, equ. (6.3.10)";

  SI.Torque MzD
    "Disturbance yaw torque";
  SI.Torque MxD
    "Disturbance roll torque ";

  SI.Angle beta
    "Deduced: Vehicle sideslip angle (could be linearized to beta = vy/v)";
  SI.Velocity v
    "Deduced: Vehicle absolute velocity (could be linearized to v = vx)";

  SI.Force FlV
    "Deduced: Longitudinal force of front tire, limited due to Kamm's circle";
  SI.Force FsV
    "Deduced: Lateral force of front tire, cf. equ. (6.4.2)";
  SI.Force FsH
    "Deduced: Lateral force of rear tire, cf. equ. (6.4.2)";

  SI.Torque Fphi
    "Torque term due to suspension stiffness";
  SI.Torque Fphidot
    "Torque term due to suspension damping";

// States:
  Real sx, sy, psi, phi;  // z = {position x, position y, yaw angle, roll angle} w.r.t vehicle frame
  Real vx, vy, r, phidot; // der(z) = {velo x, velo y, yaw rate, roll rate} w.r.t vehicle frame

// Intermediate variables:
  Real M[4,4]
    "Generalized mass matrix";
  Real k[4]
    "Generalized gyroscopic and centrifugal forces";
  Real Q[4]
    "Generalized applied forces";

initial equation
  {sx,sy,psi,phi} = {0,0,0,0};
  {vx,vy,r,phidot} = {10,0,0,0};

equation
  MzD = b1*FyD;
  MxD = b2*FyD;

  betaF = beta + lF*r/v;
  betaR = beta - lR*r/v;
  alphaF = delta - betaF;
  alphaR = deltaR - betaR;

  beta = Modelica.Math.atan2(vy, vx);
  v = Modelica.Math.Vectors.length({vx,vy});

  FlV = FdF; // min(FdF, sqrt(mu*FzF - FsV));
  FsV = mu*cF*alphaF;
  FsH = mu*cR*alphaR;
  Fphi = cphi*phi;
  Fphidot = dphidot*phidot;

  der({sx,sy,psi,phi}) = {vx,vy,r,phidot};

  M = [m, 0, h*m2*sin(phi), 0;
       0, m, 0, -h*m2*cos(phi);
       h*m2*sin(phi), 0, Jz1+Jz2*cos(phi)^2+(Jy2+h^2*m2)*sin(phi)^2, 0;
       0, -h*m2*cos(phi), 0, Jx2+h^2*m2];

  k = {-m*r*vy + 2*h*m2*phidot*r*cos(phi),
       m*r*vx + h*m2*(phidot^2+r^2)*sin(phi),
       r*sin(phi)*(-h*m2*vy + 2*(Jy2-Jz2+h^2*m2)*phidot*cos(phi)),
       -r*cos(phi)*(h*m2*vx +(Jy2-Jz2+h^2*m2)*r*sin(phi))};

  Q = {FlV*cos(delta) - FsV*sin(delta),
       FsV*cos(delta) + FlV*sin(delta) + FsH + FyD,
       lF*(FsV*cos(delta) + FlV*sin(delta)) - lR*FsH + MzD,
       h*m2*g*sin(phi) - Fphi - Fphidot + MxD};

  M*der({vx,vy,r,phidot}) + k = Q;
end VehicleEquations;
