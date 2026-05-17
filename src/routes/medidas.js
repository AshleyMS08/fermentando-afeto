var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/kpi-experiencia", function (req, res) {
    medidaController.obterExperienciaPredominante(req, res);
});
router.get("/kpi-objetivo", function (req, res) {
    medidaController.obterObjetivoPredominante(req, res);
});
router.get("/grafico-experiencia", function (req, res) {
    medidaController.obterDadosObjetivos(req, res);
});
router.get("/grafico-categorias", function (req, res) {
    medidaController.obterDadosCategorias(req, res);
});

module.exports = router;