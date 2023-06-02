CREATE DATABASE naviauto;

CREATE TABLE Usuarios( 
    dni VARCHAR(9) not null,
    telefono VARCHAR(9) not null,
    email VARCHAR(55) not null, 
    password VARCHAR(16) not null, 
    nombre VARCHAR(15) not null, 
    apellido VARCHAR(15) not null, 
    tipoUsuario VARCHAR(15) not null,
    direccion VARCHAR(25),  
    PRIMARY KEY (dni)
);

CREATE TABLE Mensajes(
    codigo_mensaje int not null AUTO_INCREMENT,
    nombre VARCHAR(15) not null,
    apellido VARCHAR(15) not null,
    correo VARCHAR(55) not null,
    asunto VARCHAR(55) not null,
    mensaje VARCHAR (299) not null,
    PRIMARY KEY (codigo_mensaje)
);

CREATE TABLE Vehiculos(
    matricula VARCHAR(8) not null,
    dni VARCHAR(15) not null,
    modelo VARCHAR(20) not null, 
    marca VARCHAR(15) not null,
    anyoVehiculo DATE not null,
    kilometrajeActual int not null,
    PRIMARY KEY (matricula),
    CONSTRAINT fk_dni FOREIGN KEY (dni) REFERENCES Usuarios(dni)
);


CREATE TABLE Productos(
    id_producto int not null AUTO_INCREMENT,
    nombre VARCHAR(25) not null,
    descripcion VARCHAR(95) not null,
    categoria VARCHAR(20) not null,
    url VARCHAR(99) not null,
    precio float not null,
    stock int not null,
    PRIMARY KEY (id_producto)
);

CREATE TABLE Servicio(
    id_servicio int not null AUTO_INCREMENT,
    nombre VARCHAR(25) not null,
    descripcion VARCHAR(254) not null,
    PRIMARY KEY (id_servicio)
);


CREATE TABLE Factura(
    codigo_factura int not null,
    dni VARCHAR(9) not null,
    descripcion VARCHAR (254) not null,
    fecha DATE not null,
    precio float not null,
    PRIMARY KEY (codigo_factura),
    CONSTRAINT fk_dni_cliente FOREIGN KEY (dni) REFERENCES Usuarios(dni)
);


CREATE TABLE Reparaciones(
    codigo_reparacion int not null,
    matricula VARCHAR(8) not null,
    descripcion VARCHAR(249),
    fechaEntrada DATE not null,
    fechaFinalizacion DATE,
    estado VARCHAR(25),
    precio float,
    PRIMARY KEY (codigo_reparacion),
    CONSTRAINT fk_matricula FOREIGN KEY (matricula) REFERENCES Vehiculos(matricula)
);


CREATE TABLE Piezas(
    codigo_pieza int,
    codigo_reparacion int,
    nombre VARCHAR(25),
    fabricante VARCHAR(25),
    precio float,
    PRIMARY KEY (codigo_pieza),
    CONSTRAINT fk_id_reperacion FOREIGN KEY (codigo_reparacion) REFERENCES Reparaciones(codigo_reparacion)
);

CREATE TABLE Carrito(
    id_carrito int not null AUTO_INCREMENT,
    dni VARCHAR(9) not null,
    id_producto int not null,
    precio float not null,
    cantidad int not null,
    PRIMARY KEY (id_carrito),
    CONSTRAINT fk_dni_carrito FOREIGN KEY (dni) REFERENCES Usuarios(dni),
    CONSTRAINT fk_id_producto_carrito FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);



INSERT into Usuarios (dni, telefono, email, password, nombre, apellido, tipoUsuario, direccion) VALUES ('54187001J', '603865955', 'adminjefe@adminnaviauto.com', 'AdminJefe12345@', 'Javier', 'Vidal', 'jefe', 'Calle Geranio n/7');
INSERT into Productos (nombre, descripcion, categoria, url, precio, stock) VALUES ('AURA',' Absorbe olor para coche esférico.','ambientador','resources/productos/cristalinasAmbientador4.jpg',4.99,200);
INSERT into Productos (nombre, descripcion, categoria, url, precio, stock) VALUES ('AREON - Platinum','Perfume elegante.','ambientador','resources/productos/areonAmbientador.jpg',16.99,50);
INSERT into Productos (nombre, descripcion, categoria, url, precio, stock) VALUES ('CRISTALINAS - Pack 2','Aroma a Mora, fresco y limpio.','ambientador','resources/productos/cristalinasAmbientador.jpg',9.99,100);
INSERT into Productos (nombre, descripcion, categoria, url, precio, stock) VALUES ('California SCENTS','Aroma limpio de cereza.','ambientador','resources/productos/californiaAmbientador.jpg',7.43,222);
INSERT into Productos (nombre, descripcion, categoria, url, precio, stock) VALUES ('CRISTALINAS - Pack 2','Aroma a colonia de bebé.','ambientador','resources/productos/cristalinasAmbientador2.jpg',8.90,250);
INSERT into Productos (nombre, descripcion, categoria, url, precio, stock) VALUES ('CRISTALINAS','Aroma agradable a Manzana.','ambientador','resources/productos/cristalinasAmbientador3.jpg',7.90,250);

