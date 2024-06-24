% suponemos datos muy simplificados para realizar el estudio de la curva de histéresis
h_subida = [0.05 0.10 0.15 0.20 0.25 0.30 0.35 0.40 0.45 0.50 0.45 0.40 0.35 0.30 0.25];
V_subida = [0.70 1.30 1.90 2.50 3.10 3.70 4.30 4.90 5.50 6.10 5.50 4.90 4.30 3.70 3.10];

h_bajada = [0.50 0.45 0.40 0.35 0.30 0.25 0.20 0.15 0.10 0.05 0.10 0.15 0.20 0.25 0.30];
V_bajada = [6.00 5.50 5.00 4.50 4.00 3.50 3.00 2.50 2.00 1.50 2.00 2.50 3.00 3.50 4.00];

% graficar la curva de histéresis
figure;
plot(h_subida, V_subida, '.-', 'DisplayName', 'Subida');
hold on;
plot(h_bajada, V_bajada, '.-', 'DisplayName', 'Bajada');
xlabel('Altura (mts)');
ylabel('Voltaje (V)');
title('Curva de Histéresis del Sensor de Nivel');
legend('show');
grid on;

% ajuste de la curva de histéresis
histeresis_model = @(p, h) p(1) * h.^p(2) + p(3);

p0 = [6, 2, 0.5];  % Valores iniciales para los parámetros

% combinamos datos de subida y bajada para el ajuste
h_combinado = [h_subida, h_bajada];
V_combinado = [V_subida, V_bajada];

% ajuste de los parámetros con lsqcurvefit (pag oficial de matlabs)
params = lsqcurvefit(histeresis_model, p0, h_combinado, V_combinado);

% graficamos la curva de ajuste
h_fit = linspace(0, 0.5, 100);
V_fit = histeresis_model(params, h_fit);

figure;
plot(h_combinado, V_combinado, '.-', 'DisplayName', 'Datos');
hold on;
plot(h_fit, V_fit, 'r-', 'DisplayName', 'Ajuste');
xlabel('Altura (mts)');
ylabel('Voltaje (V)');
title('Ajuste de la Curva de Histéresis del Sensor de Nivel');
legend('show');
grid on;

data = iddata(V_combinado', h_combinado', 1);

% función de transferencia
tf = tfest(data, 1, 0)

