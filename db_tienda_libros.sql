CREATE TABLE provincia(
	id_provincia SERIAL PRIMARY KEY,
	nombre_provincia VARCHAR(20),
	id_almacen INT
);

CREATE TABLE poblacion(
	id_poblacion SERIAL PRIMARY KEY,
	id_provincia INT,
	nombre VARCHAR(20),
	numero_habitantes INT,
	FOREIGN KEY (id_provincia) REFERENCES provincia(id_provincia)
);

CREATE TABLE socio(
	dni_socio CHAR(9) PRIMARY KEY,
	nombre VARCHAR(20),
	apellidos VARCHAR(40),
	domicilio VARCHAR(50),
	telefono CHAR(9),
	fecha_nacimiento DATE,
	aval varchar(10),
	numero_socio SERIAL,
	id_provincia int,
	FOREIGN KEY (id_provincia) REFERENCES provincia(id_provincia)
);

CREATE TABLE coleccion(
	id_coleccion SERIAL PRIMARY KEY,
	nombre_coleccion VARCHAR(20)
);

CREATE TABLE producto(
	id_producto SERIAL PRIMARY KEY,
	nombre_producto VARCHAR(20),
	stock INT,
	precio DECIMAL,
	detalles VARCHAR(40),
	autor VARCHAR(20),
	id_coleccion INT,
	FOREIGN KEY (id_coleccion) REFERENCES coleccion(id_coleccion)
);

CREATE TABLE pedido(
	numero_pedido SERIAL PRIMARY KEY,
	dni_socio CHAR(9),
	id_producto INT,
	cantidad_libros INT,
	metodo_pago VARCHAR(20),
	metodo_envio VARCHAR(20),
	FOREIGN KEY (dni_socio) REFERENCES socio(dni_socio),
	FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

CREATE TABLE almacen(
	id_almacen SERIAL PRIMARY KEY,
	nombre VARCHAR(20),
	fecha_inicio DATE,
	id_provincia INT UNIQUE,
	FOREIGN KEY (id_provincia) REFERENCES provincia(id_provincia)
);

CREATE TABLE producto_almacen(
	id_producto INT,
	id_almacen INT,
	FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
	FOREIGN KEY (id_almacen) REFERENCES almacen(id_almacen)
);

ALTER TABLE provincia ADD CONSTRAINT fk_almacen FOREIGN KEY (id_almacen) REFERENCES almacen(id_almacen);
