var express = require("express");
var router = express.Router();
var exhibitionsModel = require("./../models/exhibitionsModel");
var cloudinary = require("cloudinary").v2;

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

module.exports = router;
