let points = [];

function save() {
    localStorage.setItem('points', JSON.stringify(points));
}
function load() {
    points = JSON.parse(localStorage.getItem('points')) || []; 
    drawAllPoints();
}

function drawPoint(x, y, hitResult) {
    const svg = document.querySelector('svg');
    const rValue = document.getElementById('r-value').value;  

    const scaleFactor = 150 / rValue;
    const scaledX = x * scaleFactor;
    const scaledY = -y * scaleFactor;

    const circle = document.createElementNS('http://www.w3.org/2000/svg', 'circle');
    circle.setAttribute('cx', scaledX);
    circle.setAttribute('cy', scaledY);
    circle.setAttribute('r', 5);
    circle.setAttribute('fill', hitResult ? 'green' : 'red');

    svg.appendChild(circle);
}
function clearPoints() {
    const svg = document.querySelector('svg');
    const circles = svg.querySelectorAll('circle');
    circles.forEach(circle => circle.remove());
}
function drawAllPoints() {
    clearPoints(); 
    points.forEach(point => {
        drawPoint(point.x, point.y, point.hitResult); 
    });
}
document.getElementById('plot').addEventListener('click', function(event) {
    if (!validateR(document.getElementById('r-value').value)) return;

    let svg = event.currentTarget;
    let rect = svg.getBoundingClientRect();
    const r = document.getElementById('r-value').value;

    let clickX = event.clientX - rect.left;
    let clickY = event.clientY - rect.top;

    const scaleFactor = 150 / r;
    let x = Math.round((clickX - 200) / scaleFactor);  
    let y = -((clickY - 200) / scaleFactor).toFixed(2);  

    if (x < -5 || x > 3) {
        writeErrorMessage("unable to round X value"); 
        return;
    }

    let radios = document.querySelectorAll('input[name="x-value"]');
    radios.forEach(radio => {
        if (parseInt(radio.value) === x) {
            radio.checked = true;
        }
    });
    document.getElementById('y-value').value = y;
});
document.getElementById('submit').addEventListener('click', function(event) {
    event.preventDefault(); 

    const xValue = document.querySelector('input[name="x-value"]:checked').value;
    const yValue = document.getElementById('y-value').value;
    const rValue = document.getElementById('r-value').value;

    if (!(validateX(xValue) && validateY(yValue) && validateR(rValue))) return;

    fetch('check', {
        method: 'POST', 
        headers: {
            'Content-type': 'application/x-www-form-urlencoded', 
        }, 
        body: new URLSearchParams({
            'x': xValue, 
            'y': yValue, 
            'r': rValue
        })
    })
    .then(response => {
        if (!response.ok) throw new Error();
        return response.json();
    })
    .then(response => {
        const hitResult = response.result;
        const execTime = response.executionTime;

        points.push({x: parseInt(xValue), y: parseFloat(yValue), hitResult: hitResult}); 
        save();
        clearSelection();
        drawAllPoints();
        
        addToTableRow(xValue, yValue, rValue, execTime, hitResult);  
    })
    .catch(error => {
        console.error('error: ', error);
    });
});

window.onload = function() {
    highlightRButton();  
    load();
    clearSelection();
};
