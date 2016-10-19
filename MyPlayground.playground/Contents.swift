//: Playground - noun: a place where people can play

import UIKit

var aString = "heloo"
var reverse = ""

for character in aString.characters {
    var asString = "\(character)"
    reverse = asString + reverse
}

print(reverse)