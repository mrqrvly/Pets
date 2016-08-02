$("#animal-select").change(function() {
  
  var $dropdown = $(this);

  $.getJSON("/json/breeds.json", function(data) {

    var key  = $dropdown.val();
    var vals = [];

    switch(key) {
      case "dog":
        vals = data.dogs.split(",");
        break;
      case "cat":
        vals = data.cats.split(",");
        break;
      case "rabbit":
        vals = data.rabbits.split(",");
        break;
      case "smallfurry":
        vals = data.small.split(",");
        break;
      case "horse":
        vals = data.horses.split(",");
        break;
      case "bird":
        vals = data.birds.split(",");
        break;
      case "reptile":
        vals = data.other.split(",");
        break;
      case "pig":
        vals = data.pigs.split(",");
        break;
      case "barnyard":
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
