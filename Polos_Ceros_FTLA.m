% Coeficientes del numerador
num = [0.006471];

% Coeficientes del denominador
den = [25.46, 1.158, 0.006471];

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

title('Mapa de Polos y Ceros FTLA');

