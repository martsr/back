var pool = require("./db");

async function getMessages() {
  var query = "select * from messages";
  var rows = await pool.query(query);
  return rows;
}

async function deleteMessageById(id) {
  var query = "delete from messages where id_message=?";
  var rows = await pool.query(query, [id]);
  return rows;
}

async function getMessageById(id) {
  var query = "select * from messages where id_message=?";
  var rows = await pool.query(query, [id]);
  return rows[0];
}
async function updateMessageById(obj, id) {
  try {
    var query = "update messages set ? where id_message=?";
    var rows = await pool.query(query, [obj, id]);
    return rows;
  } catch (error) {
    throw error;
  }
}
module.exports = {
  getMessages,
  deleteMessageById,
  getMessageById,
  updateMessageById,
};
