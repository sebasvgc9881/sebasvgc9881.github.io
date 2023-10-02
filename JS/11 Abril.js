function createMatrices() {
    const rows1 = document.getElementById("rows1").value;
    const columns1 = document.getElementById("columns1").value;
    const rows2 = document.getElementById("rows2").value;
    const columns2 = document.getElementById("columns2").value;

    if (columns1 != rows2) {
        alert("Columns of Matrix 1 should be equal to Rows of Matrix 2.");
        return;
    }

    const matrix1 = createMatrix(rows1, columns1);
    const matrix2 = createMatrix(rows2, columns2);

    displayMatrix(matrix1, "matrix1");
    displayMatrix(matrix2, "matrix2");

    const resultMatrix = multiplyMatrices(matrix1, matrix2);

    displayMatrix(resultMatrix, "result");
}

function createMatrix(rows, columns) {
    const matrix = [];

    for (let i = 0; i < rows; i++) {
        matrix[i] = [];

        for (let j = 0; j < columns; j++) {
            matrix[i][j] = parseInt(prompt(`Enter element (${i},${j})`));
        }
    }

    return matrix;
}

function multiplyMatrices(matrix1, matrix2) {
    const rows1 = matrix1.length;
    const columns1 = matrix1[0].length;
    const rows2 = matrix2.length;
    const columns2 = matrix2[0].length;

    if (columns1 != rows2) {
        alert("Columns of Matrix 1 should be equal to Rows of Matrix 2.");
        return;
    }

    const resultMatrix = [];

    for (let i = 0; i < rows1; i++) {
        resultMatrix[i] = [];

        for (let j = 0; j < columns2; j++) {
            let sum = 0;

            for (let k = 0; k < columns1; k++) {
                sum += matrix1[i][k] * matrix2[k][j];
            }

            resultMatrix[i][j] = sum;
        }
    }

    return resultMatrix;
}

function displayMatrix(matrix, id) {
    const rows = matrix.length;
    const columns = matrix[0].length;

    const table = document.createElement("table");

    for (let i = 0; i < rows; i++) {
        const row = document.createElement("tr");

        for (let j = 0; j < columns; j++) {
            const cell = document.createElement("td");
            cell.innerHTML = matrix[i][j];
            row.appendChild(cell);
        }

        table.appendChild(row);
    }

    document.getElementById(id).appendChild(table);
}