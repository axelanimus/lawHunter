#!/usr/bin/env bash
 
#set -x

tipoArt=''

titulo=''

declare -i nuArt='1'

for i in {1..136}; do

	let nuArt+=1

	artText=$(cat C*t| sed 's/\ \ \ Artículo \([[:digit:]]\)o.\ /#\1#\nArtículo\ \1o.\ /g; s/\ \ \ Artículo \([[:digit:]][[:digit:]]\).\ /#\1#\nArtículo\ \1.\ /g; s/\ \ \ Artículo \([[:digit:]][[:digit:]][[:digit:]]\).\ /#\1#\nArtículo\ \1.\ /g'|  sed -n "/#${i}#/,/#${nuArt}#/p"| sed "/#[[:digit:]]#/d; /[[:digit:]]\ de 354/d")

	ultRef=$(cat C*t| sed 's/\ \ \ Artículo \([[:digit:]]\)o.\ /#\1#\nArtículo\ \1o.\ /g; s/\ \ \ Artículo \([[:digit:]][[:digit:]]\).\ /#\1#\nArtículo\ \1.\ /g; s/\ \ \ Artículo \([[:digit:]][[:digit:]][[:digit:]]\).\ /#\1#\nArtículo\ \1.\ /g'|  sed -n "/#${i}#/,/#${nuArt}#/p"| sed "/#[[:digit:]]#/d; /[[:digit:]]\ de 354/d"| grep -e 'Última Reforma'| sed 's/Última Reforma/#Última Reforma/'| cut -d '#' -f2| uniq)

	if test -z "$ultRef"; then

		ultRef='Articulo no ha sido reformado aun'

	fi 


	if [[ $i -le 38 ]]; then

		tipoArt='Dogmatico'

	else

		tipoArt='Organico'

	fi


	if [[ $i -le 38 ]]; then

		titulo='Titulo primero'

	elif [[ $i -ge 39  ]] && [[ $i -le 48 ]]; then

		titulo='Titulo segundo'

	elif [[ $i -ge 49 ]] && [[ $i -lt 108  ]]; then

		titulo='Titulo tercero'

	elif [[ $i -ge 108 ]] && [[ $i -le 114 ]]; then

		titulo='Titulo cuarto'

	elif [[ $i -ge 115 ]] && [[ $i -le 122 ]]; then

		titulo='Titulo quinto'

	elif [[ $i -eq 123 ]]; then

		titulo='Titulo sexto'

	elif [[ $i -gt 123 ]] && [[ $i -lt 135 ]]; then

		titulo='Titulo septimo'

	elif [[ $i -eq 135 ]]; then

		titulo='Titulo octavo'

	else

		titulo='Titulo noveno'	

	fi

	declare -i i	

    #sqlite3 main.db "CREATE TABLE IF NOT EXISTS articulos (numero_art TINYINT NOT NULL PRIMARY KEY, nombre TINYTEXT, texto LONGTEXT, titulo_pert VARCHART(22), tipo VARCHART(10), ultima_reforma VARCHART(35), art_asociados CHAR(300), art_conflicto CHAR(300), palabras_aso CHAR(8000), epico CHAR(2), comentarios LONGTEXT)"
	
	sqlite3 main.db "INSERT INTO articulos (numero_art, texto, titulo_pert, tipo, ultima_reforma) VALUES ($i, '$artText', '$titulo', '$tipoArt', '$ultRef');"

	


done