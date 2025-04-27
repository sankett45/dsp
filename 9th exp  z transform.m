clc;
clear all;
close all;

%% Parameters
n = -70:1:70;
seq_len = length(n);
x = zeros(1,seq_len);

%% exponential
x = exp(-0.1*n) + exp(0.1*n);
subplot(2,2,[1,2]); plot(n,x);
omega = linspace(-pi,pi,100);

z = [];
for r = linspace(0,3,100)
    z = [z;r.*exp(j*omega)];
end

xtemp = [];
X = [];
Xfinal = [];
for c = 1:length(z)
    for a = 1:length(z)
        for b = 1:length(n)
            xtemp = [xtemp x(b).*(z(c,a).^(-n(b)))];
        end
        xtemp = sum(xtemp);
        X = [X xtemp];
        xtemp = [];
    end
    Xfinal = [Xfinal;X];
    X = [];
end

subplot(2,2,[3,4]);
surf(real(z), imag(z), 10*log10(abs(Xfinal)), 'linestyle', 'none');
xlabel('Re(z)');
ylabel('Im(z)');
zlabel("|X(z)|");
