% Instruction: Please read through the code and fill in blanks 
% (marked by ***). Note that you need to do so for every involved
% function, i.e., m files. 

%% Optional overhead
clear; % Clear the workspace
close all; % Close all windows

%% Optimization settings
% Here we specify the objective function by giving the function handle to a
% variable, for example:
f = @(x) x(1)^2 + (x(2)-3)^2; % replace with your objective function
% In the same way, we also provide the gradient of the 
% objective:
df = @(x) [2*x(1), 2*(x(2)-3)]; % replace accordingly

g = @(x) [x(2)^2-2*x(1); (x(2)-1)^2 + 5*x(1) - 15]; %constraints are written in the form _ <= 0
dg = @(x) [-2, 2*x(2);
    5, 2*(x(2)-1)];

% Note that explicit gradient and Hessian information is only optional.
% However, providing these information to the search algorithm will save
% computational cost from finite difference calculations for them.

% % Specify algorithm
opt.alg = 'matlabqp'; % 'myqp' or 'matlabqp'

% Turn on or off line search. You could turn on line search once other
% parts of the program are debugged.
opt.linesearch = false; % false or true

% Set the tolerance to be used as a termination criterion:
opt.eps = 1e-3;

% Set the initial guess:
x0 = [1;1];

% Feasibility check for the initial point.
if max(g(x0)>0) 
    errordlg('Infeasible intial point! You need to start from a feasible one!');
    return
end
%% Run optimization
% Run your implementation of SQP algorithm. See mysqp.m
solution = mysqp(f, df, g, dg, x0, opt);

%% Report
report(solution,f,g);


 

