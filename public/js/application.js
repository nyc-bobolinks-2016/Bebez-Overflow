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
  $(".comment-form").hide();
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

  $('.question-comment').on('click', 'a', function(event) {
    event.preventDefault();
    $(".comment-form").show();
  });

  $('.question-answer').on('click', 'a', function(event) {
    event.preventDefault();
    $(".answer-form").show();
  });

  $('.answer-form').on('click', 'button', function(event) {
    event.preventDefault();
})
})

// });
