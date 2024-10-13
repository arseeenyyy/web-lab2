document.getElementById("submit").addEventListener("click", function(event) {
    event.preventDefault(); 

    const name = document.getElementById("name").value; 
    const age = document.getElementById("age").value; 
    fetch("check", {
        method: "POST", 
        headers: {
            "Content-Type": "application/x-www-form-urlencoded",
        }, 
        body: new URLSearchParams({
            "name": name, 
            "age": age
        })
    })
    .then(response => {
        if (!response.ok) throw new Error();
        return response.json();
    })
    .then (function (answer) {
        addToTableRow(answer);
    })
});

function addToTableRow(data) {
    const name = data.name; 
    const age = data.age;
    const table = document.getElementById("resultTable"); 
    const newRow = table.insertRow(); 
    const nameCell = newRow.insertCell(0); 
    nameCell.textContent = name;
    const ageCell = newRow.insertCell(1);
    ageCell.textContent = age;
}