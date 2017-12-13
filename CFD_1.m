plot(t(:,1),A(:,1));
xlabel('Time (t)')
ylabel('X(t)');

V=A(:,1);
t=t(:,1);

Tsm = mean(diff(t)); %mean sampling frequency (seconds)
Tss = std(diff(t)); % standard deviation of time differences
Tsc = Tss/Tsm;

Fs = 1/Tsm;

L = length(t);
n = 2^nextpow2(L);
Y = fft(V,n);

f = Fs*(0:(n/2))/n;
P = abs(Y/n); 

plot(f,P(1:n/2+1));
xlabel('Frequency (f) Hz')
ylabel('Velocity Y (Vy), m/s') 

[maxYValue, indexAtMaxY] = max(P(1:n/2+1));
freq = f(indexAtMaxY)
Period=1/freq