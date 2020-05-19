import Foundation

let urls = [
    URL(string: "https://swapi.dev/api/people/1/")!,
    URL(string: "https://swapi.dev/api/people/2/")!,
    URL(string: "https://swapi.dev/api/people/3/")!,
    URL(string: "https://swapi.dev/api/people/4/")!,
    URL(string: "https://swapi.dev/api/people/5/")!
]

let group = DispatchGroup()

for singleURL in urls {
    
    group.enter() // Means that the group is now waiting for someone. +1
    
    let task = URLSession.shared.dataTask(with: singleURL) { (possibleData, _, _) in
        guard let possibleData = possibleData else { return }
        print("\(singleURL) - \(possibleData)")
        
        group.leave() // Means the group is no longer waiting for someone. -1
    }
    
    task.resume()
}

// A group will not block the queue it's in
print("Queued all my network calls")

// When the group count reaches 0, call the 'notifyBlock'.
group.notify(queue: DispatchQueue.main) {
    
    print("All my calls finished")
    
}
// I'm on the main queue.

