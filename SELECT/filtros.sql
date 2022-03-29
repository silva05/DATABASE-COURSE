-- FILTROS: WHERE first_name = 'Alexys'

    SELECT * FROM persons WHERE first_name = 'Alexys';
    
    -- Funciones
		SELECT * FROM persons WHERE first_name = 'ALEXYS'; -- No mostrara pq no existe en mayuscula (case sensitive)
		SELECT * FROM persons WHERE upper(first_name) = 'ALEXYS'; -- SOLUCION


	-- Operadores de comparación (=, >, <, >=, <=, <> o diferente)
		SELECT * FROM persons WHERE upper(first_name) > 'ALEXYS'; -- Muestra nombres mayor en orden alfabetico
		SELECT * FROM persons WHERE upper(first_name) < 'ALEXYS'; -- Muestra nombres menor en orden alfabetico
		SELECT * FROM persons WHERE upper(first_name) >= 'ALEXYS';
		SELECT * FROM persons WHERE upper(first_name) <= 'ALEXYS';
		SELECT * FROM persons WHERE upper(first_name) <> 'ALEXYS'; -- Diferentes al nombre


	-- AND & OR
		SELECT * FROM persons WHERE upper(first_name) = 'ALEXYS' AND last_name <> 'Lozada';
		SELECT * FROM persons WHERE upper(first_name) = 'ALEXYS' OR first_name = 'Giancarlo';


	-- LIKE normal: Filtrar caracteres cuando no conoces el valor del caracter
		SELECT * FROM persons WHERE first_name LIKE 'ALEXYS';

	-- LIKE un caracter `_` : Reemplaza el _ con todos los caracteres y muestra los que esten en la BD
		SELECT * FROM persons WHERE upper(first_name) LIKE 'ALEX_S';

	-- LIKE varios caracteres `%`
		SELECT * FROM persons WHERE upper(first_name) LIKE 'GIAN%';


	-- BETWEEN
		SELECT * FROM persons WHERE birthday BETWEEN '1980-01-01' AND '2022-12-31';


	-- IN VALORES
		SELECT * FROM jobs WHERE persons_id IN ('111','222', '333');

	-- IN SELECT: Queremos saber que personas tienen trabajo y que trabajos estan ocupados por personas
		SELECT * FROM jobs WHERE persons_id IN (SELECT id FROM persons);
		SELECT * FROM persons WHERE id IN (SELECT persons_id FROM jobs);


	-- IS NULL
		SELECT * FROM persons WHERE updated_at IS NULL;

	-- NOT
		SELECT * FROM persons WHERE updated_at IS NOT NULL;
		SELECT * FROM persons WHERE id NOT IN (SELECT persons_id FROM jobs);
