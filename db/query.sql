CREATE DATABASE IF NOT EXISTS simpsons;
USE simpsons;

CREATE TABLE IF NOT EXISTS personajes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  ocupacion VARCHAR(100),
  descripcion TEXT
);

CREATE TABLE IF NOT EXISTS capitulos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(100) NOT NULL,
  numero_episodio INT NOT NULL,
  temporada INT NOT NULL,
  fecha_emision DATE,
  sinopsis TEXT
);

CREATE TABLE IF NOT EXISTS frases (
  id INT AUTO_INCREMENT PRIMARY KEY,
  texto TEXT NOT NULL,
  marca_tiempo VARCHAR(10),
  descripcion TEXT,
  personaje_id INT,
  capitulo_id INT,
  FOREIGN KEY (personaje_id) REFERENCES personajes(id),
  FOREIGN KEY (capitulo_id) REFERENCES capitulos(id)
);

CREATE TABLE IF NOT EXISTS capitulos_personajes (
  capitulo_id INT,
  personaje_id INT,
  PRIMARY KEY (capitulo_id, personaje_id),
  FOREIGN KEY (capitulo_id) REFERENCES capitulos(id),
  FOREIGN KEY (personaje_id) REFERENCES personajes(id)
);

INSERT INTO personajes (nombre, apellido, ocupacion, descripcion) VALUES
('Homer', 'Simpson', 'Nuclear Inspector', 'El padre de la familia.'),
('Marge', 'Simpson', 'Ama de casa', 'La madre de la familia, conocida por su cabello azul y alto.'),
('Bart', 'Simpson', 'Estudiante', 'El hijo rebelde.'),
('Lisa', 'Simpson', 'Estudiante', 'La hija que hace skate.'),
('Maggie', 'Simpson', 'Bebé', 'La bebé, conocida por gatear.');

INSERT INTO capitulos (titulo, numero_episodio, temporada, fecha_emision, sinopsis) VALUES
('Homer Odyssey', 3, 1, '1990-01-21', 'Homer se convierte en activista de seguridad en la planta nuclear.'),
('Bart the Genius', 2, 1, '1990-01-14', 'Bart intercambia sus resultados en el test de inteligencia y termina en una escuela para superdotados.'),
('Moaning Lisa', 6, 1, '1990-02-11', 'Lisa enfrenta la tristeza y busca inspiración en la música de jazz.'),
('Krusty Gets Busted', 12, 1, '1990-04-29', 'Krusty el payaso es acusado de un delito que no cometió.');

INSERT INTO frases (texto, marca_tiempo, descripcion, personaje_id, capitulo_id) VALUES
('¡Mmm, cerveza!', '00:00:05', 'Homer muestra su amor por la cerveza.', 1, 1),
('¡Come aquí, Bart!', '00:00:10', 'Frase típica de Homer llamando a Bart.', 1,2),
('¿Dónde están mis pantalones?', '00:00:15', 'Frase graciosa de Homer cuando no encuentra su ropa.', 1,3),
('¡Bart, no hagas eso!', '00:00:20', 'Frase de Homer reprendiéndole a Bart.', 1,4),
('¡Estoy en el cielo! Oh no, es sólo la planta nuclear.', '00:00:25', 'Frase irónica de Homer sobre su trabajo.', 1,4);

-- Puedes añadir datos para capitulos_personajes si quieres relacionar personajes y capítulos
INSERT INTO capitulos_personajes (capitulo_id, personaje_id) VALUES
(1, 1),
(2, 3),
(3, 4),
(4, 1);

