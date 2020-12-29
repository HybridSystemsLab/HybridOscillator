%--------------------------------------------------------------------------
% Project: Hybrid Feedback Control book
% Description: CLF-based Control of Controlled Oscillator
% https://hybrid.soe.ucsc.edu/software
% http://hybridsimulator.wordpress.com/
% Filename: run.m
% Set of simulation files created and edited by 
% Ricardo Sanfelice
%--------------------------------------------------------------------------

 clear all 

%%%%%%%% INITIALIZE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% initial conditions                                                  
x0 = [2;0.9;0];                                                             

% global constants
global omega gamma uc r delta
omega = 5;
uc = 1;
gamma = 0.6;
r = 0.15;
delta = 0.05;
% check condition on parameters
exp(pi/(2*omega))*gamma < 1

% simulation horizon
T = 1;
J = 5;

% rule for jumps
% rule = 1 -> priority for jumps
% rule = 2 -> priority for flows
% rule = 3 -> no priority, random selection when simultaneous conditions (Simulink only)
rule = 1;

%solver tolerances
RelTol = 1e-8;
MaxStep = .001;

%%%%%%%%%%%%%%%%%%%% SIMULATE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Comment one of these out to use the other method of simulation

% 1) simulate using hybridsolver
[t x j] = hybridsolver( @f,@g,@C,@D,x0,T,J,rule);

% 2) simulate using HybridSimulator
%sim('HybridSimulator')

%%%%%%%%%%%%%%%%%%%%% POSTPROCESSING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x1 = x(:,1);
x2 = x(:,2);
tau = x(:,3);

figure(1) % height
clf
subplot(2,1,1),plotflows(t,j,x1)
grid on
ylabel('x1')

subplot(2,1,2),plotjumps(t,j,x1)
grid on
ylabel('x1')

figure(2) % velocity
clf
subplot(2,1,1),plotflows(t,j,x2)
grid on
ylabel('x2')

subplot(2,1,2),plotjumps(t,j,x2)
grid on
ylabel('x2')

figure(3) % planar plot
clf
%plotHybridArc(x1,j,x2,[],'b');
plotHarc(x1,j,x2,[],'b');
hold on
plot(x1(1),x2(1),'b*')

%plot(x1,x2,'r')
grid on
ylabel('x2')
ylabel('x1')
axis([-2 2 -2 2])
axis equal
ezplot('y=x')
ezplot('y=-x')

% add r-level set of V

% V = 1/omega*(x1^2 + x2^2)
% r = 0.15
% omega = 5
% and delta = 0.05
%\frac{1}{\omega}\arcsin\left(\frac{\sqrt{2}}{2}\frac{|\xp_1|+\xp_2}{|\xp|} \right)
%(abs(x)+y)/sqrt(x^2+y^2)
figA=ezplot('exp(1/5*asin(sqrt(2)/2)*(abs(x)+y)/sqrt(x^2+y^2))*(x^2+y^2)=0.15')
set(figA,'color','red','LineStyle', ':','LineWidth',1.5);
figB=ezplot('x^2+y^2=0.05')
set(figB,'color','black','LineStyle', '--','LineWidth',1);
axis equal
set(gca,'FontSize', 10)
grid on
xlabel('$z_1$','Interpreter','latex')
ylabel('$z_2$','Interpreter','latex')
hYLabel = get(gca,'YLabel');
set(hYLabel, 'FontSize', 14)
set(hYLabel,'rotation',0)
hXLabel = get(gca,'XLabel');
%set(hXLabel,'rotation',0)
set(hXLabel, 'FontSize', 14)
title('')
axis([-2.5 2.5 -2.5 2.5])

print -depsc -tiff -r300 PlanarSimulation.eps