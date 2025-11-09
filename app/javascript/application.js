// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

$(document).ready(function(){
  $("#icon").click(function(){
    $("#dropdown").addClass(".doropdown_active");
  });

  $("#logout").click(function(){
      $("#dropdown").removeClass(".doropdown_active");
  })
});