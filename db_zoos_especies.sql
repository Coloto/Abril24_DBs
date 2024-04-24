CREATE TABLE zoo(
	id_zoo SERIAL PRIMARY KEY,
	pais VARCHAR(30),
	ciudad VARCHAR(30),
	tamaño NUMERIC,
	presupuesto_anual DECIMAL
);

CREATE TABLE especie(
	id_especie SERIAL PRIMARY KEY,
	nombre_cientifico VARCHAR(40),
	nombre_coloquial VARCHAR(40),
	familia VARCHAR(20),
	en_peligro BOOLEAN
);

CREATE TABLE animal(
	id_animal SERIAL PRIMARY KEY,
	id_zoo INT,
	id_especie INT,
	sexo VARCHAR(10),
	fecha_nacimiento DATE,
	pais_origen VARCHAR(20),
	continente VARCHAR(20),
	FOREIGN KEY (id_zoo) REFERENCES zoo(id_zoo),
	FOREIGN KEY (id_especie) REFERENCES especie(id_especie)
);