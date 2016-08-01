console.log('Sound the trumpets, JavaScript is here!!!');



$.ajax({
  url:'http://api.petfinder.com/breed.list',
  type: 'GET',
  data: {
    key: "61635e39395ce71e4d0eba82c79adb55",
    format: "json",
    animal: "dog",  
    output: "full"
  },
  dataType: 'jsonp',
  success: function(result){
    console.log(result);
    (result.petfinder.breeds.breed).forEach(function(breed) {
      console.log(breed[0]);
    })
    console.log(result.petfinder.breeds.breed[0]);
  }
});


