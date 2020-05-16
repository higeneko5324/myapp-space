$(function(){
  function buildHTML(post){  
    var html = `<div class="main-list">
                  <div class="main-list__text">
                    text : ${post.text} 
                  </div>
                  <div class="main-list__content">
                    content : ${post.content}
                  </div>
                  <div class="main-list__day">
                    ${post.created_at}
                  </div>
                </div>`
    return html;
  }
  $('#new_post').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    
    // attrでactionで定義されている値を返す
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
     
    .done(function(post){
      var html = buildHTML(post);
      $('.main__lists').prepend(html);
      $('.main').animate({ scrollTop: 5});
      $('.form__title').val('');
      $('.form__text').val('');
      $('.form__btn').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
})

// ボタンフォーム
// $(function(){
// $("#close ,.overlay").on('click', function(){
//   $(".contact ,.overlay").addClass("hidden");
// })

// $(".btn").on('click', function(){
//   $(".contact ,.overlay").removeClass("hidden");
// })
// })



// カレンダーフォーム
// $(document).ready(function(){
//   $('#calendar').fullCalendar({

    
//     header:{
//       left: 'prev, next, today',
//       center: 'title',
//       right: 'month, agendaWeek, agendaDay, listMonth',
//     },
//     selectable: true,
//     selectHelper: true,
//     select: function(start, end) {
//     var title = prompt("予定タイトル:");
//     var eventData;
//     if (title) {
//             eventData = {
//                     title: title,
//                     start: start,
//                     end: end
//             };
//             $('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
//     }
//     $('#calendar').fullCalendar('unselect');
//     },
//     editable: true,
//     eventLimit: true, 
   






//   })
  
// });