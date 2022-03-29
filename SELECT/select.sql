-- SELECT: Puede recibir constantes, expresiones, funciones, campos de tablas.

	-- Constantes
		SELECT 'Hola mundo';
		SELECT 8;

	-- Expresiones
		SELECT 2*2+2/2;

	-- Cast
		SELECT CAST(12/12 AS CHAR);
		SELECT CAST('2021-06-13' AS date);

	-- Funciones
		SELECT now();
		SELECT upper('Hola Mundo');
		SELECT lower('Hola Mundo');

	-- Campos de Tablas
		SELECT * FROM students;
		SELECT id, nombre, activo FROM students;

	-- Uniendo lo anterior
		SELECT id, upper(nombre), CAST(2+4 AS CHAR), 'Estudiante' FROM students;

	-- Alias (Poner nombre a las columnas)
		SELECT id, upper(nombre) AS nombre_mayus,
			   CAST(2+4 AS CHAR) AS expresion,
			   'Estudiante' as tipo_persona
		FROM students;

	-- Le llamamos proyección a todos los campos que queremos que devuelva una consulta SQL
