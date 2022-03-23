-- INSERTAR DATOS

	-- 1. Insert into tabla (campo1, ..., campoN) VALUES (valor1, ..., valorN);
		INSERT INTO personas (id, nombre, apellido, nacimiento, disponible)
		VALUES ("02157535", 'Alexys', 'Lozada', '1980-01-02', true);

	-- 2. Insert into tabla VALUES (valor1, valor2, ..., valorN);
		INSERT INTO personas VALUES ("11112222", 'Alexys', 'Lozada', '1980-01-02', true);

	-- 3. Insert into tabla VALUES (default, valorN, valorM, ..., valorZ);
		INSERT INTO personas VALUES (DEFAULT, 'Alexys', DEFAULT, DEFAULT, true);



-- CREAR CAMPOS POR DEFECTO EN UNA TABLA
	CREATE TABLE students (
		id int DEFAULT 0000,
		nombre VARCHAR(50),
		activo BOOL DEFAULT true,
		creado TIMESTAMP DEFAULT now()
	);
	INSERT INTO students VALUES (DEFAULT, 'Pedro', DEFAULT, DEFAULT);


-- Otra forma de instertar registros con valores por defecto
	INSERT INTO students (nombre) VALUES ('JUAN');


-- 4. Insert into tabla VALUES (valorA1, ..., valorAn), (valorB1, ..., valorBN);
	INSERT INTO students VALUES 
	(DEFAULT, 'Pedro', DEFAULT, DEFAULT), (DEFAULT, 'Leidy', DEFAULT, DEFAULT),
	(DEFAULT, 'Jenny', DEFAULT, DEFAULT), (DEFAULT, 'Juan', DEFAULT, DEFAULT);

	INSERT INTO students (nombre, creado) VALUES
	('Juan', '2021-06-01'), ('Paola', '2021-06-01');

-- 5. Insert into tabla SELECT your-query;
	INSERT INTO students (nombre, activo) -- Que campos vas a afectar
	SELECT f_name,is_active  FROM tmp_students; -- Se creo esta tabla con campos nombre y activo

-- 6. Datos nulos.
	INSERT INTO students VALUES (NULL, NULL, NULL, NULL);
	DROP TABLE students;

	CREATE TABLE students1 (
		id int DEFAULT 1111 NOT NULL,
		first_name VARCHAR(50) NOT NULL,
		is_active BOOL NOT NULL,
		created_at TIMESTAMP DEFAULT now() NOT NULL,
		updated_at TIMESTAMP
	);
	INSERT INTO students VALUES (DEFAULT, 'Alexys', TRUE, DEFAULT, DEFAULT);

-- No es posible, porque viola las restricciones de nulo.
	INSERT INTO students VALUES (NULL, NULL, NULL, NULL);