T = readtable('/MATLAB Drive/Guia4/heart_data.csv');
save('HeartData.mat', 'T');
load('HeartData.mat')
T.age = T.age / 365; 
T.smoke = categorical(T.smoke, [0, 1], {'no fuma', 'si fuma'});
T.alco = categorical(T.alco, [0, 1], {'no toma alcohol', 'si toma alcohol'});
T.active = categorical(T.active, [0, 1], {'no es activo fisicamente', 'es activo fisicamente'});
T.cardio = categorical(T.cardio, [0, 1], {'no sufre de enfermedades cardiovasculares', 'si sufre de enfermedades cardiovasculares'});
T.height = T.height / 100;
T.IMC = T.weight ./ (T.height.^2);

T.IMC_Category = categorical(zeros(size(T.IMC)), [0, 1, 2, 3], ...
    {'Bajo peso', 'Normal', 'Sobrepeso', 'Obesidad'});

T.IMC_Category(T.IMC < 18.5) = 'Bajo peso';
T.IMC_Category(T.IMC >= 18.5 & T.IMC <= 24.9) = 'Normal';
T.IMC_Category(T.IMC >= 25.0 & T.IMC <= 29.9) = 'Sobrepeso';
T.IMC_Category(T.IMC >= 30.0) = 'Obesidad';
T.Presion_Media = (T.ap_hi + 2 * T.ap_lo) / 3;

save('HeartData.mat', 'T');