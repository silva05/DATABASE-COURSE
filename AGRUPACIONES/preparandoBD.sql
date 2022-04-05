-- AGRUPACIONES: Creamos unas tablas para el ejercicio de agrupaciones
-- EJEMPLO PRACTICO FACTURACION

-- Productos
CREATE TABLE products (
    id integer NOT NULL,
    product_name VARCHAR(30) NOT NULL,
    price NUMERIC (10,2) NOT NULL,
    CONSTRAINT products_id_pk PRIMARY KEY (id),
    CONSTRAINT products_product_name_uk UNIQUE (product_name)
);

-- Encabezado de facturación
CREATE TABLE invoices (
    id integer NOT NULL,
    invoice_date DATETIME DEFAULT NOW() NOT NULL,
    person_id integer NOT NULL,
    CONSTRAINT invoices_id_pk PRIMARY KEY (id),
    CONSTRAINT invoices_person_id_fk FOREIGN KEY (person_id)
        REFERENCES persons (id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

-- Detalle de facturación
CREATE TABLE invoice_items (
    id integer NOT NULL ,
    invoice_id integer NOT NULL,
    product_id integer NOT NULL,
    price NUMERIC(10,2) NOT NULL,
    quantity INT DEFAULT 1 NOT NULL,
    amount NUMERIC(10,2) NOT NULL,
    CONSTRAINT invoice_items_id_pk PRIMARY KEY (id),
    CONSTRAINT invoice_items_invoice_id_fk FOREIGN KEY (invoice_id)
        REFERENCES invoices (id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
    CONSTRAINT invoice_items_product_id_fk FOREIGN KEY (product_id)
        REFERENCES products (id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
);


-- INSERTAMOS DATOS EN PRODUCTOS
INSERT INTO products VALUES ('111', 'ARROZ', 12.31), ('222', 'PAPA', 1.44), ('333', 'CARNE', 20);

-- INSERTAMOS DATOS EN FACTURACIÓN
INSERT INTO invoices (id,person_id) VALUES ('1001','333');
INSERT INTO invoice_items
VALUES ('3001', '1001', '111', 14.11, 2), ('3002', '1001', '222', 1.44, 1), ('3003', '1001', '333', 21, 3);

INSERT INTO invoices (id,person_id) VALUES ('1002','222');
INSERT INTO invoice_items
VALUES (004, '1002', '222', 1.44, 3), (005, '1002', '333', 21, 12);

INSERT INTO invoices (id,person_id) VALUES ('1003','111');
INSERT INTO invoice_items
VALUES (006, '1003', '111', 14.11, 1), (007, '1003', '222', 1.44, 5);

INSERT INTO invoices (id,person_id) VALUES ('1004','222');
INSERT INTO invoice_items
VALUES (008, '1004', '222', 2, 5);

INSERT INTO invoices (id,person_id) VALUES ('1005','333');
INSERT INTO invoice_items
VALUES (009, '1005', '111', 14.11, 1), (010, '1005', '222', 1.44, 12);



-- CONSULTA DE AGRUPACIONES
	
    -- 1 DISTINCT consulta la información distinguiendo la proyección
		SELECT DISTINCT first_name FROM persons; -- Mostrar los nombres unicos existentes

	-- 2 GROUP BY: Debe contener los campos proyectados a excepción de las funciones
		SELECT last_name FROM persons GROUP BY last_name;
		SELECT first_name, last_name FROM persons GROUP BY first_name, last_name;
        
	-- Consultando información con funciones: COUNT (*) es funcion asi que no se necesita el GROUP BY
		SELECT first_name, COUNT(*) AS cantidad FROM persons GROUP BY first_name;
		SELECT COUNT(*) FROM persons;

		SELECT first_name, COUNT(1) AS cantidad FROM persons GROUP BY first_name; -- Lo mismo que poniendo * pero el 1 es + eficiente
		SELECT first_name, COUNT(last_name) AS cantidad FROM persons GROUP BY first_name; -- Probando y si funciona
		SELECT first_name, COUNT(updated_at) AS cantidad FROM persons GROUP BY first_name; -- No funca bien pq hay registros nulos y los evita 



-- PREGUNTAS CON SQL:
	-- Cuánto es el total de venta de la primer factura?
		SELECT * FROM invoices;
		SELECT * FROM invoice_items WHERE invoice_id = '1001';
		SELECT SUM(price * quantity) FROM invoice_items WHERE invoice_id = '1001';
			-- Respuesta: 92.66

	-- Cuánto es el total de venta de todas las facturas, agrupado por factura?
		SELECT invoice_id, SUM(price*quantity) AS total FROM invoice_items 
		GROUP BY invoice_id ORDER BY invoice_id; 

	-- Cuánto ha comprado en total el cliente Alexys Lozada?
		SELECT SUM(price*quantity) FROM invoice_items WHERE invoice_id 
        IN (SELECT id FROM invoices WHERE person_id='111');
			-- Respuesta: 21.31

	-- Cuál producto se ha vendido más/menos en cantidad?
		SELECT product_id, SUM(quantity) AS cantidad 
		FROM invoice_items GROUP BY product_id ORDER BY cantidad;

	-- Cuál producto se ha vendido más/menos en valor?
		SELECT product_id, SUM(price*quantity) AS valor 
        FROM invoice_items GROUP BY product_id ORDER BY valor;



	-- HAVING:	Es como la clausula WHERE pero por grupos de registros:
		-- Cuál cliente ha hecho más compras? Teniendo en cuenta que contamos una factura como una compra.
			SELECT person_id, COUNT(*) as cantidad
			FROM invoices GROUP BY person_id ORDER BY 2 DESC;	

		-- Cuales personas han comprado 2 veces o más?
			SELECT person_id, COUNT(*) as cantidad FROM invoices 
            GROUP BY person_id HAVING COUNT(*) >= 2;

			SELECT person_id, COUNT(*) as cantidad FROM invoices
			GROUP BY person_id HAVING COUNT(*) = 1;



	-- LIMIT Y OFFSET: Limita la cantidad de registros devueltos. Para paginar consultas.
		SELECT * FROM invoice_items ORDER BY id;

		-- Mostrar los primeros 3
		SELECT * FROM invoice_items ORDER BY id LIMIT 3;

		-- 6fa 896 ad5
		SELECT * FROM invoice_items ORDER BY id LIMIT 3 OFFSET 0; -- PÁGINA 1
		SELECT * FROM invoice_items ORDER BY id LIMIT 3 OFFSET 3; -- PÁGINA 2
		SELECT * FROM invoice_items ORDER BY id LIMIT 3 OFFSET 6; -- PÁGINA 3
		SELECT * FROM invoice_items ORDER BY id LIMIT 3 OFFSET 9; -- PÁGINA 4

		-- Paginación
			-- offset := página * límite - límite
			-- offset := 1 * 5 - 5 = 0
			-- offset := 2 * 5 - 5 = 5
			-- offset := 3 * 5 - 5 = 10
