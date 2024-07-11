
L = 1;       % simulo la longitud del tubo en metros  
mu = 0.001;  % viscosidad dinamica del fluido  
r = 0.1;     % radio del tubo en metros
C = 1;       % area transversal del tanque
% aplicamos la ley de Poiseuille para calcular R  
R_poiseuille = (8 * mu * L) / (pi * r^4);

disp(['La resistencia hidráulica calculada con la ley de Poiseuille es: ' num2str(R_poiseuille) ' Pa·s/m^3']); 

% funcion de transferencia H(s)/Qi(s)
numerator = R_poiseuille;
denominator = [R_poiseuille * C, 1];

sys = tf(numerator, denominator)

