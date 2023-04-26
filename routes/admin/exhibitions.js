var express = require("express");
var router = express.Router();
var exhibitionsModel = require("../../models/exhibitionsModel");
var util = require("util");
var cloudinary = require("cloudinary").v2;

const uploader = util.promisify(cloudinary.uploader.upload);
const destroy = util.promisify(cloudinary.uploader.destroy);

/* GET home page. */
router.get("/", async function (req, res, next) {
  var exhibitions = await exhibitionsModel.getExhibitions();
  exhibitions = exhibitions.map((exhibition) => {
    if (exhibition.img_id) {
      const img = cloudinary.image(exhibition.img_id, {
        width: 50,
        height: 50,
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
  res.render("admin/exhibitions", {
    layout: "admin/layout",
    user: req.session.name,
    exhibitions,
  });
});

router.get("/add", (req, res, next) => {
  res.render("admin/add", {
    layout: "admin/layout",
  });
});

router.post("/add", async (req, res, next) => {
  try {
    var img_id = "";
    if (req.files && Object.keys(req.files).length > 0) {
      image = req.files.image;
      img_id = (await uploader(image.tempFilePath)).public_id;
    }
    if (
      req.body.title != "" &&
      req.body.subtitle != "" &&
      req.body.body != ""
    ) {
      await exhibitionsModel.insertExhibition({
        ...req.body,
        img_id,
      });
      res.redirect("/admin/exhibitions");
    } else {
      res.render("admin/add", {
        layout: "admin/layout",
        error: true,
        message: "All the fields are being required",
      });
    }
  } catch (error) {
    console.log(error);
    res.render("admin/add", {
      layout: "admin/layout",
      error: true,
      message: "The new exhibition was not uploaded",
    });
  }
});

router.get("/delete/:id", async (req, res, next) => {
  var id = req.params.id;
  let exhibit = await exhibitionsModel.getExhibitionById(id);
  if (exhibit.img_id) {
    await destroy(exhibit.img_id);
  }
  await exhibitionsModel.deleteExhibitionById(id);
  res.redirect("/admin/exhibitions");
});

router.get("/update/:id", async (req, res, next) => {
  let id = req.params.id;
  let exhibition = await exhibitionsModel.getExhibitionById(id);
  res.render("admin/update", {
    layout: "admin/layout",
    exhibition,
  });
});

router.post("/update", async (req, res, next) => {
  try {
    let img_id = req.body.img_original;
    let delete_old_img = false;
    if (req.body.img_delete === "1") {
      img_id = null;
      delete_old_img = true;
    } else {
      if (req.files && Object.keys(req.files).length > 0) {
        image = req.files.image;
        img_id = (await uploader(image.tempFilePath)).public_id;
        delete_old_img = true;
      }
    }
    if (delete_old_img && req.body.img_original) {
      await destroy(req.body.img_original);
    }
    let obj = {
      title: req.body.title,
      subtitle: req.body.subtitle,
      description: req.body.description,
      img_id,
    };
    await exhibitionsModel.updateExhibitionById(obj, req.body.id);
    res.redirect("/admin/exhibitions");
  } catch (error) {
    console.log(error);
    res.render("admin/update", {
      layout: "admin/layout",
      error: true,
      message: "The exhibiton could not be updated",
    });
  }
});

module.exports = router;
