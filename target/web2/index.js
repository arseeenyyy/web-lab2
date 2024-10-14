document.getElementById("submit").addEventListener("click", function(event) {
    event.preventDefault(); 

    const xValue = document.querySelector('input[name="x-value"]:checked').value;
    const yValue = document.getElementById('y-value').value;
    const rValue = document.getElementById('r-value').value;
    // alert([xValue, yValue, rValue]);

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

        addToTableRow(xValue, yValue, rValue, new Date().toLocaleString(), execTime, hitResult);
    })
    .catch(error => {
        console.error('error: ', error);
    });
});
