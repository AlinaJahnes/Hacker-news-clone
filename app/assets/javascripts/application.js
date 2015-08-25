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

$(document).on('ready page:load page:change',function(){
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
  $('.comment_form').on('submit',function(event){
    event.preventDefault();
    $.ajax({
      url: $('.comment_form').attr('action')
    }).done(function(response){
      $('#comment_area').append(response);
      $('.comment_form').hide();
    });
  })

  $('#comment_area').on('submit', $('#new_comment'),function(event){
    event.preventDefault();
    var $target = $(event.target);
    console.log("I'm here");
    $.ajax({
      url: $target.attr('action'),
      method: 'post',
      data: $target.serialize(),
      dataType: 'json'
    }).done(function(response){
      $('#comment_area').prepend("<p>"+response.data+"</p>");
      $('#new_comment').remove();
      $('.comment_form').show();
    });
  });

  $('#edit_link').on('click', function(event){
    event.preventDefault();
    $.ajax({
      url: $('#edit_link').attr('href')
    }).done(function(response){
      $('h3').before(response);
      $('#edit_link').toggle();
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
