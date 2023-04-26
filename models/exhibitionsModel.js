var pool = require("./db");

async function getExhibitions() {
  var query = "select * from exhibitions";
  var rows = await pool.query(query);
  return rows;
}

async function insertExhibition(obj) {
  try {
    var query = "insert into exhibitions set ?";
    var rows = await pool.query(query, [obj]);
    return rows;
  } catch (error) {
    console.log(error);
    throw error;
  }
}

async function deleteExhibitionById(id) {
  var query = "delete from exhibitions where id = ?";
  var rows = await pool.query(query, [id]);
  return rows;
}

async function getExhibitionById(id) {
  var query = "select * from exhibitions where id = ?";
  var rows = await pool.query(query, [id]);
  return rows[0];
}

async function updateExhibitionById(obj, id) {
  try {
    var query = "update exhibitions set ? where id = ?";
    var rows = await pool.query(query, [obj, id]);
    return rows;
  } catch (error) {
    throw error;
  }
}

module.exports = {
  getExhibitions,
  insertExhibition,
  deleteExhibitionById,
  getExhibitionById,
  updateExhibitionById,
};
