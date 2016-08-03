//  SEARCH THE PETFINDER.COM API FOR PET INFO
//  =========================================


//  Variables for API request are imported from
//  the request.erb view (animal, breed, zip)
//  -------------------------------------------
$.ajax({
  url:'http://api.petfinder.com/pet.find',
  type: 'GET',
  data: {
    key:    "61635e39395ce71e4d0eba82c79adb55",
    format:   "json",
    animal:   animal,
    breed:    breed,
    location: zip,
    count:    50,
    output:   "full"
  },
  dataType: 'jsonp',
  success: function(result) {
    console.log(result);
    // for (var index in result.petfinder.breeds.breed) {
    //   breeds.push(result.petfinder.breeds.breed[index].$t);
    // }
    // console.log(JSON.stringify(breeds.join()));
  },
  error: function(err){
    console.log(err);
  }
});
