<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="results"
             scope="session"
             class="ru.alex.entity.ResultsListBean"/>
<!DOCTYPE html>
<html  lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Web | Lab #2</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Caveat&display=swap" rel="stylesheet">
    <meta name="theme-color" content="#3399ff">
    <link href="images/favicon.ico" rel="icon">
    <link rel="stylesheet/less" type="text/css" href="css/styles.less"/>
    <script src="https://cdn.jsdelivr.net/npm/less"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<div class="header">
    <h2>

        Черныш Александр Владимирович
        <br><br>
        Вариант: 3212

    </h2>
</div>
<div class="fields">
    <form id="main_form">

        <div class="input">
            <label for="value_X">Введите значение X</label>
            <br>
            <input id="value_X" type="text" maxlength="5"
                   placeholder="Введите число в диапазоне (-5;5)" size="30">
            <br>
        </div>
        <div class="input">
            <label for="value_Y">Выберите значение Y</label>
            <br>
            <select id="value_Y" form="main_form">
                <option>-2</option>
                <option>-1.5</option>
                <option>-1</option>
                <option>-0.5</option>
                <option>0</option>
                <option>0.5</option>
                <option>1</option>
                <option>1.5</option>
                <option>2</option>
            </select>
            <br>
        </div>

        <div class="input">
            <label>Выберите значение R</label>
            <br>
            <input id="first_value_R" name="value_R" type="radio">
            <label class="radio-label" for="first_value_R">1</label>
            <input id="second_value_R" name="value_R" type="radio">
            <label class="radio-label" for="second_value_R">2</label>
            <input id="third_value_R" name="value_R" type="radio">
            <label class="radio-label" for="third_value_R">3</label>
            <input id="fourth_value_R" name="value_R" type="radio">
            <label class="radio-label" for="fourth_value_R">4</label>
            <input id="fifth_value_R" name="value_R" type="radio">
            <label class="radio-label" for="fifth_value_R">5</label>
            <br>
        </div>
        <div class="form-buttons">

            <input id="submit_button" type="button" value="Отправить">
            <input type="reset" value="Очистить">
            <%--<br>
            <input id="reset_table_button" type="button" value="Очистить таблицу">--%>
        </div>
    </form>
</div>
<div class="plot">
    <svg height="300" width="300">
        <rect class="plot_part" x="100" y="50" height="100" width="50"></rect>
        <path class="plot_part" d="M150 150 L 200 150 C 200 150 200 200 150 200 L Z"></path>
        <polygon class="plot_part" points="50,150 150,150 150,250"></polygon>
        <line stroke="black" x1="0" x2="300" y1="150" y2="150"></line>
        <line stroke="black" x1="150" x2="150" y1="0" y2="300"></line>
        <polygon fill="black" points="150,0 144,15 155,15"></polygon>
        <polygon fill="black" points="300,150 285,156 285,144"></polygon>

        <line stroke="black" x1="200" x2="200" y1="155" y2="145"></line>
        <line stroke="black" x1="250" x2="250" y1="155" y2="145"></line>

        <line stroke="black" x1="50" x2="50" y1="155" y2="145"></line>
        <line stroke="black" x1="100" x2="100" y1="155" y2="145"></line>

        <line stroke="black" x1="145" x2="155" y1="100" y2="100"></line>
        <line stroke="black" x1="145" x2="155" y1="50" y2="50"></line>

        <line stroke="black" x1="145" x2="155" y1="200" y2="200"></line>
        <line stroke="black" x1="145" x2="155" y1="250" y2="250"></line>

        <text fill="black" x="190" y="140">½R</text>
        <text fill="black" x="245" y="140">R</text>

        <text fill="black" x="40" y="140">-R</text>
        <text fill="black" x="85" y="140">-½R</text>

        <text fill="black" x="160" y="105">½R</text>
        <text fill="black" x="160" y="55">R</text>

        <text fill="black" x="160" y="205">-½R</text>
        <text fill="black" x="160" y="255">-R</text>

        <text fill="black" x="160" y="10">Y</text>
        <text fill="black" x="290" y="140">X</text>

        <circle fill="black" cx="150" cy="150" r="2"></circle>
        <svg id="dots" height="300" width="300"></svg>
    </svg>
</div>
<div class="result_table">
    <table>
        <thead>
        <tr>
            <th>Номер</th>
            <th>Значение X</th>
            <th>Значение Y</th>
            <th>Значение R</th>
            <th>Попадание</th>
            <th>Тип получения</th>
            <th>Время нажатия</th>
            <th>Время выполнения, мкс</th>
        </tr>
        </thead>
        <tbody id="output">
        <%= results %>
        </tbody>
    </table>
</div>
<div class="footer">
    <div class="social">
        <a href="https://se.ifmo.ru/web" target="_blank"><img src="images/tsopa.jpg" alt="WEB"></a>
        <a href="https://vk.com/pussycreator" target="_blank"><img src="images/vk.png" alt="VK"></a>
        <a href="https://t.me/PUSSYCREATOR" target="_blank"><img src="images/telegram.png" alt="Telegram"></a>
    </div>
    <br>
    © 2022 PUSSYCREATOR. All rights reserved.
    <br>
    <script>$(document).ready(function() {
        $(".main_form").keydown(function(event){
            if(event.keyCode == 13) {
                event.preventDefault();
                return false;
            }
        });
    });</script>
<script src="js/main.js"></script>
<script src="js/plot.js"></script>
<script src="js/requester.js"></script>
<script src="js/validator.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>
</html>

