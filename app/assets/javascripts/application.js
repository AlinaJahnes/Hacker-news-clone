// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).on('ready page:load',function(){
  $('.vote_count').on('submit',function(event){
    event.preventDefault();
    $form_data = $(event.target);
    $.ajax({
      url: $form_data.attr('action'),
      method: 'post',
      data: $form_data.serialize(),
      dataType: 'json'
    }).done(function(response){
      if (response.status === true) {
        $('#count' + response.id).text('Votes: ' + response.count);
      } else if (response.status === false) {
        $('#notice').text('').append('<div>'+response.notice+'</div>')
      }
    }).fail(function(error){
      console.log(error)
    });
  });

  $('#new_comment').on('submit',function(event){
    event.preventDefault();
    var $target = $(event.target);
    $.ajax({
      url: $target.attr('action'),
      method: 'post',
      data: $target.serialize()
    }).done(function(response){
      console.log(response)
      $('#comment_area').prepend(response);
      $('#comment_content').val('')
    });
  });

  $('#edit_link').on('click', function(event){
    event.preventDefault();
    $.ajax({
      url: $('#edit_link').attr('href')
    }).done(function(response){
      console.log(response)
      $('#article_edit_container').append(response);
      $('#edit_link').toggle();
      $('#article_container').toggle();
    });
  });

  // $('body').on('submit', $('.edit_article'), function(event){
  //   event.preventDefault();
  //   $target = $(event.target)
  //   $.ajax({
  //     url: $target.attr('action'),
  //     method: $target.method,
  //     data: $target.serialize()
  //   }).done(function(response){
  //     console.log(response);
  //   })
  // })

})
