// create a string variable
var str = "pupils";

// create another variable that will store the reversed string
var str_rev = "";

// create a function that can call the string variable
function reverse() {

// create a for loop inside the function
// create a variable in the for loop that equals the length of the string minus one...this will be a reverse counter
// set a condition that tells the loop to stop when the reverse counter has reached zero (aka index position 0)
// tell the counter to go down by one
 for (var i = str.length - 1; i >= 0; i--) {

  // inside the for loop, iteratively modify the reversed string variable by adding the character that 
  // corresponds to the counter's index position
   str_rev += str[i];
  }

  // when the loop has ended, print the reversed string variable
  console.log("The original string was '" + str + "'.");
  console.log("The reversed string is '" + str_rev + "'.");
}

// DRIVER CODE
reverse();


// Add driver code that prints the variable if some condition is true. The condition can be a silly one, like 1 == 1.

// a test to see if the reversed string does not equal the input variable...I admit that this is on the silly side
  if (str_rev != str) {
    console.log("Thankfully, the reversed string, '" + str_rev + "', does not equal the original string, '" + str + "'.");
    true;
  } else {
    console.log("Unfortunately, the string you wanted to reverse, '" + str_rev + "', still equals the original string, '" + str + "'.");
    false;
  }