$(document).ready(function() {

  $('#comment_content').keypress(function(e) {
    if (e.which === 13) {
      e.preventDefault();

      
      var $content = $('.new-comment-container').find('textarea').val();
      var $videoId = $('.new-comment-container').find('.post-comment').data("video-id");
      var $userId = $('.new-comment-container').find('.post-comment').data("user-id");
      
      var $data = {
        comment: {
          content: $content,
          video_id: $videoId,
          user_id:  $userId,
          avatar: ""
        }
      };

      // ajax request
      $.post ("/videos/" + $videoId + "/comments", $data, function ( success ) {
        if (success) {
          console.log(success);

          var $comment = "<li><div class='user-icon'><img src='" + success.avatar_url + "'></div><div class='comment-info'><p class='comment-user'><a href='/users/" + success.user_id + "'>" + success.username + "</a></p><p class='comment-content'>" + success.content + "</p></div></li>";
          $('.comments-list').append($comment);

        }
      });

      $(this).val('');
    };
  });
});