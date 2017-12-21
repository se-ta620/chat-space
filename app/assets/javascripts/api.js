  $(function(){
    function buildHTML(message){
      var html = `<div class= contents__main__middle__message-content>
                    <div class= contents__main__middle__message-content__over>
                      <div class= contents__main__middle__message-content__over__user-name> ${message.name}</div>
                      <div class= contents__main__middle__message-content__over__post-time> ${message.created_at}</div>
                    </div>
                    <div class= contents__main__middle__message-content__under>
                      <div class= ccontents__main__middle__message-content__under__message> ${message.body} </div>`;
          html += (message.image) ?
                    (`<div class= contents__main__middle__message-content__under__image> <img src= "${message.image}"></div>`):
                  ('</div>');
                ('</div>');
      return html;
    }
    $('#new_message').on('submit', function(e){
      e.preventDefault();
      var formData = new FormData(this);
      var href = $(this).attr('action');
      $.ajax({
        url: href,
        type: "POST",
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false
      })
      .done(function(data){
        var html = buildHTML(data);
        $('.contents__main__middle').append(html);
        $('.contents__main__bottom__form__text-field').val('');
        $('.contents__main__bottom__form__picture-field-label').val('');
        $('.contents__main__middle').animate({scrollTop: $('.contents__main__middle')[0].scrollHeight}, 'slow');
      })
      .fail(function(){
        alert('error');
      });
      return false;
    });
  });