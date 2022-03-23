-- Restricciones de llave primaria, llave única y llaves foraneas
		DROP TABLE IF EXISTS personas;
		DROP TABLE IF EXISTS trabajos;

	-- Crear la tabla personas
		CREATE TABLE persons (
			id int DEFAULT 00111 NOT NULL,-- PRIMARY KEY (SE PUEDE ASI TMB PERO EL NOMBRE DE LA RESTRICCION ES DIFICIL DE ENCONTRAR)
			first_name VARCHAR(60) NOT NULL,
			last_name VARCHAR(60) NOT NULL,
			birthday DATE NOT NULL,
			created_at TIMESTAMP DEFAULT now() NOT NULL,
			updated_at TIMESTAMP,
			CONSTRAINT persons_id_pk PRIMARY KEY (id),
			CONSTRAINT persons_f_name_l_name_uk UNIQUE (first_name, last_name)  -- UNIQUE KEY INDICA QUE AUNQUE NO SEA PK NO SE PUEDE REPETIR
		);

	-- Insertar datos a la tabla personas
		INSERT INTO persons VALUES (DEFAULT, 'Alexys', 'Lozada', now(), DEFAULT, NULL);

	-- Viola restricción de UK
		INSERT INTO persons VALUES (DEFAULT, 'Alexys', 'González', now(), DEFAULT, NULL);

	-- Viola Restricción de PK
		INSERT INTO persons VALUES ('00111', 'Pedro', 'Perez', now(), DEFAULT, NULL);


	-- Crear la tabla empleos
		CREATE TABLE jobs (
			id int DEFAULT 12222 NOT NULL,
			persons_id int NOT NULL,
			job_name VARCHAR(50) NOT NULL,
			created_at TIMESTAMP DEFAULT now() NOT NULL,
			updated_at TIMESTAMP,
			CONSTRAINT jobs_id_pk PRIMARY KEY (id),
			CONSTRAINT jobs_persons_id_fk FOREIGN KEY (persons_id)
				REFERENCES persons (id)
				ON UPDATE RESTRICT  -- O CASCADE
				ON DELETE RESTRICT	-- O CASCADE
				-- Permite no actualizar el id de la tabla padre si dicho id tiene registros en esta tabla
				-- Permite que no se borre el id de la tabla padre si dicho id tiene registros en esta tabla
		);

	-- Inserta datos en los empleos
		INSERT INTO jobs VALUES (DEFAULT, '111', 'DEVELOPER', DEFAULT, DEFAULT);

	-- Insertar con id_persons que no esta registrado
		INSERT INTO jobs VALUES ("4444", '1112221', 'DEVELOPER', DEFAULT, DEFAULT);

	-- Intento de borrado de información de personas
		DELETE FROM persons WHERE id = '111';