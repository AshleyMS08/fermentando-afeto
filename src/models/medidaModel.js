var database = require("../database/config");

function obterExperienciaPredominante() {
    var instrucaoSql = `
        SELECT nivelExperiencia, COUNT (nivelExperiencia) AS quantidade
        FROM preferencia
        GROUP BY nivelExperiencia
        ORDER BY quantidade DESC
        LIMIT 1;
    `;
    console.log("Executando SQL -> KPI Experiência Predominante: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function obterObjetivoPredominante() {
    var instrucaoSql = `
        SELECT objetivo, COUNT (objetivo) AS quantidade
        FROM preferencia
        GROUP BY objetivo
        ORDER BY quantidade DESC
        LIMIT 1;
    `;
    console.log("Executando SQL -> KPI Objetivo Predominante: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function obterDadosObjetivos() {
    var instrucaoSql = `
        SELECT objetivo, COUNT (idPreferencia) AS total_usuarios
        FROM preferencia
        GROUP BY objetivo;
    `;
    console.log("Executando SQL -> Gráfico Objetivos: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function obterDadosCategorias() {
    var instrucaoSql = `
        SELECT c.categoria AS tipo_categoria, COUNT (idReceita) AS total_receitas
        FROM categoria AS c
        LEFT JOIN receita AS r ON c.idCategoria = r.fkCategoria
        GROUP BY c.categoria;
    `;
    console.log("Executando SQL -> Gráfico Categoria de Receitas: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    obterExperienciaPredominante,
    obterObjetivoPredominante,
    obterDadosObjetivos,
    obterDadosCategorias
};