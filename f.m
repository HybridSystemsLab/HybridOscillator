function out = f(u)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file                Author: Ricardo Sanfelice
%
% Project: Simulation of a hybrid system
%
% Name: f.m
%
% Description: Flow map
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global omega uc

% state
x1 = u(1);
x2 = u(2);
tau = u(3);

if x1 > 0
    ucoptimal = -1;
else
    ucoptimal = 1;
end

% flow map
x1dot = -omega*x2*ucoptimal;
x2dot = omega*x1*ucoptimal;

out = [x1dot; x2dot; 1];