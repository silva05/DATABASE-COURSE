-- 1. Actualizar información
	-- UPDATE tabla 
	-- SET campo1 = valor1, campo2 = valor2, ..., campoN = valorN 
	-- WHERE campoM = valorM;
		UPDATE personas SET nombre = 'Giancarlo', apellido = 'Silva' WHERE id = '11112222';
		UPDATE personas SET disponible = false;



-- 2. Borrar información
	-- DELETE FROM tabla WHERE campoM = valorM;
		DELETE FROM persons WHERE id IS NULL;
		DELETE FROM persons WHERE id = '125465';

-- BORRA TODA LA INFO DE LA TABLA
TRUNCATE TABLE persons;