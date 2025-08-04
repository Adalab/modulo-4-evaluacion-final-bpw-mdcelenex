// Importaciones
const express = require("express");
const cors = require("cors");
const mysql2 = require("mysql2/promise");
const port = process.env.PORT || 4000;
require("dotenv").config();

// Crear y configurar del servidor
const server = express();
server.use(cors());
server.use(express.json());
server.listen(port, () => {
  console.log(`Servidor escuchando en el puerto ${port}`);
});

// Conectarse a MySQL
const getConnection = async () => {
  return await mysql2.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    port: process.env.DB_PORT,
  });
};

// Escuhar el servidor

// ------------------ ENDPOINTS CRUD ------------------

// GET /frases (lista todas las frases con info de personaje y capítulo)
server.get("/frases", async (req, res) => {
  try {
    const conn = await getConnection();
    const [results] = await conn.query(`
      SELECT frases.id, frases.texto, frases.marca_tiempo, frases.descripcion,
             personajes.nombre AS personaje,
             capitulos.titulo AS capitulo
      FROM frases
      JOIN personajes ON frases.personaje_id = personajes.id
      JOIN capitulos ON frases.capitulo_id = capitulos.id
    `);
    await conn.end();
    res.json({
      total: { count: results.length },
      results,
    });
  } catch (error) {
    res.status(500).json({ error: "Error al obtener las frases" });
  }
});

// GET /frases/:id (una frase específica)
server.get("/frases/:id", async (req, res) => {
  const fraseId = req.params.id;
  try {
    const conn = await getConnection();
    const [results] = await conn.query(
      `
      SELECT frases.id, frases.texto, frases.marca_tiempo, frases.descripcion,
             personajes.nombre AS personaje,
             capitulos.titulo AS capitulo
      FROM frases
      JOIN personajes ON frases.personaje_id = personajes.id
      JOIN capitulos ON frases.capitulo_id = capitulos.id
      WHERE frases.id = ?
    `,
      [fraseId]
    );
    await conn.end();

    if (results.length > 0) {
      res.json(results[0]);
    } else {
      res.status(404).json({ error: "La frase no se encuentra" });
    }
  } catch (error) {
    res.status(500).json({ error: "Error al obtener la frase" });
  }
});

// POST /frases (crear nueva frase)
server.post("/frases", async (req, res) => {
  const { texto, marca_tiempo, descripcion, personaje_id, capitulo_id } =
    req.body;
  try {
    const conn = await getConnection();
    const query = `
      INSERT INTO frases (texto, marca_tiempo, descripcion, personaje_id, capitulo_id)
      VALUES (?, ?, ?, ?, ?)
    `;
    const [result] = await conn.query(query, [
      texto,
      marca_tiempo,
      descripcion,
      personaje_id,
      capitulo_id,
    ]);
    await conn.end();
    res.status(201).json({ id: result.insertId, message: "Frase añadida" });
  } catch (error) {
    res.status(500).json({ error: "Error al añadir la frase" });
  }
});

// PUT /frases/:id (actualizar frase)
server.put("/frases/:id", async (req, res) => {
  const fraseId = req.params.id;
  const { texto, marca_tiempo, descripcion, personaje_id, capitulo_id } =
    req.body;
  try {
    const conn = await getConnection();
    const query = `
      UPDATE frases
      SET texto = ?, marca_tiempo = ?, descripcion = ?, personaje_id = ?, capitulo_id = ?
      WHERE id = ?
    `;
    await conn.query(query, [
      texto,
      marca_tiempo,
      descripcion,
      personaje_id,
      capitulo_id,
      fraseId,
    ]);
    await conn.end();
    res.json({ message: "Frase actualizada" });
  } catch (error) {
    res.status(500).json({ error: "Error al actualizar la frase" });
  }
});

// DELETE /frases/:id (eliminar frase)
server.delete("/frases/:id", async (req, res) => {
  const fraseId = req.params.id;
  try {
    const conn = await getConnection();
    await conn.query("DELETE FROM frases WHERE id = ?", [fraseId]);
    await conn.end();
    res.json({ message: "Frase borrada" });
  } catch (error) {
    res.status(500).json({ error: "Error al eliminar la frase" });
  }
});
