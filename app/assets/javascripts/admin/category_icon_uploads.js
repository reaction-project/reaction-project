$(document).on("turbolinks:load", function() {

  $('[type=file][name="category[icon]"]').fileupload({
    add: function(e, data) {
      data.progressBar = $('<div class="upload-progress"><div class="upload-progress__text"></div><div class="upload-progress__bar"></div></div>').insertAfter("body");
      var options      = {
        extension: data.files[0].name.match(/(\.\w+)?$/)[0], // set the file extension
        _: Date.now() // prevent caching
      };

      $.getJSON("/category_icons/cache/presign", options, function(result) {
        data.formData  = result.fields;
        data.url       = result.url;
        data.paramName = "file";
        data.submit();
      });
    },

    progress: function(e, data) {
      var progress   = parseInt(data.loaded / data.total * 100, 10);
      var percentage = progress.toString() + '%';
      var percentage_text = $('<div class="upload-progress__text">' + percentage + '</div>');
      data.progressBar.find(".upload-progress__bar").css("width", percentage).html(percentage_text);
    },

    done: function(e, data) {
      data.progressBar.remove();

      var image = {
        id:       data.formData.key.match(/cache\/(.+)/)[1], // we have to remove the prefix part
        storage:  'cache',
        metadata: {
          size:      data.files[0].size,
          filename:  data.files[0].name.match(/[^\/\\]+$/)[0], // IE return full path
          mime_type: data.files[0].type
        }
      };

      $('input[type="hidden"][name="category[icon]"]').val(JSON.stringify(image));
    }
  });
});
