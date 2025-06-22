LEVEL   = 1;
VTOn    = 0.7;           %(V)        -> Tensión umbral
VTOp    = 0.8;           %(V)        -> Tensión umbral
GAMMA   = 0.45;          %(V^1/2)    -> Coeficiente de cuerpo
PHI     = 0.9;           %(V)        -> Potencial ? (? 2F)
NSUB    = 9e14;          %(cm^-3)    -> Dopaje del sustrato
LD      = 0.08e-6;       %(m)        -> Longitud de difusión (fuente/drenaje)
UON     = 350e-4;           %(cm^2/V·s) -> Movilidad de portadores
UOP     = 100e-4;           %(cm^2/V·s) -> Movilidad de portadores
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
Vds     = 3;             %V
Cox     = 3836e-6;       %F/m^2
Vdd     = 3              %V

W=50; 
L1=0.5; 
L2=2; 
id1=0.5; %mA 
id2=0.5; %mA

%Question 1: 
a = 0.5*UON*Cox*(W/L1)*1000 % = 0.0067(mA/V^2) 

%Question 2
b = 0.5*UOP*Cox*(W/L2)*1000 % = 4.7950e-04(mA/V^2)

%Question 3 
Vgs1=VTOn + sqrt((2*id1*10^-3)/(UON*Cox*(W/L1))) % = 0.9729 (V)

%Question 4
gm1 = sqrt(2*UON*Cox*1000*(W/L1)*id1) % = 3.6642 (mA/V) 

%Question 5
Vgs2=VTOp + sqrt((2*id2*10^-3)/(UOP*Cox*(W/L2))) % = -1.8212 (V)

%Question 6
gm2 = sqrt(2*UOP*Cox*1000*(W/L2)*id2) % = 0.9793(mA/V) 

%Question 7 
ron = 1/(LAMBDAn*id1) % = 20 kohms

%Question 8 
rop = 1/(LAMBDAp*id2) % = 10 kohms 

%Question 9 
Av = -gm1*((ron*rop)/(ron+rop)) % = -24.4277 V/V

%Question 10 
Vo_max = Vdd +(-Vgs2+VTOp) % = 1.9788 V  

%Question 11 
Vo_min = Vgs1 - VTOn % = 0.2729 V 

%Question 13 
Rs=0.2 %kohm
Vs=id1*Rs % = 0.1 V 

Rd=2 %kohm 
Vd= Vdd - (id1*Rd) % = 2 V 

Vds= Vd - Vs % = 1.90 V  

%Question 14 
gm14=sqrt(2*UON*Cox*1000*(W/L1)*id1*(1+LAMBDAn*Vds)) % = 3.9971 mA/V 

%Question 15 
Rout=(1+gm14*Rs)*ron % = 35.9885 ohm 
Gm= (gm14*ron)/(Rs+Rout) % = 2.2091 mA/V
 
%Question 16  
Av2 =(-gm14*ron*Rd)/(Rd+Rs+ron+(gm14*Rs*ron))% = -4.1867 V/V 


% Caclculos para simulacion 
%Se realizaron los siguiente calculos solamente para poder implementar el ejercicio en LTSPICE
%el resto de los valores necesarios para la simulacion han sido calculados en las preguntas previas. 
Vgs = sqrt((2*id1)/(UON*Cox*1000*(W/L1)*(1+LAMBDAn*Vds))) + VTOn % = 0.9502 V
VG = Vgs+Vs % = 1.0502 V 

