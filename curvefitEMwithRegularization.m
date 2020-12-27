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
    Description: Curve fitting using error minimization with Regularization
    
%}

addpath export_fig/

%load the data points
load data.mat

npts = 10; %number of sample points -- change this number when you want to vary the sample size
x = linspace(1,4*pi,npts);
y = sin(.5*x);

%define the noise model
nmu = 0;
nsigma = 0.3;
noise = nmu+nsigma.*randn(1,npts); %generate npts number of samples from the N(nmu,nsigma^2)
t  = y + noise; %noisy observations

% we are calculating the values of optimal w*, the y(x,w*) function here
X = [[x.^0]' [x.^1]' [x.^2]' [x.^3]' [x.^4]' [x.^5]' [x.^6]'];
T = t';
I = ones(7);
lm = exp(-15)
W1 = ((X' * X) + (I * lm))
Wstar = W1 \ (X' * T)
yn = X * Wstar;
err = (0.5 * ((X * Wstar) - T)' * ((X * Wstar) - T)) + (Wstar' * Wstar) 

%plot the ground truth curve
figure(3)
clf
hold on;
xx = linspace(1,4*pi,10);
yy = sin(.5*xx);
error = ones(size(xx))* 0.3;

% plot the x and y color the area around the line by err (here the std)
h = shadedErrorBar(x, y, error, {'b-','color','b','LineWidth',2},0);

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
export_fig sampleplot2 -png -transparent -r150






