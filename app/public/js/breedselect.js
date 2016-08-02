$("#animal-select").change(function() {
  
  var $dropdown = $(this);

  $.getJSON("/json/breeds.json", function(data) {

    var key  = $dropdown.val();
    var vals = [];

    switch(key) {
      case "Dogs":
        vals = data.dogs.split(",");
        break;
      case "Cats":
        vals = data.cats.split(",");
        break;
      case "Rabbits":
        vals = data.rabbits.split(",");
        break;
      case "Small Creatures":
        vals = data.small.split(",");
        break;
      case "Horses":
        vals = data.horses.split(",");
        break;
      case "Birds":
        vals = data.birds.split(",");
        break;
      case "Fish, Reptiles & Amphibians":
        vals = data.other.split(",");
        break;
      case "Pigs":
        vals = data.pigs.split(",");
        break;
      case "Barnyard":
        vals = data.barnyard.split(",");
        break;
      // case "base":
      //   vals = ["Please select an animal type"];
      //   break;
      default:
        vals = ["Select a breed"];
    }

    var $breedSelect = $("#breed-select");
    $breedSelect.empty();
    $.each(vals, function(index, value) {
      $breedSelect.append("<option>" + value + "</option>");
    });

  });

});
