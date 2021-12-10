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
opt.alg = 'myqp'; % 'myqp' or 'matlabqp'

% Turn on or off line search. You could turn on line search once other
% parts of the program are debugged.
opt.linesearch = true; % false or true

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
solution = cell2mat(struct2cell(solution)); %convert structure to matrix


%% Report
% report(solution,f,g);

hold on;
y = -10:.01:10; 
x1 = (y.^2)/2; % constraint g1 
x2 = ((y-1).^2 - 15)/-5; % constraint g2

Li = x1 <= x2; 
% plot(x1, y, x2, y)
p = patch([x1(Li) fliplr(x2(Li))], [y(Li) fliplr(y(Li))], 'g'); % plot green shading to show feasible region
p.FaceAlpha = 0.2; % set transparency to 0.2

plot(solution(1,:),solution(2,:));
[numVars, numSols] = size(solution);
xlabel('x_1');
ylabel('x_2');
xlim([-.1 3]);
ylim([-2 2.5]);
title('Solution Iterations');
grid;

hold off;

obj = zeros(1,numSols);
for i = 1:numSols
    obj(i) = f(solution(:,i));
end

figure
plot(obj);
xlabel('Iteration');
ylabel('Objective Function Value');
title('Objective Function Value over Iterations');
grid;

grad = g(solution(:,end));

solReport = 'The solution to the optimization problem is [x_1 , x_2] = [%4.3f , %4.3f].\n'; 
gradReport = 'The gradient at this point is [%4.3f, %4.3f].\n';
objReport = 'The value of the objective function at this point is %4.3f.\n';
fprintf(solReport,solution(1,end),solution(2,end));
fprintf(gradReport,grad(1,end),grad(2,end));
fprintf(objReport, obj(end));
