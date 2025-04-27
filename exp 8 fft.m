%% N Point DFT using DIT Radix-2 FFT
clear all;
close all;
clc;
x = input("Enter sequence: ");
p = nextpow2(length(x));
x = [x zeros(1,((2^p)-length(x)))];
N = length(x);
S = log2(N);
X = fft(x);
x = bitrevorder(x);
for stage = 1:S
    p = 1;
    q = 1+2^(stage-1);
    n = 0;
    while(n<=(2^(stage-1)-1) && q<=N)
        w = exp(-j*2*pi*n/(2^stage));
        y = x(p) + w*x(q);
        z = x(p) - w*x(q);
        x(p) = y;
        x(q) = z;
        p = p+1;
        q = q+1;
        n = n+1;
        if(rem(q,2^stage) == 1)
            p = p + 2^(stage-1);
            q = q + 2^(stage-1);
            n = 0;
        end
    end
end
subplot(2,1,1);
stem(x);
title("Radix-2 FFT");
xlabel("n");
ylabel("X(k)");
subplot(2,1,2);
stem(X);
title("FFT CMD");
xlabel("n");
ylabel("X(k)");

%% Assignment
% Implement 8 point FFT using Radix-2 DIF FFT