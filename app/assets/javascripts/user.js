// appending comment to page
    function commentsToPage() {
      $.ajax({
      type: 'POST',
      url: formURL,
      data: {comment: {description: description}},
      success: function(data) {
        console.log("Success with data!", data);

        // append new comment to page
        $("#comment-display").append(
          data.description);

        // reset form values
        $("#description-val").val("");
      },
      error: function(data) {
        console.log("ERROR");
      }
    }); //closing AJAX
    } //closing function commentsToPage

    commentsToPage();
  }); //closing on submit