% number of iterations
n_G  = 40;
n_FM = 40;
n_Q  = 250;

%% G sequence
G = zeros(n_G,1);
for i = 1:n_G-1
    G(i+1) = i - G(G(i)+1); % G(n) = n - G(G(n-1)) (shifted to 1-based indexing)
end

figure; subplot(3,1,1);
plot(G, '.-'); grid on; title('Hofstadter G'); xlabel('n'); ylabel('G');

%% Female and Male sequences
F = ones(n_FM,1);    % F(0)=1
M = zeros(n_FM,1);   % M(0)=0
for i = 1:n_FM-1
    F(i+1) = i - M(F(i)+1); % F(n) = n - M(F(n-1))
    M(i+1) = i - F(M(i)+1); % M(n) = n - F(M(n-1))
end

subplot(3,1,2);
plot(F, '.-'); hold on; plot(M, '.-'); grid on;
legend('F','M','Location','northwest'); title('Hofstadter Female/Male'); xlabel('n');

%% Q sequence
Q = ones(n_Q,1);
Q(1) = 1;   % Q(0)=1
Q(2) = 1;   % Q(1)=1
for i = 2:n_Q-1
    Q(i+1) = Q(i-Q(i)+1)+Q(i-Q(i-1)+1); % Q(n)=Q(n-Q(n-1))+Q(n-Q(n-2))
end

subplot(3,1,3);
plot(Q, '.-'); grid on; title('Hofstadter Q'); xlabel('n'); ylabel('Q');
