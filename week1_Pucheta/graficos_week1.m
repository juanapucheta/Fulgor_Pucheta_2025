% Parámetros NMOS
u = 0.0350;      % Movilidad
C = 0.003836;   
W_L = 50 / 0.34;  % Relación W/L'
Vth = 0.7;       % Tensión de umbral en voltios
Vds = 3; 
LAMBDA = 0.1;

% Rango de Vgs
Vgs = linspace(0, 3, 100);

% Cálculo de Id
Id = zeros(size(Vgs));
for i = 1:length(Vgs)
    if Vgs(i) > Vth
        Id(i) = 0.5 * u * C * W_L  *(1+ LAMBDA*Vds) *(Vgs(i) - Vth)^2;
    else
        Id(i) = 0;
    end
end

% Graficar
figure;
plot(Vgs, Id*1e3, 'r', 'LineWidth', 2);
xlabel('V_{GS} (V)');
ylabel('I_D (mA)');
title('Corriente de Drenaje NFET');
grid on;

% % Parámetros PMOS 
% u = 0.010;      % Movilidad
% C = 0.003836;   
% W_L = 50 / 0.32;  % Relación W/L'
% Vth = 0.8;       % Tensión de umbral en voltios
% Vds = 3; 
% LAMBDA = 0.2;
% 
% % Rango de Vgs
% Vgs = linspace(0, 3, 100);
% 
% % Cálculo de Id
% Id = zeros(size(Vgs));
% for i = 1:length(Vgs)
%     if Vgs(i) > Vth
%         Id(i) = 0.5 * u * C * W_L  *(1+ LAMBDA*Vds) *(Vgs(i) - Vth)^2;
%     else
%         Id(i) = 0;
%     end
% end
% 
% % Graficar
% figure;
% plot(Vgs, Id*1e3, 'r', 'LineWidth', 2);
% xlabel('V_{GS} (V)');
% ylabel('I_D (mA)');
% title('Corriente de Drenaje PFET');
% grid on;