
load census;


p1 = polyfit(cdate, pop, 1);  
p2 = polyfit(cdate, pop, 2);  
p3 = polyfit(cdate, pop, 3);  

x_fit = linspace(min(cdate), max(cdate), 100); 
y_fit1 = polyval(p1, x_fit);
y_fit2 = polyval(p2, x_fit);
y_fit3 = polyval(p3, x_fit);


figure;
scatter(cdate, pop, 30, 'k', 'filled');  
hold on; 
plot(x_fit, y_fit1, 'r-', 'LineWidth', 1); 
plot(x_fit, y_fit2, 'g-', 'LineWidth', 1); 
plot(x_fit, y_fit3, 'b-', 'LineWidth', 1); 


legend('Datos originales', 'Ajuste lineal', 'Ajuste cuadrático', 'Ajuste cúbico', 'Location', 'northwest');
xlabel('Año');
ylabel('Población');
title('Ajuste Polinomial de la Población');
hold off;


ecm1 = mean((polyval(p1, cdate) - pop).^2);
ecm2 = mean((polyval(p2, cdate) - pop).^2);
ecm3 = mean((polyval(p3, cdate) - pop).^2);


fprintf('Error Cuadrático Medio para el ajuste lineal: %.2f\n', ecm1);
fprintf('Error Cuadrático Medio para el ajuste cuadrático: %.2f\n', ecm2);
fprintf('Error Cuadrático Medio para el ajuste cúbico: %.2f\n', ecm3);

[min_ecm, idx]= min([ecm1,ecm2,ecm3]);
if idx == 1
    fprintf('El ajuste lineal es el que mejor se ajusta a los datos.\n');
elseif idx == 2
    fprintf('El ajuste cuadratico es el que mejor se ajusta a los datos.\n');
else
    fprintf('El ajuste cubico es el que mejor se ajusta a los datos.\n');
end