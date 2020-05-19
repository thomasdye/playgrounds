import Foundation

func arrayOfAny(array: [String]) -> Int {
    var newArray: [Int] = []
    for i in array {
       let append = Int(i)
        newArray.append(append)
    }
    
}
