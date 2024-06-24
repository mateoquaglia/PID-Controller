num = 0.006472;
den = [25.46, 1.158, 0.006208];
sys = tf(num, den);

figure;
rlocus(sys);
hold on;

% Agregar los polos
polos = [-0.0390, -0.0065];
plot(polos, 'rx', 'MarkerSize', 10, 'LineWidth', 2);

% Dibujar las asíntotas
asintota0 = linspace(0, 2*pi, 100);
asintota1 = linspace(pi, 3*pi, 100);
asintota0 = tan(asintota0) * real(polos(1));
asintota1 = tan(asintota1) * real(polos(1));
plot(asintota0, 'g--', 'LineWidth', 2);
plot(asintota1, 'g--', 'LineWidth', 2);

% Agregar el centroide y el punto de desprendimiento
centroide = -0.02275;
desprendimiento = -0.022741;
plot(centroide, 0, 'b*', 'MarkerSize', 10);
plot(desprendimiento, 0, 'bo', 'MarkerSize', 10);

title('Lugar de las raíces y puntos de interés');
legend('Lugar de las raíces', 'Polos', 'Asíntotas', 'Centroide', 'Punto de desprendimiento');
hold off;