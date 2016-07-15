// BUSINESS LOGIC FOR RELEASE 0: FIND THE LONGEST PHRASE

var str_ary = ["Sir Barton", "Gallant Fox", "War Admiral", "American Pharaoh"];
var str_length_ary = [];

function longest_string() {  
  
  for (var i = 0; i < str_ary.length; i++) {
    str_length_ary.push(str_ary[i].length)
  }
  
  var greatest_length = Math.max(...str_length_ary);
  
  for (var i = 0; i < str_ary.length; i++) {
    if (str_ary[i].length == greatest_length) { 
      console.log("'" + str_ary[i] + "'"); 
    }
  }
}

// BUSINESS LOGIC FOR RELEASE 1: FIND A KEY-VALUE MATCH

var dog = {species: 'dog', name: 'King', age: 2, isPlottingRebellion: false};
var cat = {species: 'cat', name: 'Queen', age: 2, isPlottingRebellion: true};
var match_array = [];

Object.keys(dog && cat).forEach(function (i) {
  if (dog[i] == cat[i]) {
    match_array.push(true);
  }
});

// BUSINESS LOGIC FOR RELEASE 2: GENERATE RANDOM TEST DATA

var letters = "abcdefghijklmnopqrstuvwxyz";
var rand_word = "";
var rand_word_ary = [];
var rand_word_length_ary = [];

function length_of_array(integer) {
  for (var i = 0; i < integer; i++) {
    rand_word_generator();
  }
  longest_str();
}

function rand_word_generator() {
  for (var i = 0; i < Math.floor(Math.random() * 10 + 1); i++)
    rand_word += letters.charAt(Math.floor(Math.random() * letters.length));
    new newWord(rand_word);
    rand_word = "";
}

function newWord(rand_word) {
  this.rand_word = rand_word;
  rand_word_ary.push(this.rand_word);
}

function longest_str() {  
  
  for (var i = 0; i < rand_word_ary.length; i++) {
    rand_word_length_ary.push(rand_word_ary[i].length);
  }
  
  var greatest_length = Math.max(...rand_word_length_ary);
  
  for (var i = 0; i < rand_word_ary.length; i++) {
    if (rand_word_ary[i].length == greatest_length) { 
      console.log("'" + rand_word_ary[i] + "'"); 
    } 
  }
}

// NOTE:  The following driver code is arranged for convenient viewing in terminal

// RELEASE 0 TEST CODE
console.log("\n" + "RELEASE 0"); 
console.log("Longest word from the array shown below:");
longest_string();
console.log(str_ary);

// RELEASE 1 TEST CODE
console.log("\n" + "RELEASE 1"); 
console.log("Evaluation of any matches between the two objects shown below:");
console.log("Das ist " + match_array.includes(true) + "!");

// RELEASE 2 TEST CODE
console.log("\n" + "RELEASE 2"); 
console.log("Longest word(s) from the random word array shown below:");
length_of_array(5); // enter number of randomized words to create
console.log(rand_word_ary);

//==========================================================================

// RELEASE 0 PSEUDOCODE

// 1) Create an array that will store the length of the strings inside 
//    the array named str_length_ary

// 2) Create a function named longest_str to call an array of strings

// 3) Create a for loop inside the longest_str function with a counter variable 
//    that corresponds to the index positions inside the array of strings

// 4) Loop through each string in the array until the counter has reached 
//    one less than the length of the array

// 5) In each iteration, push the number corresponding to the length of  
//    each string into the array that stores the string lengths

// 6) Use the JavaScript Math object to find the highest number in 
//    str_length_ary

// 7) Create a second loop in the longest_str function with the same counter 
//    and termination condition as the prior loop

// 8) Inside the loop, iteratively compare the length of each string in the  
//    array to the length of the longest string identified in the first loop

// 9) If the length of the string equals the longest string's length, return  
//    that string (otherwise, don't return it)

// 10) Close the longest_string function

// 11) Call the longest_string function

// NOTE: I did not update this pseudocode to reflect the integration of  
//       this function into the set of Release 2 functions

// NOTE: An alternative solution that does not use the Math Object Method, 
//       Math.max(), is available here: https://repl.it/CcVw/0

//==========================================================================

// RELEASE 1 PSEUDOCODE

// 1) Create an array that will store any true evaluations of the values in two 
//    objects

// 2) Create a function that will iterate through the objects and compare the 
//    values, pushing 'true' for any matches into the array created in step 1

// 3) Evaluate whether the resulting array includes 'true'; if so, print 
//    'true'; if not, 'false' (logic is included in the test area at the bottom 
//    of this file)

// NOTE: I figured out how to accomplish this without using Object.keys(),
//       but I prefer this (far more) concise solution; the alternative 
//       solution is available here:  https://repl.it/CcVf/0

// NOTE: This process assumes that the key-value pairs in both objects are in
//       the same order

//==========================================================================

// RELEASE 2 PSEUDOCODE

// FUNCTION 1: length_of_array takes input for how many elements 
//             to put into an array ('rand_word_ary')

// Input_1: A whole number specified by a user

// Step_1: Calls a random word generator integer number of times

// Step_2: After all the random words are generated and pushed into the 
//         rand_word_ary, this function calls the longest string function  

// Output_1: One or more messages calling the random word generator 

// Output_2: One message calling the longest string function          

//--------------------------------------------------------------------------

// FUNCTION 2: rand_word_generator creates randomized words of varying 
//             length and letters

// Input_1: A call to run from the 'length_of_array' function

// Input_2: A random length for the word, generated internally

// Input_3: A set of letters to draw from (the 'letters' variable)

// Input_4: A blank random word string variable ('rand_word') to which  
//          randomly drawn letters can be added

// Step_1: Randomly assign a word length; 

// Step_2: Randomly draw from letters variable; 

// Step_3: Call a newWord constructor function that takes the word that has 
//         just been created and pushes it into the array that will store 
//         all the randomized words; 

// Step_4: Reset the random word string variable ('rand_word') back to being  
//         Blank so the next word to be created can start fresh

// Output_1: The randomized word ('rand_word') that is sent to the newWord 
//           constructor in step 3

// NOTE: All the apparent input dependencies and steps makes me wonder if 
//       this function could be broken out into smaller functions

//--------------------------------------------------------------------------

// FUNCTION 3: newWord constructor takes the just-created word and pushes it  
//             into the array that will store all the randomized words

// Input_1: A randomized word from rand_word_generator

// Step_1: Push the newWord instance into rand_word_ary

// Output_1: Individual newWord instances that are placed into the 
//           rand_word_ary, the number of which was set in length_of_array

// NOTE:  I did not update this pseudocode to reflect the integration of these 
//        functions with the Release 0 function that finds the longest string