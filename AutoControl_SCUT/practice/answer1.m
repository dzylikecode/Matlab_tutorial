%%
num = [5, 30, 55, 30]
den = [1, 9, 33, 65]
[z, p, k] = tf2zp(num, den)

%%
den = [1 3 5 9 8 6 4];
p = roots(den);
disp(p);

posi = find(real(p) > 0);
num_posi = length(posi);
disp(num_posi);

%%
t = 0:0.01:12;
wn = 10;
num = [1 * wn^2];

for zeta = [0.1:0.1:2, 1.2, 1.5, 2]
    den = [1, 2 * zeta * wn, 1 * wn^2];
    [y, x, t] = step(num, den, t);
    plot(t, y, 'DisplayName', num2str(zeta))
    hold on
    grid on
end

legend('show')

%%
t = 0:0.01:12;
wn = 10;
num = [1 * wn^2];

for zeta = [0.1:0.1:2, 1.2, 1.5, 2]
    den = [1, 2 * zeta * wn, 1 * wn^2];
    [y, x, t] = step(num, den, t);
    plot(t, y, 'DisplayName', [num2str(zeta), '-', num2str(wn)])
    hold on
    grid on
end

t = 0:0.01:12;
zeta = 0.707;

for wn = [2, 4, 6, 8, 10]
    num = [1 * wn^2];
    den = [1, 2 * zeta * wn, 1 * wn^2];
    [y, x, t] = step(num, den, t);
    plot(t, y, 'DisplayName', [num2str(zeta), '-', num2str(wn)])
    hold on
    grid on
end

legend('show')
