var database = require("../database/config");

function cadastrar(comentario, fkReceita, fkUsuario, fkComentario) {
    console.log("ACESSEI O COMENTÁRIO MODEL para executar o INSERT")

    var fkPai = (fkComentario == undefined || fkComentario == null) ? "NULL" : fkComentario;

    var instrucaoSql = `
        INSERT INTO comentario (comentario, fkReceita, fkUsuario, fkComentario)
        VALUES ('${comentario}', ${fkReceita}, ${fkUsuario}, ${fkPai});
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);

    return database.executar(instrucaoSql);

}

module.exports = {
    cadastrar
};