$('#submit_button').on('click', () => {
    if (!validate()) {
        return
    }
    requestData({
        clicked: false,
        x: $('#value_X').val().replace(',', '.'),
        y: $('#value_Y').val(),
        r: $("label[for='" + $('[name="value_R"]:checked').attr('id') + "']").html()
    })
})

function error(message) {
    Swal.fire({
        icon: 'error',
        title: 'Ошибка',
        text: message,
        heightAuto: false
    })
}


