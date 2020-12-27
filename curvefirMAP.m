%start code for project #1: linear regression
%pattern recognition, CSE583/EE552
%Weina Ge, Aug 2008
%Christopher Funk, Jan 2018
%Bharadwaj Ravichandran, Jan 2020

%Your Details: (The below details should be included in every matlab script
%file that you create)
%{
    Name: Kruthika Modepalli
    PSU Email ID: kkm5801@psu.edu
    Description: (A short description of what this script does).
%}

addpath export_fig/

%load the data points
load data.mat

% we are calculating the values of optimal w*, the y(x,w*) function here
X = [[x.^1]' [x.^2]' [x.^3]' [x.^4]' [x.^5]' [x.^6]' [x.^7]' [x.^8]' [x.^9]'];
T = t';
beta= 11.1;
alpha= 0.005;
lm=alpha/beta;
I=eye(9);
W1=(X' * X) + (I *lm)
Ws = W1 \ (X' * T);
yn= X * Ws;
E = abs(0.5 * beta * ((X * Ws) - T)' * ((X * Ws) - T) + (0.5 * alpha * (Ws' * Ws)))


%plot the ground truth curve
figure(3)
clf
hold on;
xx = linspace(1,4*pi,10);
yy = sin(.5*xx);
err = ones(size(xx))*(1/ sqrt(beta));
% plot the x and y color the area around the line by err (here the std)
h = shadedErrorBar(x, y, err, {'b-','color','b','LineWidth',2},0);
%plot the noisy observations
plot(x,t,'ro','MarkerSize',8,'LineWidth',1.5);
%hold off; 
% Make it look good
grid on;
set(gca,'FontWeight','bold','LineWidth',2)
xlabel('x')
ylabel('t')

%plotting the predicted curve here
plot(x,yn,'LineWidth',1.5, 'color', 'g');
hold off;
% Save the image into a decent resolution
export_fig sampleplot4 -png -transparent -r150






