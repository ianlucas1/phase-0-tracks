// Pseudocode for the following business logic is located in the Release 0 and Release 2 sections

// BUSINESS LOGIC FOR WORD RANDOMIZER (RELEASE 2) AND LONGEST WORD DETECTOR (RELEASE 0)

var letters = "abcdefghijklmnopqrstuvwxyz"
var rand_word = "";
var rand_word_ary = []
var rand_word_length_ary = [];

function length_of_array(integer) {
  for (var i = 0; i < integer; i++)
    rand_word_generator()
}

function rand_word_generator() {
  for (var i = 0; i < Math.floor(Math.random() * 10 + 1); i++)
    rand_word += letters.charAt(Math.floor(Math.random()*letters.length));
    new newWord(rand_word);
    rand_word = "";
}

function newWord(rand_word) {
  this.rand_word = rand_word;
  rand_word_ary.push(this.rand_word);
}

function longest_str() {  

  for (var i = 0; i < rand_word_ary.length; i++) {
  rand_word_length_ary.push(rand_word_ary[i].length)
  };

  var greatest_length = Math.max(...rand_word_length_ary);
 
  for (var i = 0; i < rand_word_ary.length; i++) {
    if (rand_word_ary[i].length == greatest_length) { 
      console.log("Longest random word: " + "'" + rand_word_ary[i] + "'"); 
    }; 
  };
};

//==========================================================================

// Release 0: Find the Longest Phrase

// write a function that takes an array of words or phrases 
// and returns the longest word or phrase in the array

// 1) create an array that will store the length of the strings inside 
// the array named str_length_ary
// 2) create a function named longest_str to call an array of strings
// 3) create a for loop inside the longest_str function
// create a counter variable inside the loop that corresponds to the
// index positions inside the array of strings
// 4) loop through each string in the array until the counter has reached 
// one less than the length of the array
// 5) in each iteration, push the number corresponding to the length of each 
// string into the array that stores the string lengths
// 6) use the JavaScript Math object to find the highest number in str_length_ary
// 7) create a second loop in the longest_str function with the same counter 
// and termination condition as the prior loop
// 8) inside the loop, iteratively compare the length of each string in the array 
// to the length of the longest string identified in the first loop
// 9) if the length of the string equals the longest string's length, return that 
// string (otherwise, don't return it)
// 10) close the longest_str function
// 11) call the longest_str function

// var str_ary = ["White", "Black", "Tawny", "Palomino"];
// var str_ary = ["Sir Barton", "Gallant Fox", "War Admiral", "American Pharaoh"]
// var str_ary = ["i", "went", "back", "in"];
// var str_length_ary = [];

// function longest_str() {  

//   for (var i = 0; i < str_ary.length; i++) {
//   str_length_ary.push(str_ary[i].length)
//   };

//   var greatest_length = Math.max(...str_length_ary);
 
//   for (var i = 0; i < str_ary.length; i++) {
//     if (str_ary[i].length == greatest_length) { 
//       console.log(str_ary[i]); 
//     }; 
//   };
// };

// longest_str();

//==========================================================================

// Release 1: Find a Key-Value Match

var dog = {name: 'King', age: 2, isPlottingAssassination: false};
var cat = {name: 'Queen', age: 2, isPlottingAssassination: true};
var true_false_array = []

function perfectMatch() {
  
  Object.keys(dog && cat).forEach(function (i) {
    
    if (dog[i] == cat[i]) {
      true_false_array.push(true);
    } else {
      true_false_array.push(false);
    };
  });
};

perfectMatch();
console.log("Evaluation of key-value match between two objects: " + true_false_array.includes(true) + "!" + "\n");

//==========================================================================

// Release 2: Generate Random Test Data

// Function ('length_of_array') that takes input for how many elements 
// to put into an array ('rand_word_ary')
// input_1: a whole number specified by a user
// step_1: calls a random word generator integer number of times
// output_1: no explicit output; it simply calls a random word generator

// Function ('rand_word_generator') to create randomized words of varying 
// length and letters
// input_1: a call to run from the 'length_of_array' function
// input_2: a random length for the word, generated internally
// input_3: a set of letters to draw from (the 'letters' variable)
// input_4: a blank random word string variable ('rand_word') to which  
//          randomly drawn letters can be added
// step_1: randomly assign a word length; 
// step_2: randomly draw from letters variable; 
// step_3: call a newWord constructor function that takes the word that has 
//         just been created and pushes it into the array that will store 
//         all the randomized words; 
// step_4: reset the random word string variable ('rand_word') back to being  
//         blank so the next word to be created can start fresh
// output_1: the randomized word ('rand_word') that is sent to the newWord 
//           constructor in step 3
// output_2: a blank rand_word string from step 4

// Constructor function that takes the word that has just been created 
// and pushes it into the array that will store all the randomized 
// words ('rand_word_ary'); 
// input_1: a randomized word from rand_word_generator
// step_1: push the newWord instance into rand_word_ary
// output_1: individual newWord instances that are placed into the 
// rand_word_ary, the number of which was set in length_of_array
  
//==========================================================================

// DRIVER CODE FOR WORD RANDOMIZER AND LONGEST WORD DETECTOR

length_of_array(5) // enter an integer for the number of randomized words you want to create
console.log("Array of random words: " + "[" + rand_word_ary + "]" + "\n")
longest_str();

