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
    estado VARCHAR(25) not null,
    respuesta VARCHAR(25),
    PRIMARY KEY (codigo_mensaje)
);

CREATE TABLE Vehiculos(
    matricula VARCHAR(8) not null,
    dni VARCHAR(15) not null,
    modelo VARCHAR(20) not null, 
    marca VARCHAR(15) not null,
    anyoVehiculo DATE not null,
    kilometrajeActual double not null,
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
    codigo_reparacion int not null AUTO_INCREMENT,
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
    codigo_pieza int AUTO_INCREMENT,
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

CREATE TABLE Pedidos(
    id_pedido int not null AUTO_INCREMENT,
    dni VARCHAR(9) not null,
    precio_total float not null,
    direccion_envio VARCHAR(255) not null,
    estado VARCHAR(25) not null,
    PRIMARY KEY (id_pedido),
    CONSTRAINT fk_dni_pedido FOREIGN KEY (dni) REFERENCES Usuarios(dni)
);

CREATE TABLE DetallesPedido(
    id_detalle int not null AUTO_INCREMENT,
    id_pedido int not null,
    id_producto int not null,
    cantidad int not null,
    precio float not null,
    PRIMARY KEY (id_detalle),
    CONSTRAINT fk_id_pedido_detalle FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
    CONSTRAINT fk_id_producto_detalle FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

CREATE TABLE Categorias(
    nombre_categoria VARCHAR(259) not null,
    PRIMARY KEY(nombre_categoria)
);

INSERT into Categorias(nombre_categoria) VALUES('Ambientador');
INSERT into Categorias(nombre_categoria) VALUES('Limpieza');
INSERT into Categorias(nombre_categoria) VALUES('Gadget ');
INSERT into Usuarios (dni, telefono, email, password, nombre, apellido, tipoUsuario, direccion) VALUES ('54187001J', '603865955', 'adminjefe@adminnaviauto.com', 'AdminJefe12345@', 'Javier', 'Vidal', 'jefe', 'Calle Geranio n/7');
INSERT into Productos (nombre, descripcion, categoria, url, precio, stock) VALUES ('AURA',' Absorbe olor para coche esférico.','Ambientador','resources/productos/cristalinasAmbientador4.jpg',4.99,200);
INSERT into Productos (nombre, descripcion, categoria, url, precio, stock) VALUES ('AREON - Platinum','Perfume elegante.','Ambientador','resources/productos/areonAmbientador.jpg',16.99,50);
INSERT into Productos (nombre, descripcion, categoria, url, precio, stock) VALUES ('CRISTALINAS - Pack 2','Aroma a Mora, fresco y limpio.','Ambientador','resources/productos/cristalinasAmbientador.jpg',9.99,100);
INSERT into Productos (nombre, descripcion, categoria, url, precio, stock) VALUES ('California SCENTS','Aroma limpio de cereza.','Ambientador','resources/productos/californiaAmbientador.jpg',7.43,222);
INSERT into Productos (nombre, descripcion, categoria, url, precio, stock) VALUES ('CRISTALINAS - Pack 2','Aroma a colonia de bebé.','Ambientador','resources/productos/cristalinasAmbientador2.jpg',8.90,250);
INSERT into Productos (nombre, descripcion, categoria, url, precio, stock) VALUES ('CRISTALINAS','Aroma agradable a Manzana.','Ambientador','resources/productos/cristalinasAmbientador3.jpg',7.90,250);
INSERT into Productos (nombre, descripcion, categoria, url, precio, stock) VALUES ('RDS Radio Coche','Bluetooth 5.0 Estéreo, Luz de Botón 7 Colores','Gadget','resources/productos/radio1.jpg',25.00,200);
INSERT into Productos (nombre, descripcion, categoria, url, precio, stock) VALUES ('Radio Coche 1 DIN','Avylet Autoradio Bluetooth 5.0 Soporta Llamadas Manos Libres/FM/AUX-IN/SD/U Disk/Control Remoto.','Gadget','resources/productos/radio2.jpg',21.99,155);
INSERT into Productos (nombre, descripcion, categoria, url, precio, stock) VALUES ('LENCENT v2 Transmisor FM','Bluetooth 5.0 Estéreo, Luz de Botón 7 Colores','Gadget','resources/productos/radio3.jpg',18.99,150);
INSERT into Productos (nombre, descripcion, categoria, url, precio, stock) VALUES ('LENCENT Transmisor FM','Manos Libres Reproductor Música Coche.','Gadget','resources/productos/radio4.jpg',15.99,150);
INSERT into Productos (nombre, descripcion, categoria, url, precio, stock) VALUES ('Glangeh Soporte Movil Coche','Gancho para ventilación de aire, rotación 360° accesorio movil coche con liberación de un botón.','Gadget','resources/productos/gps1.jpg',11.99,100);
INSERT into Productos (nombre, descripcion, categoria, url, precio, stock) VALUES ('Beikell Soporte Móvil Coche','Soporte para móvil universal.','Gadget','resources/productos/gps2.jpg',8.99,150);
INSERT into Productos (nombre, descripcion, categoria, url, precio, stock) VALUES ('Escobilla limpiaparabrisas Bosch Twin 653','Longitud: 650mm/400mm.','Limpieza','resources/productos/escobilla1.jpg',15.99,150);
INSERT into Productos (nombre, descripcion, categoria, url, precio, stock) VALUES ('Escobilla limpiaparabrisas Bosch Rear H351','Para ventana trasera, Longitud: 350mm.','Limpieza','resources/productos/escobilla2.jpg',11.99,100);
INSERT into Productos (nombre, descripcion, categoria, url, precio, stock) VALUES ('Escobilla limpiaparabrisas Bosch Aerotwin AR604S','Longitud: 600mm/450mm.','Limpieza','resources/productos/escobilla3.jpg',17.59,150);

