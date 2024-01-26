const { json2csv } = require('json-2-csv');
const { writeFile } = require("fs/promises");

async function converterArquivo(nomeArquivoCSV, arquivoJson) {
    const json1 = require(arquivoJson);

    const csv = json2csv(json1);
    writeFile(nomeArquivoCSV, csv);
}

converterArquivo('arquivo1.csv', './database1_corrigido.json');
converterArquivo('arquivo2.csv', './database2_corrigido.json');