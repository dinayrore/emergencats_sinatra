// var cat = new DatabaseCats();

// Display Individual Cat by name
$('#rufus-beans').click(function () {
  displayCat()
})

function displayCat () {
  $.ajax({
    method: 'GET',
    url: '/api/cats?name=Rufus',
    dataType: 'json',
    data: {}
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

// module.exports = createCats
