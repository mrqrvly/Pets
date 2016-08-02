console.log('Sound the trumpets, JavaScript is here!!!');

var breeds = []

$.ajax({
  url:'http://api.petfinder.com/breed.list',
  type: 'GET',
  data: {
    key:    "61635e39395ce71e4d0eba82c79adb55",
    format: "json",
    animal: "reptile",  
    output: "full"
  },
  dataType: 'jsonp',
  success: function(result) {
    console.log(result);
    for (var index in result.petfinder.breeds.breed) {
      breeds.push(result.petfinder.breeds.breed[index].$t);
    }
    console.log(JSON.stringify(breeds.join()));
  }
});
