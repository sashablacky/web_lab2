function validate() {
    return validateX() && validateY() && validateR();
}

function validateX() {
    const valueX = parseFloat($("#value_X").val().replace(",", "."));

    if (isNaN(valueX) || valueX <= -5.0 || valueX >= 5.0) {
        error('Некорректное значение X')
        return false;
    }
    return true;

}

function validateY() {
    return true;
}

function validateR() {
    const elementR = $('[name="value_R"]:checked')
    if (!elementR.length) {
        error('Выберите значение R')
        return false
    }
    return true;
}