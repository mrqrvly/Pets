//  Controls population of second select element on users
//  profile page, dependent on input of first slect element
//  =======================================================

//  Grab the first select element and watch for change
//  --------------------------------------------------
$("#animal-select").change(function() {
  console.log("Got the js file.")
  var $dropdown = $(this);
  console.log(this);

  //  Get the JSON file holding info that will populate second select element
  //  -----------------------------------------------------------------------
  $.getJSON("/json/breeds.json", function(data) {
    console.log(data, 'huhghjjhgghjjhg');
    var key  = $dropdown.val();
    var vals = [];
    
    //  Selector for which data set will populate second select element
    //  ---------------------------------------------------------------
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
      default:
        vals = ["Select a breed"];
        break;
    }

    //  Grab the second select element, empty it, populate with each option from JSON data
    //  ----------------------------------------------------------------------------------
    var $breedSelect = $("#breed-select");
    $breedSelect.empty();

    $.each(vals, function(index, value) {
      $breedSelect.append("<option>" + value + "</option>");
    });

  });

});
