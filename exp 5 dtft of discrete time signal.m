clear all;
close all;
clc;

% Define the range of n
n = -50:50;

% Prompt the user for the signal type
disp('Select the type of signal:');
disp('1. Unit Impulse');
disp('2. Unit Step');
disp('3. Exponential');
disp('4. Sine');
disp('5. Rectangular');
disp('6. Sinc');
signalChoice = input('Enter the number corresponding to the signal: ');

% Initialize the signal array based on user input
signalName = '';
x = [];  % Signal initialization

switch signalChoice
    case 1  % Unit Impulse
        % Unit Impulse Sequence
        x = (n == 0); % Impulse function: 1 at n=0, 0 elsewhere
        signalName = 'Unit Impulse';
        
    case 2  % Unit Step
        % Unit Step Sequence
        x = zeros(size(n));
        x(n >= 0) = 1;
        signalName = 'Unit Step';
        
    case 3  % Exponential
        % Exponential Sequence
        x = zeros(size(n));
        x(n >= 0) = (0.5).^n(n >= 0);
        signalName = 'Exponential';
        
    case 4  % Sine
        % Sine Sequence
        x = sin(2*pi*1/10*n);
        signalName = 'Sine';
        
    case 5  % Rectangular
        % Rectangular Sequence
        x = zeros(size(n)); 
        x(n > -5 & n < 5) = 1;
        signalName = 'Rectangular';
        
    case 6  % Sinc
        % Sinc Sequence
        x = zeros(size(n)); 
        x(n == 0) = 1;  % Define Sinc(0) = 1 to avoid division by zero at n=0
        x(n ~= 0) = sin(pi*n(n ~= 0)/5) ./ (pi*n(n ~= 0)/5); % Correct Sinc definition
        signalName = 'Sinc';
        
    otherwise
        disp('Invalid input. Please choose a valid signal.');
        return;
end

% Create figure for plotting
figure('Name', 'DTFT and IDTFT');

%% Plot the signal
subplot(3,2,1:2);
stem(n, x, 'filled');
xlabel('n');
ylabel('x[n]');
title([signalName ' Sequence']);

% Define omega range for DTFT
omega = -4*pi:0.01:4*pi;
X = zeros(size(omega));  % Initialize X (DTFT)

% Calculate DTFT of the selected signal
for a = 1:length(omega)
    for b = 1:length(n)
        % Perform DTFT computation for the selected signal
        X(a) = X(a) + x(b) * exp(-1j * omega(a) * n(b)); % DTFT formula
    end
end

% Magnitude Plot
magx = abs(X);
subplot(3,2,3:4);
plot(omega/pi, magx); grid on;
xlabel("frequency in pi");
ylabel("|X(ω)|");
title("Magnitude Plot");

% Phase Plot
angx = angle(X);
subplot(3,2,5:6);
plot(omega/pi, angx); grid on;
xlabel("frequency in pi");
ylabel("∠X(ω)");
title("Phase Plot");