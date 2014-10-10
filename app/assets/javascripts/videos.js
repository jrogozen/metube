$(document).ready( function() {
  $('.main-search').find('input').keypress(function(e) {
    if (e.which === 13) {
      e.preventDefault();
      e.stopPropagation();

      var $q = $('.main-search').find('input').val();
      var $data = {
        q: encodeURIComponent($q)
      };

      $.post ("/videos/search", $data, function (success) {
        if (success) {

          // reset input box
          $('.main-search').find('input').val("");

          // clear old search
          $('.search-dropdown-container').empty();

          $.each(success.items, function (index, value) {
            var title = value.snippet.title,
              thumb = value.snippet.thumbnails["default"].url;

            var result = "<a href='/videos/new?youtubeid=" + value.id.videoId + "&title=" + title + "&description=" + value.snippet.description + "'><div class='search-result'><div class='thumbnail'><img src='" + thumb + "'></div><div class='title'>" + title + "</div></div></a>"

              $('.main-search').find('.search-dropdown-container').append(result);
          });

          $('.search-dropdown-container').slideDown("fast");
        }
      });
    }
  });
});

$(document).click (function (e) {
  $('.search-dropdown-container').hide();
})