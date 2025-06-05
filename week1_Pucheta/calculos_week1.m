LEVEL   = 1;
VTOn    = 0.7;          %(V)        -> Tensi�n umbral
VTOp    = 0.8;         %(V)        -> Tensi�n umbral
GAMMA   = 0.45;          %(V^1/2)    -> Coeficiente de cuerpo
PHI     = 0.9;           %(V)        -> Potencial ? (? 2F)
NSUB    = 9e14;          %(cm^-3)    -> Dopaje del sustrato
LD      = 0.08e-6;       %(m)        -> Longitud de difusi�n (fuente/drenaje)
UON     = 350;           %(cm^2/V�s) -> Movilidad de portadores
UOP     = 100;           %(cm^2/V�s) -> Movilidad de portadores
LAMBDAn  = 0.1;          %(V^-1)     -> Modulaci�n de longitud de canal
LAMBDAp  = 0.2;          %(V^-1)     -> Modulaci�n de longitud de canal
TOX     = 9e-9;          %(m)        -> Espesor del �xido
PB      = 0.9;           %(V)        -> Potencial de uni�n
CJ      = 0.56e-3;       %(F/m^2)    -> Capacitancia de uni�n por �rea
CJSW    = 0.35e-11;      %(F/m)      -> Capacitancia de uni�n lateral
MJ      = 0.45;          %(unitless) -> Exponente de CJ
MJSW    = 0.2;           %(unitless) -> Exponente de CJSW
CGDO    = 0.4e-9;        %(F/m)      -> Capacitancia solapamiento puerta-drenaje 
JS      = 1.0e-8;        %(A/m^2)    -> Corriente de fuga por unidad de �rea
Vds     = 3;             %V
W       = 50;
Cox     = 3836e-6;       %F/m^2
Vgs     = 3;             %V

%NMOS 
LeffN=0.34; 
%Q6 Corriente de drenador sin tener en cuenta la tensi�n subumbral
Id1N= 0.5* 0.035* Cox * (W/LeffN)*(1+ LAMBDAn*Vds) % = 12.83 mA

%Q8 Corriente de drenador NMOS considerando tensi�n subumbral
IdN=Id1N*(Vgs-VTOn)^2 % = 67.9 mA

%PMOS 
LeffP=0.32; 
%Q7 Corriente de drenador sin tener en cuenta la tensi�n subumbral
Id1P= 0.5* 0.01* Cox * (W/LeffP)*(1+ LAMBDAp*Vds) % = 4.8 mA

%Q9 Corriente de drenador PMOS considerando tensi�n subumbral
IdP= Id1P *(Vgs-VTOp)^2 % =23 mA

%gm = sqrt[2*u*Cox*(W/L)*Id]
% WLeffN=W/LeffN; 
% WLeffP=W/LeffP; 

gmN=sqrt(2*0.035*Cox*100*0.5e-3)*1000 %mA/V

gmP=sqrt(2*0.01*Cox*100*0.5e-3)*1000 %mA/V

roN= 1/(LAMBDAn*0.5) %kohm

roP= 1/(LAMBDAp*0.5) %kohm 

%goN*roN = 73.2830
%goP*roP = 19.5857

% epsilon_0 = 8.854e-12; % Permitividad del vac�o en F/m
% epsilon_r_SiO2 = 3.9;  % Permitividad relativa del SiO2 (�xido de puerta)
% 
% 
% % Calcular la permitividad diel�ctrica del �xido (epsilon_ox)
% epsilon_ox = epsilon_r_SiO2 * epsilon_0;
% 
% 
% % Calcular Cox en F/m^2
% Cox_F_per_m2 = epsilon_ox / TOX;
% 
% 
% % Convertir Cox a uF/m^2 (microfaradios por metro cuadrado)
% % 1 uF = 1e-6 F
% Cox= Cox_F_per_m2 / 1e-6
