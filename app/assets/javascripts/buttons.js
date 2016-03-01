$(document).ready(function(){
  buttonListeners();
})

function buttonListeners(){
  $('.read').each(function(index, button){
    $(button).on('click', function(){
      changeStatus($(this).parent(), 'true');
    });
  });

  $('.unread').each(function(index, button){
    $(button).on('click', function(){
      changeStatus($(this).parent(), 'false');
    })
  });

  $('.edit').each(function(index, button){
    $(button).on('click', function(){
      editTitle($(this).parent(), "ok");
    })
  });
}

function changeStatus(link, status) {
  if(link.attr('boolean-status') != status){
    var data = {link: {
      read: status
    }}
    $.ajax({
        url: "api/v1/links/" + link.attr('data-id'),
        method: "PUT",
        data: data,
        success: function(){
          $(link).attr('boolean-status', status);
          $(link).find('.read-status').text('Read? ' + status);
        },
        error: function(response){
          console.log(response, "update failed")
        }
    });
  }
}

function editTitle(link, content){
  // $(".edit").click(function() {
  //   var data = {link: {
  //     edit: content
  //   }}
  //   $(link.title).replaceWith(content);

    $(".edit").click(function() {
    var input = $("<input>", { val: $(this).text(),
                               type: "text" });
    $(this).replaceWith(input);
    input.select();


  $.ajax({
      url: "api/v1/links/" + link.attr('data-id'),
      method: "PUT",
      data: data,
      success: function(){
        $(link).find('data-id').text('Url ' + content);
      },
      error: function(response){
        console.log(response, "edit title failed")
      }
    });
  });
}
