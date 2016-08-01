
$.ajax({
    url:'http://api.petfinder.com/pet.getRandom',
    type: 'GET',
    data: {
      key: "61635e39395ce71e4d0eba82c79adb55",
      format: "json",
      animal: cat,  
      output: "full"
    },
    dataType: 'jsonp',
    success: function(result){
      console.log(result);
    }

  });
