CREATE TABLE socio(
	dni_socio CHAR(9) PRIMARY KEY,
	nombre VARCHAR(20),
	apellidos VARCHAR(40),
	direccion VARCHAR(50),
	fecha_inscripcion DATE
);

CREATE TABLE barco(
	matricula CHAR(10) PRIMARY KEY,
	dni_socio CHAR(9),
	nombre_barco VARCHAR(20),
	numero_amarre VARCHAR(3),
	cuota_amarre DECIMAL,
	FOREIGN KEY (dni_socio) REFERENCES socio(dni_socio) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE salida(
	matricula CHAR(10),
	dia_salida DATE,
	hora_salida DATE,
	destino VARCHAR(30),
	nombre_patron VARCHAR(20),
	dni_patron CHAR(9),
	FOREIGN KEY (matricula) REFERENCES barco(matricula) ON DELETE CASCADE ON UPDATE CASCADE
);
