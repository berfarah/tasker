// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .

console.log('hi');

var data_conditional = function () {
  return $('[data-conditional]').map(function (i, element) {
    var condition = element.getAttribute('data-conditional').split(':'),
        name = '[id*=' + condition.slice(-1)[0] + ']',
        checked = $(name)[0].checked;

    if (condition.length > 1 && condition[0] == "not") checked = !checked;

    if (checked) { $(element).addClass('visible'); } else { $(element).removeClass('visible'); }
    return name;
  });
};

$(document).ready(function () {
  data_conditional().each(function (i, element) {
    $(element).change(data_conditional);
  });
});
