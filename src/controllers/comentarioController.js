var comentarioModel = require("../models/comentarioModel");

function cadastrar(req, res) {
    var comentario = req.body.comentarioServer;
    var fkReceita = req.body.fkReceitaServer;
    var fkUsuario = req.body.fkUsuarioServer;
    var fkcomentario = req.body.fkComentarioServer;

    if (comentario == undefined) {
        res.status(400).send("O texto do comentário está undefined!");
    } else if (fkReceita == undefined) {
        res.status(400).send("A fkReceita(ID da receita) está undefined");
    } else if (fkUsuario == undefined) {
        res.status(400).send("A fkUsuario(ID do usuário) está undefined");
    } else {
        comentarioModel.cadastrar(comentario, fkReceita, fkUsuario, fkComentario)
        .then(function (resultado) {
            res.status(201).json(resultado);
        })
        .catch(function (erro) {
            console.log(erro);
            console.log("\nHouve um erro ao realizar o cadastro do comentário! Erro: ", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage)
        });
    }
}

module.exports = {
    cadastrar
}