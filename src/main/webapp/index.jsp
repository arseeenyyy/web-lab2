<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="author" content="Rubtsov Arseniy Dmitrievich">
        <meta name="description" content="Web-programming, lab2">
        <meta name="keywords" content="ITMO, Web-programming, VT">
        <title>Laboratory work no. 2 | Web-programming </title>
        <style>
            :root {
                --primary-background-color: #f0e6dc;
                --secondary-background-color: #d9c9b7;
                --head-background-color: #f2f2f2;
                --default-borders-color: black;
                --error-color: #f54c45;
                --default-borders-radius: 10px;
            }
            body {
                background-color: var(--primary-background-color);
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
            header {
                background-color: var(--head-background-color);
                text-align: center;
                font-family: serif;
                color: black;
                font-size: 15px;
                padding: 20px;
                border: 3px solid #333;
                border-radius: var(--default-borders-radius);
                margin-bottom: 10px;
            }
            #credit a {
                text-align: center;
                text-decoration: none;
                color: inherit;
            }
            td {
                border: 2px solid var(--default-borders-color);
                border-radius: var(--default-borders-radius);
                padding: 10px;
                vertical-align: top;
            }
            .content {
                background-color: var(--secondary-background-color);
                border-radius: var(--default-borders-radius);
                border: 2px solid var(--default-borders-color);
                align-items: center;
                justify-content: center;
            }
            .title-plate {
                text-align: center;
                font-size: 18px;
                font-weight: bold;
                line-height: 2;
                border: 2px solid var(--default-borders-color);
                border-radius: var(--default-borders-radius);
                margin-top: auto;
                background-color: var(--head-background-color);
            }
            #graph {
                width: 50%;
                text-align: center;
            }
            #data-form {
                text-align: center;
                align-items: center;
                
            }
            #result-table {
                width: 100%;
                text-align: center;
                border-collapse: collapse;
            }
            #result-table th, #result-table td {
                border: 1px solid var(--default-borders-color);
                padding: 8px;
            }

            .r-button {
                background-color: var(--secondary-background-color);
                border: 2px solid var(--default-borders-color);
                border-radius: var(--default-borders-radius);
                color: black;
                font-size: 16px;
                width: 50px;
                height: 30px;
                margin: 5px;
                cursor: pointer;
                transition: var(--background-color) 0.3s ease;
            }

            .r-button:hover {
                background-color: var(--primary-background-color);
            }

            input[type="text"] {
                background-color: var(--primary-background-color);
                border: 2px solid var(--default-borders-color);
                border-radius: var(--default-borders-radius);
                font-size: 16px;
                padding: 10px;
                width: 200px;
                height: 15px;
                margin: 10px;
            }
            input[type="submit"] {
                background-color: var(--secondary-background-color);
                border: 2px solid var(--default-borders-color);
                border-radius: var(--default-borders-radius);
                font-size: 18px;
                padding: 10px 20px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }
            

            input[type="submit"]:hover {
                background-color: var(--primary-background-color);
            }
            .r-button.active {
                background-color: black;
                color: black;
                border: 2px solid black;
            }   
            .error-message {
                color: red;
                font-size: 12px;
                margin-top: 5px;
            }
            .x-radio {
                width: 20px;         
                height: 20px;        
                accent-color: black;  
                cursor: pointer;     
                margin-right: 10px;  
                transition: transform 0.2s ease; 
            }
            .x-radio:hover {
                transform: scale(1.2);  
            }
            label {
                font-size: 18px;        
                font-weight: bold;      
                color: black;            
                margin-right: 10px;     
            }
            .x-radio:checked {
                background-color: #f0e6dc; /* Цвет фона для активной кнопки */
            }
            
        </style> 
    </head>
    <body>
        <header>
            <h1>Web - programming | Laboratory no. 2 | Var no. 115218 </h1>
            <div id="credit">
                <a href="https://github.com/arseeenyyy">Rubtsov Arseniy Dmitrievich | P3206</a>
            </div>
        </header>
        <table id="mainTable">
            <tr>
                <td id="graph" class="content">
                    <h2 class="title-plate">Graph</h2>
                    <svg width="400" height="400" viewBox="-200 -200 400 400" xmlns="http://www.w3.org/2000/svg">
                    <!-- Оси -->
                        <line x1="-200" y1="0" x2="200" y2="0" stroke="black"></line> <!-- Ось X -->
                        <line x1="0" y1="200" x2="0" y2="-200" stroke="black"></line> <!-- Ось Y -->

                        <!-- Черточки на осях -->
                        <line x1="-150" y1="-5" x2="-150" y2="5" stroke="black"></line>
                        <text x="-160" y="20" font-size="20">-R</text>

                        <line x1="-75" y1="-5" x2="-75" y2="5" stroke="black"></line>
                        <text x="-85" y="20" font-size="20">-R/2</text>

                        <line x1="150" y1="-5" x2="150" y2="5" stroke="black"></line>
                        <text x="140" y="20" font-size="20">R</text>

                        <line x1="75" y1="-5" x2="75" y2="5" stroke="black"></line>
                        <text x="65" y="20" font-size="20">R/2</text>

                        <line x1="-5" y1="150" x2="5" y2="150" stroke="black"></line>
                        <text x="10" y="155" font-size="20">R</text>

                        <line x1="-5" y1="75" x2="5" y2="75" stroke="black"></line>
                        <text x="10" y="80" font-size="20">R/2</text>

                        <line x1="-5" y1="-150" x2="5" y2="-150" stroke="black"></line>
                        <text x="10" y="-140" font-size="20">-R</text>

                        <line x1="-5" y1="-75" x2="5" y2="-75" stroke="black"></line>
                        <text x="10" y="-65" font-size="20">-R/2</text>
                        <!-- Треугольник -->
                        <polygon points="0,0 0,150 -150,0" fill-opacity="0.4" stroke="navy" fill="blue"></polygon>
                        <!-- Четверть окружности -->
                        <path d="M 0 0 H 150 A 150 150 0 0 1 0 150 V 0 " fill-opacity="0.4" stroke="navy" fill="blue"></path>
                        <!-- Прямоугольник -->
                        <rect x="-150" y="-150" width="150" height="150" fill-opacity="0.4" stroke="navy" fill="blue"></rect> 1
                        <!-- Стрелки -->
                        <polygon points="200,0 190,5 190,-5" fill="black"></polygon> <!-- Стрелка на X -->
                        <polygon points="0,-200 -5,-190 5,-190" fill="black"></polygon> <!-- Стрелка на Y -->
                        <!-- Подписи осей -->
                        <text x="180" y="20" font-size="20">R</text>
                        <text x="-40" y="-180" font-size="20">R</text>
                    </svg>
                </td>
                <td class="content">
                    <h2 class="title-plate">Input Data</h2>
                    <div id="data-form">
                    <form action="controller" id="input-form" method="post">
                        <label for="x" class="data-label">X:</label>
                        <label><input type="radio" name="x-value" class="x-radio" value="-5"> -5</label>
                        <label><input type="radio" name="x-value" class="x-radio" value="-4"> -4</label>
                        <label><input type="radio" name="x-value" class="x-radio" value="-3"> -3</label>
                        <label><input type="radio" name="x-value" class="x-radio" value="-2"> -2</label>
                        <label><input type="radio" name="x-value" class="x-radio" value="-1"> -1</label>
                        <label><input type="radio" name="x-value" class="x-radio" value="0"> 0</label>
                        <label><input type="radio" name="x-value" class="x-radio" value="1"> 1</label>
                        <label><input type="radio" name="x-value" class="x-radio" value="2"> 2</label>
                        <label><input type="radio" name="x-value" class="x-radio" value="3"> 3</label>
                        <br>
                        <label for="y" class="data-label">Y:</label>
                        <input type="text" id="y-value" name="y" placeholder="Enter Y {-5;5}">
                        <br>
                        <label for="r" class="data-label">R:</label>
                        <input type="hidden" name="r" id="r-value" value="">
                        <input type="button" class="r-button" value="1">
                        <input type="button" class="r-button" value="2">
                        <input type="button" class="r-button" value="3">
                        <input type="button" class="r-button" value="4">
                        <input type="button" class="r-button" value="5">
                        <br>
                        <br>
                        <input type="submit" value="Submit" id="submit">
                        <div id="error-message"></div>
                    </form>
                </div>
                </td>
            </tr>        
            <tr>
                <td id="results" class="content" colspan="2">
                    <h2 class="title-plate">Hit Results</h2>
                    <table id="result-table">
                        <tr>
                            <th>X</th>
                            <th>Y</th>
                            <th>R</th>
                            <th>Current Time</th>
                            <th>Execution Time</th>
                            <th>Hit result</th>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <div>
            <a href="result.jsp">Return to results</a>
        </div>
        <script src="index.js"></script>
        <script src="highlight.js"></script>
    </body>
</html>