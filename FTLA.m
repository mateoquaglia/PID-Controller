%funcion de transferencia a lazo abierto 
clc;close all; clear all;
s=tf('s');

%obtenemos la funcion de transferencia de nuestro sistema

%electrovalvula
 Fv=(2.542e-4)/(s+0.006208)
%tanque
Ft=((25.46)/(25.46*s+1))
%sensor de nivel
Fs=((240.7)/(s+19.11))

%por teorema de circuitos retroalimentados y simplificacion obtenemos

FTLA_= Fv * Ft
FT_simplificada = minreal(FTLA_);

%analisis en frecuencia
bode(FTLA_);
%respuesta al impulso
impulse(FTLA_);
%analisis de error
step(FTLA_);
