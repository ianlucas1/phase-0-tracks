// RELEASE 0:  WORK WITH ARRAYS

// declare two separate arrays:

// an array of four colors ("blue", for instance, though you're welcome to 
// get crazy with something like "iridescent blue/green with silver sparkles")

// an array of four names that you might give a horse ("Ed" is always a solid 
// choice to start with)

var colors = ["Chestnut", "Black", "Buckskin", "Palomino"]
var names = ["Sir Barton", "Gallant Fox", "War Admiral", "American Pharoah"]

// Write additional code that adds another color to the colors array, and another horse name to the horses array

colors.push("Bay")
names.push("Seattle Slew")

console.log(colors)
console.log(names)

// RELEASE 1:  BUILD AN OBJECT

// Add code that will use your two arrays to create an object. The keys of your 
// object should be horse names, and the values should be colors. Your solution should 
// be something that would work for any number of colors/horses, as long as the two 
// arrays are the same length.

var horses = names + colors

console.log(horses)


