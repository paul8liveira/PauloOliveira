$(function () {

    $('#contact-form').validator();

    $('#contact-form').on('submit', function (e) {
        if (!e.isDefaultPrevented()) {
            var url = '/contacts';

            // get values from FORM
            var name = $("input#contact_name").val();
            var email = $("input#contact_email").val();
            var phone = $("input#contact_phone").val();
            var message = $("textarea#contact_message").val();    

            $("#contact-form :input").prop("disabled", true);
            
            $.ajax({
                type: 'POST',
                dataType: 'json',
                url: url,
                data: {
                    contact: {
                        name: name,
                        phone: phone,
                        email: email,
                        message: message                        
                    }
                },
                success: function (data)
                {
                    var messageAlert = 'alert-' + data.type;
                    var messageText = data.message;

                    var alertBox = '<div class="alert ' + messageAlert + ' alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>' + messageText + '</div>';
                    if (messageAlert && messageText) {
                        $('#contact-form').find('.messages').html(alertBox);
                        $('#contact-form')[0].reset();
                        $("#contact-form :input").prop("disabled", false);
                    }
                },
                error: function() {
                    var messageText = 'Ops...Houve algum erro ao enviar seu contato. Tome um café e tente mais tarde :)';
                    var alertBox = '<div class="alert alert-danger alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>' + messageText + '</div>';
                    $('#contact-form').find('.messages').html(alertBox);
                    $('#contact-form')[0].reset();
                    $("#contact-form :input").prop("disabled", false);
                },
            });            
            return false;
        }
    })
});
