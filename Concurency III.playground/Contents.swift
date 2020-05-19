import Foundation

// What queue am I running on?
// Main Queue -> Serial Queue -> the executing block needs to finish before the enxt block begins execution
print("I am on the main queue 1")

let concurrentQueue = DispatchQueue(label: "My Concurrent Queue")

// sync means -> Main queue, add to the queue immediately and wait for the block to be executed
concurrentQueue.sync {
    print("I'm on concurrent 1")
}

print("I'm on the main queue 2")

// async means -> Main Queue, please add to the queue immediately and keep going.
concurrentQueue.async {
    print("I'm on concurrent 2")
}

print("I'm on the main queue 3")

concurrentQueue.sync {
    print("I'm on concurrent 3")
}

print("I'm on the main queue 4")

//
//// What does sync mean?
//// Add to the queue and _wait_ for it to be executed.
//DispatchQueue.main.sync {
//    print("I'm on the main queue (async)")
//}
//
//print("Added new block to main queue")
//
//
//// What does async mean?
//// Add to the queue and do not wait for it to be executed.
//DispatchQueue.main.async {
//    print("I'm on the main queue (async)")
//}
