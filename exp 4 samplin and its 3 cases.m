clc;
close all;
clear all;
t = -100:1:100;
fm = 0.02;
x = cos(2*pi*fm*t);
subplot(2,3,[1,2,3]);
plot(t,x);
xlabel("time (sec)");
ylabel("x(t)");
title("Continous Time Signal");

%% fs<2fm
fs1 = 0.01;
n = -20:20;
x1 = cos(2*pi*fm/fs1*n);
subplot(2,3,4);
stem(n,x1);
xlabel("n");
ylabel("X[n]");
title("fs < 2fm Signal");
hold on;
subplot(2,3,4);
plot(n,x1,"k:");
hold off;

%% fs = 2fm
fs2 = 0.04;
x2 = cos(2*pi*fm/fs2*n);
subplot(2,3,5);
stem(n,x2);
xlabel("n");
ylabel("X[n]");
title("fs = 2fm Signal");
hold on;
subplot(2,3,5);
plot(n,x2,"k:");
hold off;

%% fs > 2fm
fs3 = 0.5;
x3 = cos(2*pi*fm/fs3*n);
subplot(2,3,6);
stem(n,x3);
xlabel("n");
ylabel("X[n]");
title("fs > 2fm Signal");
hold on;
subplot(2,3,6);
plot(n,x3,"k:");
hold off;