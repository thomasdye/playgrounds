import Foundation

class Atomic<AConcreteType> {
    
    private let atomicQueue = DispatchQueue(label: "Atomic Queue \(AConcreteType.self)")
    private var value: AConcreteType
    
    init(value: AConcreteType) {
        self.value = value
    }
    
    func get() -> AConcreteType {
    
        // Sync -> Wait until this block is finished executing
        return atomicQueue.sync { value }
    }
    
    func modify(closure: (AConcreteType) -> AConcreteType) {
        
        atomicQueue.sync {
            
            // Send the caller my 'value'
            let modifiedValue = closure(value)
            
            // Have the caller return a 'modifiedValue'
            value = modifiedValue
            
        }
    }
}

let atomicExample = Atomic(value: 0)


atomicExample.modify(closure: { valueFromAtomicExample in
    
    // multiply by 5 then add 2
    let multipliedValue = valueFromAtomicExample * 5
    let addedValue = multipliedValue + 2
    
    // return the value (line 17)
    return addedValue
    
})

let anotherAtomicExample = Atomic(value: "Initial Value")

anotherAtomicExample.modify { (stringFromAnotherAtomicExample) -> String in
    
    return "Brand new value"
}

DispatchQueue.concurrentPerform(iterations: 100) { iterationIndex in // index = 0
    anotherAtomicExample.modify { originalString -> String in
        return "\(iterationIndex)"
    }
}

print(anotherAtomicExample.get())
