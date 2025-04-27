%% Experiment 10A
%Visualization of z plane
close all;

w = linspace(-pi,pi,1001);
H = [];
z = [];
for r = linspace(0,3,1001)
    z = [z;r.*exp(j*w)];
end
H = (2.*z)./(2.*z-1);
mesh(real(z), imag(z), abs(H));
grid on;
xlabel("Re(z)");
ylabel("Im(z)");
zlabel("H(z)");