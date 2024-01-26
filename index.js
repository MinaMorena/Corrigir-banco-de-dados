const { readFile, writeFile } = require("fs/promises");

async function lerArquivoJson(arquivoJson) {
    const arquivo = JSON.parse(await readFile(arquivoJson));
    return arquivo;
}

async function corrigirNomesDeMarca(arquivoJson, campo) {
    let dataBase = await lerArquivoJson(arquivoJson);

    dataBase = dataBase.map((item) => {
        const letrasArrumadas = item[campo].replace(/æ/g, 'a').replace(/ø/g, 'o');
        return { ...item, [campo]: letrasArrumadas }
    })

    return dataBase
}

async function corrigirVendas(arquivoJson, campo) {
    let dataBase = await corrigirNomesDeMarca(arquivoJson, campo);

    dataBase = dataBase.map((item) => {
        item.vendas = Number(item.vendas);
        return item;
    })

    return dataBase;
}

async function exportarArquivoCorrigido(nomeNovoArquivoJson, functionDeCorrecao) {
    const dataBase = await functionDeCorrecao;

    const arquivo = JSON.stringify(dataBase);

    return await writeFile(nomeNovoArquivoJson, arquivo);
}

exportarArquivoCorrigido("database1_corrigido.json", corrigirVendas("./broken_database_1.json", "nome"));
exportarArquivoCorrigido("database2_corrigido.json", corrigirNomesDeMarca("./broken_database_2.json", "marca"));