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

// JS should go in controller-specific files ie 'votes.js'
$(document).on('ready',function(){
  $('.like_count').on('submit',function(event){
    event.preventDefault();
    $form_data = $(event.target);
		console.log($(this).children());
    $.ajax({
      url: $form_data.attr('action'),
      method: 'post',
      data: $form_data.serialize(),
      dataType: 'json'
    }).done(function(response){
      $("#count" + response.id).text("Votes: " + response.number);
    }).fail(function(error){
      console.log(error)
    });
  });
  // I would expect to see a click event here since you're not posting/submitting any data.
  // $('.comment_form').on('submit',function(event){
  //   event.preventDefault();
  //   $.ajax({
  //     url: $('.comment_form').attr('action')
  //   }).done(function(response){
  //     console.log(response);
      // $('#comment_area').append(response);
      // $('.comment_form').hide();
  //   });
  // })
  $('.add-comment').on('click', function(event){
    event.preventDefault();
    console.log($(event.target).attr('href'))
    $.ajax({
      url: $(event.target).attr('href')
    }).done(function(response){
      console.log("yay: ", response)
      $('#comment_area').append(response);
      $('.comment_form').hide();
    }).fail(function(response){
      console.log("failed: ", response)
    })

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
      console.log(response.data)
      $('#comment_area').prepend("<p>"+response.data+"</p>");
      $('#new_comment').remove();
      $('.comment_form').show();
    });
  });
})
