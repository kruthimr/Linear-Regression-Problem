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

npts = 10; %number of sample points -- change this number when you want to vary the sample size
x = linspace(1,4*pi,npts);
y = sin(.5*x);

%define the noise model
nmu = 0;
nsigma = 0.3;
noise = nmu+nsigma.*randn(1,npts); %generate npts number of samples from the N(nmu,nsigma^2)
t  = y + noise; %noisy observations

% we are calculating the values of optimal w*, the y(x,w*) function here

X = [[x.^0]' [x.^1]' [x.^2]' [x.^3]' [x.^4]' [x.^5]' [x.^6]' [x.^7]' [x.^8]'];
T = t';
Wml = (X' * X)\(X' * T);
ynew2 = X * Wml;
bml = (((X * Wml) - T)' * ((X * Wml) - T))\ size(X,1);
E = abs(-0.5 * bml * ((X * Wml) - T)' * ((X * Wml) - T)) + ((size(X,1)/2) * log(bml)) - ((size(X,1)/2) * log(2 * pi));


%plot the ground truth curve
figure(3)
clf
hold on;
xx = linspace(1,4*pi,10);
yy = sin(.5*xx);
err = ones(size(xx))*(1/sqrt(bml));
%
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
plot(x,ynew2,'LineWidth',1.5, 'color', 'g');
hold off;
% Save the image into a decent resolution
export_fig sampleplot3 -png -transparent -r150






