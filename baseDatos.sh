#!/usr/bin/env bash


    sqlite3 lawHunter.db """CREATE TABLE articulos (numero_art TINYINT NOT NULL PRIMARY KEY, nombre TINYTEXT, texto LONGTEXT, titulo_pert VARCHART(200), num_titu TINYINT, tipo VARCHART(10), tipo_def_art VARCHART(120), ultima_reforma VARCHART(35), art_asociados CHAR(300), art_conflicto CHAR(300), palabras_aso CHAR(8000), epico CHAR(2), comentarios LONGTEXT)""";

#? Declaration of variables setting the especific type of the value that will be use for make most easy to read the code

declare -i cu=0

declare -i numTitu=0

declare  aTitu=""

declare  aTipo=""

declare aTipoDef=""



for i in $(seq 1 136); do
    #** In arithmetic expression for evaluation, the variable doesn´t need to be represented by $ or ${} **#
    
    cu=$((i + 1 ));
    
    #** Flow control for automatize the extraction of the text of the articles is every condition for every case remember you must to know your text **#
    
    if [[ $cu -le 9 ]]; then

        art="""$(grep -B 1000 -e "Artículo ${cu}o."  CPEUM.txt | grep -A 1000 -e "Artículo ${i}o."| sed '$d')""";
    
    elif [[ $cu -eq 10 ]]; then

        art="""$(grep -B 1000 -e "Artículo ${cu}."  CPEUM.txt | grep -A 1000 -e "Artículo ${i}o."| sed '$d')""";
    
    elif [[ $cu -eq 137 ]]; then

        art="""$(grep -A 200 "Artículo ${i}." CPEUM.txt | grep -B 250 "Artículos Transitorios"| sed 's/Artículos Transitorios//')""";

    #? Using diferents tools for the same task is recommended, could looks more hard to read the code but you always gonna remember the tools, somentimes in dificult situations you will havent enable the tool tha you always use but you know how to use more ways for the same result, so the task become ultra easy to do and finish it, is just be prepare for the most hard battles
    
    else

        art="""$(grep -B 1000 -e "Artículo ${cu}."  CPEUM.txt | grep -A 1000 -e "Artículo ${i}."| tail -n -1)""";
    
    fi


    #! Aqui ya tienes el texto de los arcticulos y el numero de articulo separado en variables ahora es momento de insertar los valores en la base de datos, pero primero otra condicion de control de flujo para segccionar el tipo de articulo en base a dogmatico u  organico y al titulo que pertence.


    if [[ ${i} -ge 1 && ${i} -le 29 ]]; then

        aTipo="Dogmatico garantias individuales";

        if  [[ ${i} -ge 1 && ${i} -le 24 ]]; then

            aTipoDef="Derechos humanos y libertad de expresión";

        elif [[ ${i} -eq 25 ]]; then

            aTipoDef="Derechos humanos y rectoria de la economía nacional";

        elif [[ ${i} -eq 26 ]]; then

            aTipoDef="Rectoria de la economía nacional";

        elif [[ ${i} -eq 27 ]]; then

            aTipoDef="Propiedad de la tierra y rubro agrario";

        elif [[ ${i} -eq 28 ]]; then

            aTipoDef="Prohibicion de monopolios privados";

        else
            aTipoDef="Forma de suspender garantias individuales en los casos señalados";
        
        fi

    else

        aTipo="Organico";

        aTipoDef="Estructura, organización y funcionamiento de los poderes y las instituciones del Estado, ver titulos pertinentes";

    fi

    #! Sigue seccionar los articulos por titulo perteneciente, facil, setteas la variable aTitu con el titulo al cual pertenece
    
    if [[ ${i} -ge 1 && ${i} -le 38 ]]; then

        aTitu="Título Primero: De los Derechos Humanos y sus Garantías";
        numTitu=1;

    elif [[ ${i} -ge 39 && ${i} -le 48 ]]; then

        aTitu="Título Segundo: De la Soberanía Nacional y de la Forma de Gobierno";
        numTitu=2;

    elif [[ ${i} -ge 49 && ${i} -le 107 ]]; then

        aTitu="Título Tercero: De la División de Poderes";
        numTitu=3;

    elif [[ ${i} -ge 108 && ${i} -le 114 ]]; then

        aTitu="Título Cuarto: De las Responsabilidades de los Servidores Públicos";
        numTitu=4;

    elif [[ ${i} -ge 115 && ${i} -le 122 ]]; then

        aTitu="Título Quinto: De los Estados de la Federación y de la Ciudad de México";
        numTitu=5;

    elif [[ ${i} -eq 123 ]]; then

        aTitu="Título Sexto: Del Trabajo y de la Previsión Social";
        numTitu=6;

    elif [[ ${i} -ge 124 && ${i} -le 134 ]]; then

        aTitu="Título Séptimo: Prevenciones Generales";
        numTitu=7;

    elif [[ ${i} -eq 135 ]]; then

        aTitu="Título Octavo: De las Reformas a la Constitución";
        numTitu=8;

    else

        aTitu="Título Noveno: De la Inviolabilidad de la Constitución";
        numTitu=9;

    fi

    sqlite3 lawHunter.db """INSERT INTO articulos (numero_art, texto, tipo, tipo_def_art, titulo_pert, num_titu) VALUES (\'${i}\', \'${art}\', \'${aTipo}\', \'${aTipoDef}\', \'${aTitu}\', \'${numTitu}\')""";

done



##:ANjsdsadsaddsablb
#!!!!! ndjnñjnbjkb 
#* hsHV,HV,V,V,,VH,
#? GCCGCMGCCGCGCN
#! BNhvhvjkb.ANXAM.BAB
#¡aJB,MSBdsabd.ndbn.db
//todo: sajjJBJÑBJBBBMM
#////   DAKNASNANAÑKNAÑ
#$ knsNAN-Sndakndskandk
#BUG: jjbjbjbjbj.bvcxcnnmcv
#HACK: kadnads,s{sksjss}
#FIXME:    HJHJHJHKJ
#TODO:  HJHJHJHKJ
#OPTIMIZE:  HJHJHJHKJ
#REVIEW:  HJHJHJHKJ
#IDEA:  HJHJHJHKJ
#¡WARNING:  HJHJHJHKJ
#*BoOKMARK


#$ INFO:
#* INFO:
#? INFO:
#¡ INFO:
#! INFO:
#// INFO:


