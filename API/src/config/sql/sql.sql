-- Crear la base de datos
DROP DATABASE IF EXISTS prueba_flutter;
CREATE DATABASE prueba_flutter;

-- Seleccionar la base de datos
USE prueba_flutter;

-- Crear la tabla Personas
CREATE TABLE IF NOT EXISTS Personas (
    id INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL,
	apellido VARCHAR(255) NOT NULL,
    telefono VARCHAR(255) NOT NULL UNIQUE,
	rol VARCHAR(255) NOT NULL
);

-- Insertar Personas
INSERT INTO Personas (nombre, apellido, telefono, rol) VALUES ('admin','admin','9999999999','admin');
INSERT INTO Personas (nombre, apellido, telefono, rol) VALUES ('user','user','0000000000','user');

-- Crear la tabla Usuarios
-- Relacion Uno a Uno con tabla Usuarios
CREATE TABLE IF NOT EXISTS Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email varchar(255) NOT NULL UNIQUE,
    contrasena VARCHAR(255) NOT NULL,
    salt VARCHAR(20) NOT NULL,
	nivel VARCHAR(10) NOT NULL,
	id_persona INT UNIQUE,
    FOREIGN KEY (id_persona) REFERENCES personas(id)
);

-- Insertar Usuarios
INSERT INTO Usuarios (email, contrasena, salt, nivel, id_persona) VALUES ('admin@admin.com', MD5('admin'), '0', 'admin',1);
INSERT INTO Usuarios (email, contrasena, salt, nivel, id_persona) VALUES ('user@user.com', MD5('user'), '0', 'user',2);


-- Crear la tabla Sugerencias
-- Relacion Uno a Uno con tabla Usuarios
CREATE TABLE IF NOT EXISTS Sugerencias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo varchar(255) NOT NULL,
    contenido VARCHAR(500) NOT NULL,
	id_usuario INT UNIQUE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);






