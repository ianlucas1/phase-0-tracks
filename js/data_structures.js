// RELEASE 0:  WORK WITH ARRAYS

// declare an array of four colors ("blue", for instance, though you're welcome to 
// get crazy with something like "iridescent blue/green with silver sparkles")

var colors = ["Chestnut", "Black", "Buckskin", "Palomino"]

// declare an array of four names that you might give a horse ("Ed" is always a solid 
// choice to start with)

var names = ["Sir Barton", "Gallant Fox", "War Admiral", "American Pharoah"]

// Write additional code that adds another color to the colors array, and 
// another horse name to the horses array

colors.push("Bay")
names.push("Seattle Slew")

// console.log(colors)
// console.log(names)

//====================================

// RELEASE 1:  BUILD AN OBJECT

// Add code that will use your two arrays to create an object. The keys of your 
// object should be horse names, and the values should be colors. Your solution should 
// be something that would work for any number of colors/horses, as long as the two 
// arrays are the same length.

var horses = {}

for (var i = 0; i < names.length; i++) {
  horses[names[i]] = colors[i];
}

console.log("HORSES OBJECT:")
console.log(horses)

//====================================

// RELEASE 2:  BUILD MANY OBJECTS USING A CONSTRUCTOR

// Write a constructor function for a car. Give it a few different properties of various data types, 
// including at least one function. Demonstrate that your function works by creating a few cars with it.

function Car(make, zeroToSixty, isSportsCar) {
  this.make = make;
  this.zeroToSixty = zeroToSixty;
  this.isSportsCar = isSportsCar;

  this.sound = function() {
    if (isSportsCar == true) {
        console.log("The sound this car makes is 'VROOM!!!'"); 
    } else {
        console.log("The sound this car makes is 'vrrrr'");  
    }
  }; 

  console.log("");
  console.log("NEW CAR:")
  console.log("Car make - " + this.make);
  console.log("0-60 time - " + this.zeroToSixty + " seconds");
  console.log("Sports car - " + this.isSportsCar);
}

var newCar = new Car("Honda", 5, false);
newCar.sound();

var newCar = new Car("Toyota", 6, false);
newCar.sound();

var newCar = new Car("Ferrari", 3.5, true);
newCar.sound();

