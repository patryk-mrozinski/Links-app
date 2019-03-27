// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= select2.min.js
//= require bootstrap-sprockets
//= require_tree .

$( document ).ready(function() {
  $(".tags-select").select2({
    tags: true
  });
  function popupCenter(url, width, height, name) {
   var left = (screen.width/2)-(width/2);
   var top = (screen.height/2)-(height/2);
   popupValue = "on";
   return window.open(url, name, "menubar=no,toolbar=no,status=no,width="+width+",height="+height+",toolbar=no,left="+left+",top="+top     );
  }

  $(document).ready(function(){
  $("a.popup").click(function(e) {
  popupCenter($(this).attr("href"), $(this).attr("data-width"), $(this).attr("data-height"), "authPopup");
  e.stopPropagation(); return false;
  });


  if(window.opener && window.opener.popupValue === 'on') {
   delete window.opener.popupValue;
   window.opener.location.reload(true);
   window.close()
  }
  });
});
