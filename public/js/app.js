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
