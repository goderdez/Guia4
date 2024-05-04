function Barras(T)
  
    hombres = T(T.gender == 1, :); 
    mujeres = T(T.gender == 2, :); 

    rangos_edades = [30, 40; 40, 50; 50, 60];


    enfermedades_hombres = zeros(size(rangos_edades, 1), 1);
    enfermedades_mujeres = zeros(size(rangos_edades, 1), 1);

    
    for i = 1:size(rangos_edades, 1)
        edad_min = rangos_edades(i, 1);
        edad_max = rangos_edades(i, 2);

        
        hombres_rango_edad = hombres(hombres.age >= edad_min & hombres.age < edad_max, :);
        enfermedades_hombres(i) = sum(hombres_rango_edad.cardio == 'si sufre de enfermedades cardiovasculares');

       
        mujeres_rango_edad = mujeres(mujeres.age >= edad_min & mujeres.age < edad_max, :);
        enfermedades_mujeres(i) = sum(mujeres_rango_edad.cardio == 'si sufre de enfermedades cardiovasculares');
    end

    figure;
    bar(rangos_edades(:, 1), [enfermedades_hombres, enfermedades_mujeres], 'grouped');
    xlabel('Rango de Edad');
    ylabel('Personas con Enfermedades Cardiovasculares');
    title('Enfermedades Cardiovasculares en Rango de Edad y Género');
    legend('Hombres', 'Mujeres');
    xticklabels({'30-40', '40-50', '50-60'});
end