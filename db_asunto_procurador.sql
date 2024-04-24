CREATE TABLE cliente(
	dni_cliente CHAR(9) PRIMARY KEY,
	nombre_cliente VARCHAR(20),
	apellidos_cliente VARCHAR(40),
	direccion_cliente VARCHAR(50)
);

CREATE TABLE asunto(
	n_expediente SERIAL PRIMARY KEY,
	dni_procurador CHAR(9),
	dni_cliente CHAR(9),
	fecha_inicio DATE,
	fecha_fin DATE,
	estado VARCHAR(20),
	foreign key (dni_cliente) references cliente(dni_cliente)
);

CREATE TABLE procurador(
	dni_procurador CHAR(9) PRIMARY KEY,
	nombre_procurador VARCHAR(20),
	direccion_producrador VARCHAR(50)
);

CREATE TABLE asunto_procurador(
	n_expediente INT,
	dni_procurador CHAR(9),
	FOREIGN KEY (n_expediente) REFERENCES asunto(n_expediente),
	FOREIGN KEY (dni_procurador) REFERENCES procurador(dni_procurador)
);
