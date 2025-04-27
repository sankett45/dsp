%% Experiment 10D
%% Effect of distance of pole from unit circle on magnitude
close all;
w = linspace(-pi, pi, 1001);
x,z = [];
r = 1;
z = r.*exp(j*w);
H = z./(z-0.5);
figure;
subplot(2,1,1);
plot(w, abs(H));
xlabel("\omega");
ylabel("Magnitude\H(omega)");
grid on;
subplot(2,1,2);
plot(w, angle(H));
xlabel("\omega");
ylabel("Angle\H(omega)");

%% Another
H = z./(z-0.99);
figure;
subplot(2,1,1);
plot(w, abs(H));
xlabel("\omega");
ylabel("Magnitude\H(omega)");
grid on;
subplot(2,1,2);
plot(w, angle(H));
xlabel("\omega");
ylabel("Angle\H(omega)");

%% Another
H = z./(z-0.1);
figure;
subplot(2,1,1);
plot(w, abs(H));
xlabel("\omega");
ylabel("Magnitude\H(omega)");
grid on;
subplot(2,1,2);
plot(w, angle(H));
xlabel("\omega");
ylabel("Angle\H(omega)");