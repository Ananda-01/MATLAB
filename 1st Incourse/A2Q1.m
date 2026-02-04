clc
clear all
close all

% BM path simulation on the interval [0,1]

%randn generates random numbers from a standard normal distribution N(0,1)
randn('state',100) 

T=1;N=1000; % N = number of subinterval
dt=T/N;
t=0:dt:T;
w=[0 cumsum(sqrt(dt)*randn(1,N))]; % Brownian motion construction
plot(t,w,'r')
xlabel('t')
ylabel('B(t)')
