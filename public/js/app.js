// jQuery for page scrolling feature
$('.nav').click(function() {
  var id = $(this).attr('id');
  $('html, body').animate({
      scrollTop: ($('#' + id + '.section').offset().top)
  }, 1000);
});



$('#create').click(function() {
  var user = $('#user-id').val()
  var title = $('#task-title').val()
  var status = $('#status').val()
  var priority = $('#priority').val()

var $catName = $('.catName')

function createCats () {
  return $.ajax({
      method: 'POST',
      url: '/api/cat',
      dataType: 'json'
      data: {
        name: $catName.val();
        gender: $taskGender.val();
        species: $taskSpecies.val();
        attitude: $taskAttitude.val()
      },

    });
}

module.exports = createCats

// click on paw hide main site stuff show that cat
