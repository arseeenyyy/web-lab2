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
        

        addToTableRow(xValue, yValue, rValue, currentDate, execTime, hitResult);
        saveToLocalStorage(xValue, yValue, rValue, currentDate, execTime, hitResult);
    })
    .catch(error => {
        console.error('error: ', error);
    });
});
function saveToSessioStorage(x, y, r, currentTime, execTime, hitResult) {
    const points = JSON.parse(sessionStorage.getItem('points')) || [];
    points.push({ x, y, r, currentTime, execTime, hitResult });
    sessionStorage.setItem('points', JSON.stringify(points));
}

// Загружаем данные из localStorage при загрузке страницы
window.onload = function() {
    highlightRButton();
    const points = JSON.parse(sessionStorage.getItem('points')) || [];
    points.forEach(point => {
        addToTableRow(point.x, point.y, point.r, point.currentTime, point.execTime, point.hitResult);
    });
};
