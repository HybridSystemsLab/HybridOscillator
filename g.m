function out = g(u)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file                Author: Ricardo Sanfelice
%
% Project: Simulation of a hybrid system
%
% Name: g.m
%
% Description: Jump map
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global gamma delta;

% state
x1 = u(1);
x2 = u(2);
x = [x1;x2];

s = -pi/4;
R = [cos(s), -sin(s); sin(s), cos(s)];

udoptimal = gamma*(norm(x)-delta)+delta;

% jump map
xplus = R*[0;udoptimal];

out = [xplus;0];