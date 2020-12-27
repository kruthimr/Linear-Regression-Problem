%start code for project #1: linear regression
%pattern recognition, CSE583/EE552
%Weina Ge, Aug 2008
%Christopher Funk, Jan 2018
%Bharadwaj Ravichandran, Jan 2020

%Your Details: (The below details should be included in every matlab script
%file that you create)
%{
    Name: Modepalli Kruthika 
    PSU Email ID: kkm5801@psu.edu
    Description: Curve fitting using error minimization.
%}

addpath export_fig/

%load the data points
load data.mat

% we are calculating the values of optimal w*, the y(x,w*) function here
X=[[x.^0]' [x.^1]' [x.^2]' [x.^3]' [x.^4]' [x.^5]' [x.^6]'];
T= t';

Wstar = (X' * X)\(X' * T)
ynew= X * Wstar;
err = (0.5 * ((X * Wstar) - T)' * ((X * Wstar) - T));

xx = linspace(1,4*pi,10);
yy = sin(.5*xx);
error = ones(size(xx)) * 0.3;

%plot the ground truth curve
figure(1)
clf
hold on;

% plot the x and y color the area around the line by err (here the std)
h = shadedErrorBar(x, y, error, {'b-','color','b','LineWidth',2},0);

%plot the noisy observations
plot(x,t,'ro','MarkerSize',8,'LineWidth',1.5);

% Make it look good
grid on;
set(gca,'FontWeight','bold','LineWidth',2)
xlabel('x')
ylabel('t')

%plotting the predicted curve here
plot(x,ynew,'LineWidth',1.5, 'color', 'g');
annotation('textbox', [0.80, 0.80, 0.1, 0.1], 'String', 'N=10   M=6')
hold off;

% Save the image into a decent resolution
export_fig sampleplot -png -transparent -r150






