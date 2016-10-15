// jQuery for page scrolling feature
$('.nav').click(function() {
  var id = $(this).attr('id');
  $('html, body').animate({
      scrollTop: ($('#' + id + '.section').offset().top)
  }, 1000);
});



$('#create-').click(function() {
  var user = $('#user-id').val()
  var title = $('#task-title').val()
  var status = $('#status').val()
  var priority = $('#priority').val()



  var closeButton = $('#close');
  var createCat = $('#add');

  // Function To Display Popup
  function divShow() {
    $('#form').show();
  }
  // Open up Popup
  createCat.click(function() {
    divShow();
  });
  // Function to Hide Popup
  function divHide(){
  // document.getElementById('form').style.display = "none";
    $('#form').hide();
  }
  // Close out of Popup
  closeButton.click(function() {
    divHide();
  });










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
