import Foundation

final class BooksViewModel {
    var bookResult: (([BookCategory]) -> Void)?
    var bookIsLoading: ((Bool) -> Void)?
    
    func onRefresh(completion: @escaping (([BookCategory]) -> Void)) {
        bookIsLoading?(true)
        var request = URLRequest(url: URL(string : "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=Px3L2HKaJ0rZj2RipRA0pmDif9GlAM12")!)
        request.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            do {
                let result = try JSONDecoder().decode(BookResult.self, from: data)
                DispatchQueue.main.async {
                    self.bookResult?(result.results)
                    completion(result.results)
                    self.bookIsLoading?(false)
                }
            } catch {
                print(error)
                DispatchQueue.main.async {
                    self.bookIsLoading?(false)
                }
            }
        }
        task.resume()
    }
}
