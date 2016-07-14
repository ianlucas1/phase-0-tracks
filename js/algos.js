// Release 0: Find the Longest Phrase

// write a function that takes an array of words or phrases 
// and returns the longest word or phrase in the array

// create an array that will store the length of the strings inside the array named str_length_ary
// create a function named longest_str to call an array of strings
// create a for loop inside the longest_str function
// create a counter variable inside the loop that corresponds to the index positions inside the array of strings
// loop through each string in the array until the counter has reached one less than the length of the array
// in each iteration, push the number corresponding to the length of each string into the array that stores the string lengths
// use the JavaScript Math object to find the highest number in str_length_ary
// create a second loop in the longest_str function with the same counter and termination condition as the prior loop
// inside the loop, iteratively compare the length of each string in the array to the length of the longest string identified in the first loop
// if the length of the string equals the longest string's length, return that string (otherwise, don't return it)
// close the longest_str function
// call the longest_str function

// Driver code to test how the algorithm works when there are
// blank spaces in the strings or when multiple strings have the longest length
var str_ary = ["White", "Black", "Tawny", "Palomino"];
// var str_ary = ["Sir Barton", "Gallant Fox", "War Admiral", "American Pharaoh"]
// var str_ary = ["i", "went", "back", "in"];
var str_length_ary = [];

function longest_str() {  

  for (var i = 0; i < str_ary.length; i++) {
  str_length_ary.push(str_ary[i].length)
  };

  var max = Math.max(...str_length_ary);
 
  for (var i = 0; i < str_ary.length; i++) {
    if (str_ary[i].length == max) { 
      console.log(str_ary[i]); 
    }; 
  };
};

// longest_str();

//====================================

// Release 1: Find a Key-Value Match

var dog = {name: 'King', age: 2, isPlottingAssassination: false};
var cat = {name: 'Queen', age: 2, isPlottingAssassination: true};
    
function perfectMatch() {
  
  Object.keys(dog && cat).forEach(function (i) {
    
    if (dog[i] == cat[i]) {
      console.log(true);
    } else { 
      console.log(false);
    };
  });
};

perfectMatch();

//====================================

// Release 2: Generate Random Test Data
  
var letters = "abcdefghijklmnopqrstuvwxyz"
var rand_word = "";
var rand_word_ary = []

  // Constructor that pushes newly generated random word into the random word array
  function Word(rand_word) {
    this.rand_word = rand_word;
    rand_word_ary.push(this.rand_word);
  }

  // Generates a word with a length of 1 to 10 random letters
  // Creates a new Word instance
  // Resets the rand_word variable to "" to create a blank slate for the next random word
  function rand_word_generator() {
    for (var i = 0; i < Math.floor(Math.random() * 10 + 1); i++)
      rand_word += letters.charAt(Math.floor(Math.random()*letters.length));
      new Word(rand_word);
      rand_word = "";
  }

  // Accepts input for how many strings to put into an array and calls the random word generator that many times
    function length_of_array(integer) {
    for (var i = 0; i < integer; i++)
      rand_word_generator()
  }

  // this call of the length_of_array function initiates the whole process
  length_of_array(5)
  console.log(rand_word_ary)





