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
-- Relacion Uno a Uno con tabla Personas
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


-- Relacion muchos a muchos materias
-- Relacion de uno a muchos carreras
CREATE TABLE IF NOT EXISTS Aulas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email varchar(255) NOT NULL UNIQUE,
    contrasena VARCHAR(255) NOT NULL,
    id_materiasAulas INT,
	id_carreras INT,
    FOREIGN KEY (id_persona) REFERENCES personas(id),
    FOREIGN KEY (id_persona) REFERENCES personas(id)
);

-- Relacion muchos a muchos materias-aulas
CREATE TABLE IF NOT EXISTS materiasAulas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_aula INT,
	id_materia INT,
    FOREIGN KEY (id_aula) REFERENCES aulas(id).
    FOREIGN KEY (id_materia) REFERENCES materias(id)
);




-- Crear la tabla Reservas
-- Relacion uno a uno con persona
CREATE TABLE IF NOT EXISTS Reservas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aula VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    fecha DATE NOT NULL,
    horaInicio TIME NOT NULL,
    horaFin TIME NOT NULL,
    id_persona INT UNIQUE,
    FOREIGN KEY (id_persona) REFERENCES personas(id)
);



-- Crear la tabla Carreras

CREATE TABLE IF NOT EXISTS Carreras (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    horarios VARCHAR(255) NOT NULL
);




-- Crear la tabla Imagen
-- Relacion uno a uno con Usuarios
CREATE TABLE IF NOT EXISTS Imagen (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(255) NOT NULL,
    ruta VARCHAR(500) NOT NULL,
	id_usuario INT UNIQUE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);



-- Crear la tabla Sugerencias
-- Relacion Uno a Uno con tabla Usuarios
CREATE TABLE IF NOT EXISTS Sugerencias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo varchar(255) NOT NULL,
    contenido VARCHAR(500) NOT NULL,
	id_usuario INT UNIQUE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

--controlaulas@ticsuide.online




