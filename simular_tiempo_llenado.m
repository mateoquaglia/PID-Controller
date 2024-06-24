function tiempos_medidos = simular_tiempo_llenado(voltaje, volumen_control)                                             %#ok<INUSL>
 
    area_orificio = 0.01;  % area del orificio en metros cuadrados
    gravedad = 9.81;       % aceleración debida a la gravedad en m/s^2

    % calculo de altura inicial del agua sobre el orificio 
    altura_inicial = 0.1; 
    % calculo el caudal inicial utilizando la ley de Torricelli
    caudal_inicial = area_orificio * sqrt(2 * gravedad * altura_inicial);

    % calculo el tiempo de llenado para el volumen de control
    tiempo_llenado = volumen_control / caudal_inicial;

    % repito el proceso para cada uno de los cuatro tiempos medidos
    tiempos_medidos = zeros(1, 4);
    for i = 1:4
        % variación pequeña para mas realismo
        altura_inicial = altura_inicial + randn() * 0.01;  

        % calculo el nuevo caudal inicial
        caudal_inicial = area_orificio * sqrt(2 * gravedad * altura_inicial);

        % calculo el nuevo tiempo de llenado
        tiempos_medidos(i) = volumen_control / caudal_inicial;
    end
end
