var express = require("express");
var router = express.Router();
var messagesModel = require("../../models/messagesModel");

/* GET home page. */
router.get("/", async function (req, res, next) {
  var messages = await messagesModel.getMessages();
  res.render("admin/messages", {
    layout: "admin/layout",
    user: req.session.name,
    messages,
  });
});

router.get("/delete/:id", async (req, res, next) => {
  var id = req.params.id;
  await messagesModel.deleteMessageById(id);
  res.redirect("/admin/messages");
});

router.get("/messageUpdate/:id", async (req, res, next) => {
  let id = req.params.id;
  let message = await messagesModel.getMessageById(id);
  res.render("admin/messageUpdate", {
    layout: "admin/layout",
    message,
  });
});

router.post("/messageUpdate", async (req, res, next) => {
  try {
    let obj = {
      answer: req.body.answer,
    };
    await messagesModel.updateMessageById(obj, req.body.id);
    res.redirect("/admin/messages");
  } catch (error) {
    console.log(error);
    res.render("admin/messageUpdate", {
      layout: "admin/layout",
      error: true,
      msj: "The message was not updated",
    });
  }
});

module.exports = router;
