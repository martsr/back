var express = require("express");
var router = express.Router();
var exhibitionsModel = require("./../models/exhibitionsModel");
var cloudinary = require("cloudinary").v2;
var nodemailer = require("nodemailer");

router.get("/exhibitions", async function (req, res, next) {
  let exhibitions = await exhibitionsModel.getExhibitions();
  exhibitions = exhibitions.map((exhibition) => {
    if (exhibition.img_id) {
      const img = cloudinary.url(exhibition.img_id, {
        width: 225,
        height: 225,
        crop: "fill",
      });
      return {
        ...exhibition,
        img,
      };
    } else {
      return {
        ...exhibition,
        img: "",
      };
    }
  });
  res.json(exhibitions);
});

router.post("/contact", async (req, res) => {
  const mail = {
    to: "martinarivero@gmail.com",
    subject: "Exhibition Question",
    html: `${req.body.name} is contacting you and whants more information send to this email ${req.body.email}<br> The comment is the following one: ${req.body.question}<br>  `,
  };
  var transport = nodemailer.createTransport({
    host: process.env.SMTP_HOST,
    port: process.env.SMTP_PORT,
    auth: {
      user: process.env.SMTP_USER,
      pass: process.env.SMTP_PASS,
    },
  });
  await transport.sendMail(mail);
  res.status(201).json({
    error: false,
    message: "Email Sent",
  });
});
module.exports = router;
