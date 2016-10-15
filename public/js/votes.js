$(document).ready(function() {


$("#down_question_count").click(function(event){
  event.preventDefault();
  var questionRoute = $(this).attr('href');
  var reg = /\d+/;
  var answer_id = reg.exec(questionRoute);
  param = { id: answer_id[0] }
  $.ajax({
    url: questionRoute,
    method: 'post',
    data: param
  }).done(function(response) {
    $('#total_question_votes').html(response);
  })

})

$("#up_question_count").click(function(event){
  event.preventDefault();
  var questionRoute = $(this).attr('href');
  var reg = /\d+/;
  var answer_id = reg.exec(questionRoute);
  param = { id: answer_id[0] }
  $.ajax({
    url: questionRoute,
    method: 'post',
    data: param
  }).done(function(response) {
    $('#total_question_votes').html(response);
  })

})

$('.question-comment').on('click', '.down_comment_question_count', function(event) {
  event.preventDefault();
  var votes = $(this).parent().find('span')
  var route = $(this).attr('href');
  var reg = /(\d+)\S*(\d+)/
  var question_id = reg.exec(route)[1];
  var comment_id = reg.exec(route)[2];
  params = {question_id: question_id, comment_id: comment_id}

  $.ajax({
    url: route,
    method: 'post',
    data: params
  }).done(function(response){
    $(votes).html(response)
  })
});


$('.question-comment').on('click', '.up_comment_question_count', function(event) {
  event.preventDefault();
  var votes = $(this).parent().find('span')
  var route = $(this).attr('href');
  var reg = /(\d+)\S*(\d+)/
  var question_id = reg.exec(route)[1];
  var comment_id = reg.exec(route)[2];
  params = {question_id: question_id, comment_id: comment_id}

  $.ajax({
    url: route,
    method: 'post',
    data: params
  }).done(function(response){
    $(votes).html(response)
  })
});


$('.answers_List').on('click', '.down_answer_count', function(event) {
  event.preventDefault();
  var votes = $(this).parent().find('span')
  var route = $(this).attr('href');
  var reg = /(\d+)\S*(\d+)/
  var question_id = reg.exec(route)[1];
  var answer_id = reg.exec(route)[2];
  params = {question_id: question_id, answer_id: answer_id}

  $.ajax({
    url: route,
    method: 'post',
    data: params
  }).done(function(response){
    $(votes).html(response)
  })
});


$('.answers_List').on('click', '.up_answer_count', function(event) {
  event.preventDefault();
  var votes = $(this).parent().find('span')
  var route = $(this).attr('href');
  var reg = /(\d+)\S*(\d+)/
  var question_id = reg.exec(route)[1];
  var answer_id = reg.exec(route)[2];
  params = {question_id: question_id, answer_id: answer_id}

  $.ajax({
    url: route,
    method: 'post',
    data: params
  }).done(function(response){
    $(votes).html(response)
  })
});


$('.answers_List').on('click', '.answer_comments .down_answer_comment_count', function(event) {
  event.preventDefault();
  var votes = $(this).parent().find('span')
  var route = $(this).attr('href');
  var reg = /(\d+)\S*(\d+)\S*(\d+)/
  var comment_id = reg.exec(route)[3];
  params = {comment_id: comment_id}

  $.ajax({
    url: route,
    method: 'post',
    data: params
  }).done(function(response){
    $(votes).html(response)
  })
});


$('.answers_List').on('click', '.answer_comments .up_answer_comment_count', function(event) {
  event.preventDefault();
  var votes = $(this).parent().find('span')
  var route = $(this).attr('href');
  var reg = /(\d+)\S*(\d+)\S*(\d+)/
  var comment_id = reg.exec(route)[3];
  params = {comment_id: comment_id}

  $.ajax({
    url: route,
    method: 'post',
    data: params
  }).done(function(response){
    $(votes).html(response)
  })
});




})
