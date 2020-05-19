import Foundation

// Currently on: Main Thread/Queue

struct Film: Decodable {
  let id: Int
  let title: String
  let openingCrawl: String
  let director: String
  let producer: String
  let releaseDate: String
  let starships: [String]
  
  enum CodingKeys: String, CodingKey {
    case id = "episode_id"
    case title
    case openingCrawl = "opening_crawl"
    case director
    case producer
    case releaseDate = "release_date"
    case starships
  }
}

var films: [Film] = []

let semaphore = DispatchSemaphore(value: 0)

let dataTask = URLSession.shared.dataTask(with: URL(string: "https://swapi.dev/api/films/")!) { (data, _, _) in
    
    func parseJSON(data: Data) -> Film? {
        
        var returnValue: Film?
        do {
            returnValue = try JSONDecoder().decode(Film.self, from: data)
        } catch {
            print("Error took place: \(error.localizedDescription).")
        }
        films.append(returnValue!)
        return returnValue
    }
    
    parseJSON(data: data!)
    


    }



dataTask.resume()


print(films)
