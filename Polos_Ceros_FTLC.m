% Coeficientes del numerador
num = [0.1648, 3.156, 0.1433, 0.0007678];

% Coeficientes del denominador
den = [648.2, 1.245e04, 1129, 71.34, 2.079, 0.01041];

% Crear la función de transferencia
sys = tf(num, den);

% Encontrar los ceros de la función de transferencia
ceros = zero(sys);

% Encontrar los polos de la función de transferencia
polos = pole(sys);

% Imprimir los ceros y polos
disp('Ceros:');
disp(ceros);
disp('Polos:');
disp(polos);
figure;

pzmap(sys);

title('Mapa de Polos y Ceros');

