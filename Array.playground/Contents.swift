//: Playground - noun: a place where people can play

import UIKit

//Khởi tạo mảng
var someInts = [Int]()
print("sô phần tử của mảng là:\(someInts.count)");
someInts.append(3)
someInts.count
someInts = []
//Bây giờ mảng someInts là rỗng, những các phần tử của nó vẫn là kiểu Int.
someInts.count

//Tạo một array với giá trị mặc định

var threeDoubles = [Double](count: 3, repeatedValue: 0)


var anotherDouble = [Double](count:3 , repeatedValue:2.0)

var sixDouble = threeDoubles + anotherDouble

var shoppingList:[String] = ["Eggs", "Milk"]

if shoppingList.isEmpty
{
print("mang rong")

}
else
{
print("mang ko rong")
}

shoppingList.append("Tomato")
//shoppingList.removeFirst()
//shoppingList
//shoppingList.removeLast()
//shoppingList
//shoppingList.removeAtIndex(1)
//shoppingList