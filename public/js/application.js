  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()


  // $(".form_comment").submit(function(event){
  //   event.preventDefault()
  //   alert(this)
  //   $ajax({
  //     method: 'post',
  //     url: '/comments',
  //     data: $(this).serialize()
  //   }).done(function(response){
  //     alert(response)
  //   })
  // })

function hideTabContent() {
  $("#profile").hide();
  $("#activity").hide();
};

function setInactiveTab() {
  $('li').removeClass('active');
  $(event.target.parentNode).addClass("active");
};

$(document).ready(function() {
  hideTabContent();
  $(".comment-form-question").hide();
  $(".comment-form-answer").hide();

  $(".answer-form").hide();
  $('.tabs').click(function(event) {
      setInactiveTab();
    if (event.target.innerHTML == "Profile") {
        $("#profile").show();
     } else if (event.target.innerHTML == "Activity") {
       $("#activity").show();
     } else {
       event.preventDefault();
     }
  });


  $(".answers_List").on('click', ".comment_answer_link", function(event){
        event.preventDefault();
        var answerRoute = $(this).attr('href');
        var reg = /\d/;
        var answer_id = reg.exec(answerRoute);
        var new_action = '/answers/' + answer_id[0] + '/comments';
        $(".comment-form-answer")[0].childNodes[2].action = new_action;
        $(".comment-form-answer").toggle()
        $(".form_comment_answer")[0].reset();
  })

  $('.question-comment').on('click', '#add-comment', function(event) {
    event.preventDefault();
    $(".form_comment_question")[0].reset()
    $(".comment-form-question").toggle()
  });

    $(".comment-form-answer").on('click', 'button', function(event) {
      event.preventDefault();
      var comment = $('.form_comment_answer').find('textarea').serialize();
      var route = $('.form_comment_answer').attr('action');
      var reg = /\d/;
      var answer_id = reg.exec(route)[0];
      var ul_id = '#answer_comments_' + answer_id;
      $.ajax({
        url: route,
        method: 'post',
        data: comment
      }).done(function(response) {
        $('.answers_List').find(ul_id).append(response)
        $(".comment-form-answer").toggle()
        $(".form_comment_answer")[0].reset()
      }).fail(function(jqXHR, textStatus, errorThrown) {
        $('.answers_List').prepend("<span>" + errorThrown + "</span>");
      });
    });

  $(".comment-form-question").on('click', 'button', function(event) {
    event.preventDefault();
    console.log(this);
    var comment = $('.form_comment_question').find('textarea').serialize();
    var route = $('.form_comment_question').attr('action');
    $.ajax({
      url: route,
      method: 'post',
      data: comment
    }).done(function(response) {
      $('.question-comment').find('ul').append(response)
      $(".comment-form-question").toggle()
    }).fail(function(jqXHR, textStatus, errorThrown) {
      $('.question-comment').prepend("<span>" + errorThrown + "</span>");
    });
  });

  $('.question-answer').on('click', '#answer', function(event) {
    event.preventDefault();
    $(".answer-form").toggle()
  });
  $('.answer-form').on('click', 'button', function(event) {
    event.preventDefault();
    var route = $('.form_answer').attr('action');
    var answer = $('.form_answer').find('textarea').serialize();
    $.ajax({
      url: route,
      method: 'post',
      data: answer
    }).done(function(response) {
      $('.question-answer').find(".answers_List").append(response);
    })
})
})

// });
