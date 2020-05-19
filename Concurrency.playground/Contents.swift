import Foundation

// NSOperation is built on top of GCD
// It is an object

//1, 2 and 3 are a single process
let downloadJSONOperation = BlockOperation {
    sleep(1)
    print("1. Downloading JSON")
}

let processJSONOperation = BlockOperation {
    sleep(1)
    print("2. Processing the JSON")
}

processJSONOperation.addDependency(downloadJSONOperation)

let downloadingImagesFromJSONOperation = BlockOperation {
    sleep(1)
    print("3. Downloading images")
}
downloadingImagesFromJSONOperation.addDependency(processJSONOperation)

// a is another process
let downloadingMoreJSONOperation = BlockOperation {
    sleep(1)
    print("a. Downloading more JSON")
}

// ! is another process
class BluetoothOperation: Operation {
    
    private let timeout: Int
    init(timeout: Int) {
        self.timeout = timeout
    }
    
    // OOP -> Inheritance?
    // We get all the properties and functions of the 'super' (parent) class
    override func main() {
        super.main()
        print("!. Timeout: \(timeout)")
    }
}

let bluetoothOperation = BluetoothOperation(timeout: 5)


// By default, operation queue is concurrent.
let operationQueue = OperationQueue()
operationQueue.name = "My Operation Queue"

operationQueue.addOperations([downloadJSONOperation,
                              processJSONOperation,
                              downloadingImagesFromJSONOperation,
                              downloadingMoreJSONOperation,
                              bluetoothOperation], waitUntilFinished: false) // waitUntilFinished means sync

print("Finished")

// Concurrency
// How many cores do I have?
// 8 cores
// So quick that the second core gets the operations ready
