function [v] = D(u) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file                Author: Ricardo Sanfelice
%
% Project: Simulation of a hybrid system
%
% Name: D.m
%
% Description: Jump set
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% state
x1 = u(1);
x2 = u(2);

if (x2 <= -x1 && x1 >= 0) || (x2 <= x1 && x1 <= 0)  % jump condition
    v = 1;  % report jump
else
    v = 0;   % do not report jump
end

