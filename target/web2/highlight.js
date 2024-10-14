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
function validateX(x) {
    if (!x) {
        writeErrorMessage('Please choose X value');
        return false;
    }
    return true;
}
function validateY(y) {
    const yValueFloat = parseFloat(y); 
    if (isNaN(yValueFloat)) {
        writeErrorMessage('Y value should be numeric');
        return false;
    } else if (yValueFloat <= -5 || yValueFloat >= 5) {
        writeErrorMessage('Y value should be between -5 and 5');
        return false;
    } else {
        return true;
    }
}
function validateR(r) {
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
function addToTableRow(x, y, r, currentTime, execTime, hitResult) {
    const table = document.getElementById('result-table');
    const newRow = table.insertRow();

    const xCell = newRow.insertCell(0); 
    xCell.textContent = x;

    const yCell = newRow.insertCell(1); 
    yCell.textContent = y;

    const rCell = newRow.insertCell(2); 
    rCell.textContent = r;

    const currentTimeCell = newRow.insertCell(3); 
    currentTimeCell.textContent = currentTime; 

    const execTimeCell = newRow.insertCell(4); 
    execTimeCell.textContent = execTime;

    const resultCell = newRow.insertCell(5); 
    resultCell.textContent = hitResult ? 'hit' : 'miss';
}


window.onload = highlightRButton; 