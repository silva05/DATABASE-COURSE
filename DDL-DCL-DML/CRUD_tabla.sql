-- CREAR TABLAS --
	CREATE TABLE personas (
		id int(8),
		nombre VARCHAR(60),
		apellido VARCHAR(60),
		edad SMALLINT,
		nacimiento DATE,
		disponible BOOL
	);

	CREATE TABLE trabajos (
		id int(10),
		persona_id int(8),
		inicio DATE,
		fin DATE,
		disponible bool
	);

-- ELIMINAR Y MODIFICAR CAMPOS  --
	ALTER TABLE personas DROP COLUMN edad;
	ALTER TABLE trabajos ADD COLUMN nombre VARCHAR(50);

-- COMANDO PARA ELIMINAR TABLAS --
	DROP TABLE personas;
