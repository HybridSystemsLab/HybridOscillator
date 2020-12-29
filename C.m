function [v] = C(u) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file                Author: Ricardo Sanfelice
%
% Project: Simulation of a hybrid system
%
% Name: D.m
%
% Description: Flow set
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% state
x1 = u(1);
x2 = u(2);
tau = u(3);

%if (x1 >= 0)  % flow condition
    v = 1;  % report flow
%else
%    v = 0;   % do not report flow
%end