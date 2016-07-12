// create a string variable
// create another variable that will store the reversed string
// create a function that can call the string variable
// create a for loop inside the function
// create a variable in the function that equals the length of the string...this will be a reverse counter
// set a condition that tells the loop to stop when the reverse counter has reached zero (aka index position 0)
// tell the counter to go down by one
// inside the for loop, iteratively modify the reversed string variable by adding the character that corresponds to the counter's index position
// when the loop has ended, print the reversed string variable
// close the function
// call the function


// I realize there are no semi-colons after my variables or after the function call and that its probably a BAD idea in JavaScript,
// But I was just playing around to see if it would work without them

var str = "pupils"
var str_rev = ""

function reverse() {  
 for (var i = str.length - 1; i >= 0; i--) {
   str_rev += str[i]
  }
  console.log(str_rev)
}

reverse()