/*
     path:api/login
*/

const { Router, response } = require("express");
const { crearUsuario } = require("../controllers/auth");
const { check } = require("express-validator");
const { validarCampos } = require("../middleware/validar-campos");
const router = Router();

router.post("/new", [
  check("nombre","El nombre es obligatorio").not().isEmpty(),
  check("password","La contraseña es obligatoria").not().isEmpty(),
  check("email","El email es obligatorio").not().isEmail(),
  validarCampos
],crearUsuario);


module.exports = router;