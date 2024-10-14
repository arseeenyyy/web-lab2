function drawPoint(x, y) {
    const svg = document.querySelector('svg');
    const rValue = document.getElementById('r-value').value;

    // Масштабирование координат в зависимости от R
    const scaleFactor = 150 / rValue; // 150 соответствует координате R на графике
    const scaledX = x * scaleFactor;
    const scaledY = -y * scaleFactor; // Инвертируем Y, так как SVG использует другую систему координат

    // Создание элемента circle для точки
    const circle = document.createElementNS('http://www.w3.org/2000/svg', 'circle');
    circle.setAttribute('cx', scaledX);
    circle.setAttribute('cy', scaledY);
    circle.setAttribute('r', 5); // Радиус точки
    circle.setAttribute('fill', 'red'); // Цвет точки

    // Добавляем точку в SVG
    svg.appendChild(circle);
}

document.getElementById("submit").addEventListener("click", function(event) {
    event.preventDefault(); 

    const xValue = document.querySelector('input[name="x-value"]:checked').value;
    const yValue = document.getElementById('y-value').value;
    const rValue = document.getElementById('r-value').value;

    if (!(validateX(xValue) && validateY(yValue) && validateR(rValue))) return;
    fetch("check", {
        method: "POST", 
        headers: {
            "Content-type": "application/x-www-form-urlencoded", 
        }, 
        body: new URLSearchParams({
            "x": xValue, 
            "y": yValue, 
            "r": rValue
        })
    })
    .then(response => {
        if (!response.ok) throw new Error();
        return response.json();
    })
    .then(response => {
        const hitResult = response.result;
        const execTime = response.executionTime; 
        const currentDate = new Date().toLocaleString();

        drawPoint(xValue, yValue);
        addToTableRow(xValue, yValue, rValue, currentDate, execTime, hitResult);
    })
    .catch(error => {
        console.error('error: ', error);
    });
});

window.onload = function() {
    highlightRButton();
}
