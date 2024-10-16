function highlightRButton() {
    const rButtons = document.querySelectorAll('.r-button');
    rButtons.forEach(function(button) {
        button.addEventListener('click', function() {
            rButtons.forEach(btn => btn.classList.remove('active')); 
            this.classList.add('active'); 
            const rInput = document.getElementById('r-value');
            rInput.value = this.value;
        })
    })
}
function clearSelection() {
    var elements = document.getElementsByTagName('input'); 
    for (var i = 0; i < elements.length; i ++) {
        if (elements[i].type == 'radio') 
            elements[i].checked = false;
    }
    document.getElementById('y-value').value = '';
}
function validateX(x) {
    document.getElementById('error-message').innerHTML = '';
    if (!x) {
        writeErrorMessage('Please choose X value');
        return false;
    }
    return true;
}
function validateY(y) {
    document.getElementById('error-message').innerHTML = '';
    const yValueFloat = parseFloat(y); 
    if (isNaN(yValueFloat)) {
        writeErrorMessage('Y value should be numeric');
        return false;
    } else if (yValueFloat < -5 || yValueFloat > 5) {
        writeErrorMessage('Y value should be between -5 and 5');
        return false;
    } else {
        return true;
    }
}
function validateR(r) {
    document.getElementById('error-message').innerHTML = '';
    if (!r) {
        writeErrorMessage('Please choose R value'); 
        return false;
    }
    return true;
}

function writeErrorMessage(message) {
    document.getElementById('error-message').innerHTML = ''; 
    document.getElementById('error-message').innerHTML = message;
}
function addToTableRow(x, y, r, execTime, hitResult) {
    const tableBody = document.getElementById('result-table').getElementsByTagName('tbody')[0];
    
    const newRow = document.createElement("tr");

    const xCell = document.createElement("td");
    xCell.textContent = x;
    newRow.appendChild(xCell);

    const yCell = document.createElement("td");
    yCell.textContent = y;
    newRow.appendChild(yCell);

    const rCell = document.createElement("td");
    rCell.textContent = r;
    newRow.appendChild(rCell);

    const execTimeCell = document.createElement("td");
    execTimeCell.textContent = execTime;
    newRow.appendChild(execTimeCell);

    const resultCell = document.createElement("td");
    resultCell.textContent = hitResult ? 'hit' : 'miss';
    newRow.appendChild(resultCell);

    tableBody.appendChild(newRow);
}



