import Foundation

class DataModel {

    func fetchData(completion: @escaping ([String]) -> Void) {
        // Fetch data from a server or local storage
        // For now, we'll just return some dummy data
        let data = ["Item 1", "Item 2", "Item 3"]
        completion(data)
    }

}