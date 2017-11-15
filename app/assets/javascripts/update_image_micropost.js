$(t "micropost_form.mcr_picture").bind(t "micropost_form.change", function() {
  var size_in_megabytes = this.files[0].size/1024/1024;
  if (size_in_megabytes > 5) {
    alert (t "micropost_form.danger_maximum");
  }
});
