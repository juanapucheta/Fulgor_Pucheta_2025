LEVEL   = 1;
VTOn    = 0.7;           %(V)        -> Tensión umbral
VTOp    = 0.8;           %(V)        -> Tensión umbral
GAMMA   = 0.45;          %(V^1/2)    -> Coeficiente de cuerpo
PHI     = 0.9;           %(V)        -> Potencial ? (? 2F)
NSUB    = 9e14;          %(cm^-3)    -> Dopaje del sustrato
LD      = 0.08e-6;       %(m)        -> Longitud de difusión (fuente/drenaje)
UON     = 0.0350;        %(m^2/V·s) -> Movilidad de portadores
UOP     = 0.0100;        %(m^2/V·s) -> Movilidad de portadores
LAMBDAn  = 0.1;          %(V^-1)     -> Modulación de longitud de canal
LAMBDAp  = 0.2;          %(V^-1)     -> Modulación de longitud de canal
TOX     = 9e-9;          %(m)        -> Espesor del óxido
PB      = 0.9;           %(V)        -> Potencial de unión
CJ      = 0.56e-3;       %(F/m^2)    -> Capacitancia de unión por área
CJSW    = 0.35e-11;      %(F/m)      -> Capacitancia de unión lateral
MJ      = 0.45;          %(unitless) -> Exponente de CJ
MJSW    = 0.2;           %(unitless) -> Exponente de CJSW
CGDO    = 0.4e-9;        %(F/m)      -> Capacitancia solapamiento puerta-drenaje 
JS      = 1.0e-8;        %(A/m^2)    -> Corriente de fuga por unidad de área
Vdd     = 3;             %V
W       = 50;
Cox     = 3836e-6;       %F/m^2
L1       = 0.5; 

ISS1= 0.5 ;% mA 

%Question 1 
Vgs3=sqrt((2*ISS1)/(UON*Cox*1000*(W/L1)))+VTOn %=0.9729 V

%Question 3 
Id=ISS1/2 % 0.25 mA 

%Question 4 
a= 0.5*UON*Cox*(W/L1)*1000 % = 6.7130(mA/V^2)

%Question 5 
Vgs1=sqrt((2*Id)/(UON*Cox*1000*(W/L1)))+VTOn % = 0.8930 V
Q5= Vgs1 - VTOn % = 0.1930 V

%Question 7 
gm = sqrt(2*UON*Cox*1000*(W/L1)*Id) % = 2.5909(mA/V) 

%Question 8 
Vcmmax= (0.5+3)/2 % = 1.75 V

%Question 9 
Rd = (Vdd-Vcmmax)/Id % = 5Kohms

%Question 10 
Av= -gm*Rd % = -12.9547 V/V 

ISS2= 1;  %mA
L3=1; 
%Question 11 
Q11= UON * (W/L1) % = 3.5 m^2/V/s

%Question 12 
Q12= UOP* (W/L3) % = 0.5 m^2/V/s

%Question 13 
Av13= sqrt(Q11/Q12) % = 2.6458 V/V 

Id14=ISS2/2; 
%Question 14 
gm14 = sqrt(2*UON*Cox*1000*(W/L1)*Id14) % = 3.6642(mA/V) 

%Question 15 
ron = 1/(LAMBDAn*Id14) % = 20 Kohms

%Question 17 
rop = 1/(LAMBDAp*Id14) % = 10 Kohms

%Question 18 
Av18 = - gm14 *((ron*rop)/(ron+rop)) % = -24.4277 V/V

%Question 19 
Vgs19=sqrt((2*Id14)/(UON*Cox*1000*(W/L1)))+VTOn % = 0.9729 V
Vcmmin= Vgs19 + 0.4 % = 1.3729 V 

%Question 20 
VoutmaxA= Vdd - VTOp % = 2.2 V 
VovN= Vgs19 - VTOn % = 0.2729 V
VoutminA = VovN + 0.4 % = 0.6729 V 
SwingA= 2 * (VoutmaxA-VoutminA) % = 3.0542 V 

%Question 21
Vsg= VTOp + sqrt((2*Id14)/(UOP*Cox*1000*(W/L3))) % = 1.5221 V 
Vovp= Vsg - VTOp % = 0.7221 V 
VoutmaxB=Vdd-Vovp % = 2.2779 V 
VoutminB = VovN + 0.4 % = 0.6729 V 
SwingB= 2 * (VoutmaxB - VoutminB) % = 3.2100 V
