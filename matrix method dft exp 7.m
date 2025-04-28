clear all; % Clear all variables from workspace
close all; % Close all figure windows
clc; % Clear command window

% Input the signal
x = input("Enter input signal: ");
N = length(x); % Get the length of the input signal

%% Matrix Method DFT
% Initialize the DFT matrix (W matrix) for DFT calculation
W = zeros(N, N);

% Construct the DFT matrix
for k = 0:N-1
    for n = 0:N-1
        W(n+1, k+1) = exp(-1j*2*pi*n*k/N); % DFT formula with negative exponent
    end
end

% Perform the DFT (multiply W matrix with input signal)
X = W * x.';  % DFT result (X)

%% Matrix Method IDFT
% Initialize the matrix for IDFT calculation (W_idft matrix)
W_idft = zeros(N, N);

% Construct the IDFT matrix (positive exponent for IDFT)
for n = 0:N-1
    for k = 0:N-1
        W_idft(n+1, k+1) = exp(1j*2*pi*n*k/N); % IDFT formula with positive exponent
    end
end

% Perform the IDFT (multiply W_idft matrix with the DFT result and scale by 1/N)
x_reconstructed = (1/N) * W_idft * X; % Reconstructed signal after IDFT

%% Plots
figure; % Create a new figure window

% Plot the original signal
subplot(2,2,[1,2]);
stem(x); % Stem plot for original signal
title("x[n]"); % Title of the plot

% Plot the DFT result (real part of X)
subplot(2,2,3);
stem(real(X)); % Stem plot for real part of the DFT result
title("Matrix Method DFT"); % Title of the plot

% Plot the reconstructed sequence after applying IDFT
subplot(2,2,4);
stem(real(x_reconstructed)); % Stem plot for the real part of the reconstructed signal
title("Reconstructed Sequence from IDFT"); % Title of the plot
