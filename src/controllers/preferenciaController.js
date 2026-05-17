var preferenciaModel = require("../models/preferenciaModel");

function buscarDadosGrafico(req, res) {
    console.log("ACESSEI O PREFERENCIA CONTROLLER");

    preferenciaModel.buscarDadosGrafico()
    .then (function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).json([]);
        }
    })
    .catch(function (erro) {
        console.log(erro);
        console.log("\nHouve um erro ao buscar dados das preferências! Erro: ", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

module.exports = {
    buscarDadosGrafico
}