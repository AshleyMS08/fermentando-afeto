var medidaModel = require("../models/medidaModel");

function obterExperienciaPredominante(req, res) {
   medidaModel.obterExperienciaPredominante()
    .then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado para KPI Experiência!");
        }

    }).catch(function (erro) {
        console.log("\nHouve um erro ao bucar KPI Experiência! ", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function obterObjetivoPredominante(req, res) {
   medidaModel.obterObjetivoPredominante()
    .then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado para KPI Objetivo!");
        }

    }).catch(function (erro) {
        console.log("\nHouve um erro ao bucar KPI Objetivo! ", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function obterDadosObjetivos(req, res) {
   medidaModel.obterDadosObjetivos()
    .then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado para Gráfico Objetivo!");
        }

    }).catch(function (erro) {
        console.log("\nHouve um erro ao bucar Gráfico Objetivo! ", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function obterDadosCategorias(req, res) {
   medidaModel.obterDadosCategorias()
    .then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado para Gráfico Categorias!");
        }

    }).catch(function (erro) {
        console.log("\nHouve um erro ao bucar Gráfico Categorias! ", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

module.exports = {
    obterExperienciaPredominante,
    obterObjetivoPredominante,
    obterDadosObjetivos,
    obterDadosCategorias
};