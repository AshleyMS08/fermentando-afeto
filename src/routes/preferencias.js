var express = require("express");
var router = express.Router();

var preferenciaController = require("../controllers/preferenciaController");

router.get("/dados-grafico", function (req, res) {
    preferenciaController.buscarDadosGrafico(req, res);
});

module.exports = router;