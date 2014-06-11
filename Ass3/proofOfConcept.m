pvm = load('pvm.txt');
pvm = center(pvm);
[M, S] = factorization(pvm);
plot3(S(1, :), S(2, :), S(3, :), 'bo');
