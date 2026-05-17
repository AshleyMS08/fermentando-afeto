var database = require("../database/config");

function buscarDadosGrafico() {
    console.log("ACESSEI O PREFERENCIA MODEL para executar o SELECT da dashboard")

    var fkPai = (fkComentario == undefined || fkComentario == null) ? "NULL" : fkComentario;

    var instrucaoSql = `
        SELECT 
            objetivo,
            COUNT (idPreferencia) AS total
        FROM preferencia
        GROUP BY objetivo;
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);

}

module.exports = {
    buscarDadosGrafico
};