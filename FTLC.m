%funcion de transferencia a lazo cerrado d
clc;close all;
s=tf('s');

%obtenemos la funcion de transferencia de nuestro sistema

%electrovalvula
 Fv=(2.542e-4)/(s+0.006208)
%tanque
Ft=((25.46)/(25.46*s+1))
%sensor de nivel
Fs=((240.7)/(s+19.11))

%por teorema de circuitos retroalimentados y simplificacion obtenemos

FT= ((Fv * Ft)/(1+(Fv *Ft * Fs)))
FT_simplificada = minreal(FT);


%analisis en frecuencia
bode(FT);
%respuesta al impulso
impulse(FT);
%analisis de error
step(FT);
