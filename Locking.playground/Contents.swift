import Foundation
// Currently on: Main thread or queue

// If we had an app, that had a single instance of Information.
// How many staates could there be?
struct Information {
    let value: Bool // 2 states -> true/false
    let anotherValue: Bool // 2 states -> true/false
    let everyOtherValue: Bool // 2 states -> true/false
    let string: String = "" // Unicode characters, empty string, only alphanumeric
}

var counter = 0
let lock = NSLock()
let begin = Date()
let serialQueue = DispatchQueue.init(label: "Serial Queue")

// Increment the counter 100 times concurrently.
DispatchQueue.concurrentPerform(iterations: 100) { currentIteration in
    
    // Currently on any background thread (we can be on all threads if we're performing concurrently.)
    serialQueue.sync {
        counter += 1
    }
}

let endDate = Date()

print("\(counter) in \(endDate.timeIntervalSince(begin))")

// 1.?x modifier regarding time
print(counter) // Final value: ??

// GPU -> Graphics Processing Unit
// Draws images on the screen
// FPS -> 60 fps -> If you don't run @ 60fps, you get lag
//
// If we could calculate the animation, we could send each of the 60 grames to a single core and then have each core draw it


