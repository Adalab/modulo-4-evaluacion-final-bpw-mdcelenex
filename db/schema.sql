CREATE DATABASE IF NOT EXISTS simpsons;

USE simpsons;

CREATE TABLE personajes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50),
  ocupacion VARCHAR(100),
  descripcion TEXT
);

CREATE TABLE capitulos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(100) NOT NULL,
  numero_episodio INT,
  temporada INT,
  fecha_emision DATE,
  sinopsis TEXT
);

CREATE TABLE frases (
  id INT AUTO_INCREMENT PRIMARY KEY,
  texto TEXT NOT NULL,
  marca_tiempo VARCHAR(10),
  descripcion TEXT,
  personaje_id INT,
  capitulo_id INT,
  FOREIGN KEY (personaje_id) REFERENCES personajes(id),
  FOREIGN KEY (capitulo_id) REFERENCES capitulos(id)
);

CREATE TABLE personaje_capitulo (
  personaje_id INT,
  capitulo_id INT,
  PRIMARY KEY (personaje_id, capitulo_id),
  FOREIGN KEY (personaje_id) REFERENCES personajes(id),
  FOREIGN KEY (capitulo_id) REFERENCES capitulos(id)
);