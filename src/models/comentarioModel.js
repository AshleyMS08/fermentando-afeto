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

function listar(idReceita) {
    console.log("ACESSEI O COMENTÁRIO MODEL para executar o SELECT. ID Receita: ", idReceita);

    var instrucaoSql = `
    SELECT 
        c.idComentario,
        c.comentario,
        DATE_FORMAT(c.dtComentario, '%d/%m/%Y') AS dtComentario,
        u.nome
    FROM comentario AS c
    JOIN usuario AS u ON c.fkusuario = u.idUsuario
    WHERE c.fkReceita = ${idReceita}
    ORDER BY c.idComentario DESC;
    `;

    console.log("Executanto a instrução SQL: \n" + instrucaoSql)
}

module.exports = {
    cadastrar,
    listar
}