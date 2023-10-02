const matriz1 = [[1, 2, 3], [3, 4, 10], [0, -5, 5]];
const matriz2 = [[5, 6, 0], [7, 8, 0], [5, 10, -1]];

function imprimirMatriz(matriz){
    var resultado = [], mensaje = "";
    for (var i = 0; i < matriz.length; i++) {
      for (var j = 0; j < matriz[i].length; j++) {
        mensaje += "| " + matriz[i][j] + " |";
      }
      mensaje += "\n";
    }
    return mensaje;
}

function sumaMatrices(matriz1, matriz2){
    var resultado = [];
    // Recorrer cada elemento de las matrices y sumarlos
    for (let i = 0; i < matriz1.length; i++) {
      resultado.push([]);
      for (let j = 0; j < matriz1[0].length; j++) {
        resultado[i].push(matriz1[i][j] + matriz2[i][j]);
      }
    }
    return resultado;
};

alert(imprimirMatriz(matriz1) + "\n + \n\n" + imprimirMatriz(matriz2) + "\n = \n\n" + imprimirMatriz(sumaMatrices(matriz1, matriz2)));
