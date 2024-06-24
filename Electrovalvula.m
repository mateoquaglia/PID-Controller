% Parametros del sistema
voltajes = 1:0.5:10;  % Voltajes de 1V a 10V con paso de 0.5V
volumenes_control = [0.5, 1.5];  % Volúmenes de control en litros

% inicializacion de la matriz de tiempos de llenado
tiempos_llenado = zeros(length(voltajes), 4, length(volumenes_control));

% simulación para caracterizar la electroválvula
for i = 1:length(voltajes);
    for j = 1:length(volumenes_control);
        volumen_control = volumenes_control(j);
        
        % Realizo simulación del tiempo de llenado para cada voltaje y volumen de control
        tiempos_medidos = simular_tiempo_llenado(voltajes(i), volumen_control);
        
        % Almaceno los tiempos medidos
        tiempos_llenado(i, :, j) = tiempos_medidos
    end
end

%calculo tiempos promedios y Q
tiempos_promedio = mean(tiempos_llenado, 2)



figure;
for j = 1:length(volumenes_control);
    subplot(length(volumenes_control), 1, j);
    plot(voltajes, squeeze(tiempos_promedio(:, j)), '.-');
    xlabel('Voltaje de entrada (V)');
    ylabel('Tiempo promedio de llenado (s)');
    title(['Caracterización de la Electroválvula - Volumen de Control ', num2str(volumenes_control(j)), ' L']);
    grid on;
end
% con Q y los voltajes calculo FT
V = [1 1.5 2 2.5 3 3.5 4 4.5 5 5.5 6 6.5 7 7.5 8 8.5 9 9.5 10];
Q = [0.0148 0.0142 0.0133 0.0135 0.0132 0.0128 0.0148 0.0143 0.0143 0.0146 0.0128 0.0142 0.0145 0.0148 0.0137 0.0120 0.0143 0.0152 0.0138];
% Estimar la función de transferencia
data1 = iddata(Q', V', 1);
tf = tfest(data1, 1, 0)