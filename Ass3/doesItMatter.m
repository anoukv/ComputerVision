pvm = load('pvm.txt');

x = pvm(1:2:end, :);
y = pvm(2:2:end, :);

pvmNew = [x;y];
pvmNew = center(pvmNew);
[M, S] = factorizaion2(pvmNew);
plot3(S(1, :), S(2, :), S(3, :), 'bo');

pvmNew == pvm
