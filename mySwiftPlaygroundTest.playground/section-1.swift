//Testing playground for new SWIFT language, cheet sheet.

import UIKit


//Integer:
//These are constant variables which is 
// why the word let declares them, static values.
let tutorialTeam = 56
let editorialTeam = 23

/*
  With swift constant(let) variables can have optimizations preformed by the compiler, so its better to use let when possible.

    data types can be defined but swift was designed with an auto infering data type compiler so while
        let tutorialTeam: Int = 56
   will specifically set the constant variable tutorialTeam to integer, this would be auto detected by swift compiler with let tutorialTeam = 56
*/

//this is a normal variable or not constant variable, declared with the var word
var totalTeam = tutorialTeam + editorialTeam

//if totalTeam was a const or let then this would error on data types.
totalTeam += 1


//Floats and Double:
let priceInferred = 19.99
//double has more precission then float numbers, double is the infered data type for nums with decimal places.
let priceExplicit = 19.99

//BOOL:
//as named swift inferred and a user set variables both the same data type.
let onSaleInferred = true
let onSaleExplicit: Bool = false

//Strings:
//again both the same data types
let nameInferred = "Whoopie " + " Cushion"  //+ concats strings
let nameExplicit: String = "Whoopie Cushion"

//Logic statements
//IF:

//brackets around statment are now optional
// rest is similar braces required even for 1 line if's etc.
if onSaleInferred
{
    //to substitute something in a string in Swift, simply use this syntax: \(your expression).
    println("\(nameInferred) on sale for \(priceInferred)!")
}
else
{
    //String interpolation
    println("\(nameInferred) at regular price: \(priceInferred)!")
}

//println output of this code shown by bringing up the Assistant Editor with View\Assistant Editor\Show Assistant Editor.


//To use variables or cast them its similar to obj c and other languages.
let label = "Width is "
let width = 94
let widthLabel = label + String(width)

//or we can use the string interoplation
let widthLabel2 = label + "\(width)"

//Array's & Dictionary
//Array:
var shoppingList = ["pringles", "Bottled Water", "Apples", "Oranges", "Jumbo Jet"]

//Access array elements like in php or other languages
shoppingList[1] //get value
shoppingList[1] = "Bottled Rain Water"  //set value

//to create an empty array use initalize block
let emptyArray = [String]()  // an empty array of strings

//Or empty array shorthand
let emptyArray2 = []   //these shorthand array code should only be used if data type can be infered or is same for all objects

//Dictionary: [Key: value] pairs
var staffDict = ["Eddie Power": "The Big Boss", "Malcolm": "Captain","Kaylee": "Mechanic"]

//Empty dictionary with initalize code.
let emptyDictionary = Dictionary<String, Float>()

//Or empty dict shorthand
let emptyDictionary2 = ["eddie": "human"]

for var i = 0; i < 100; i++
{
    i+=i
    for var j = 0; j < 100; j++
    {
        j++
    }
}














