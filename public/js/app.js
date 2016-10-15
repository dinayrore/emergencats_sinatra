// Display Individual Cat by name
$('#rufus-beans').click(function () {
  var cat = 'rufus'
  displayCat(cat)
})

function displayCat (cat) {
  var catName = $('name')
  var catGender = $('gender')
  var catSpecies = $('species')
  var catAttitude = $('attitude')
  $.ajax({
    method: 'GET',
    url: '/api/cats',
    dataType: 'json',
    data: {
      name: catName,
      gender: catGender,
      species: catSpecies,
      attitude: catAttitude
    }
  })
}

//
// $('#create').click(function() {
//
//
// var $catName = $('.catName')
//
// function createCats () {
//   return $.ajax({
//       method: 'POST',
//       url: '/api/cat',
//       dataType: 'json'
//       data: {
//         name: $catName.val();
//         gender: $taskGender.val();
//         species: $taskSpecies.val();
//         attitude: $taskAttitude.val()
//       },
//
//     });
// }

module.exports = createCats
