import Foundation
final class ListViewModel {
    var listResult: (([List]) -> Void)?
    var listIsLoading: ((Bool) -> Void)?
    
    func onRefresh(completion: @escaping (([List]) -> Void)) {
        listIsLoading?(true)
        var request = URLRequest(url: URL(string : "https://api.nytimes.com/svc/books/v3/lists/best-sellers.json?api-key=Px3L2HKaJ0rZj2RipRA0pmDif9GlAM12")!)
        request.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            do {
                let result = try JSONDecoder().decode(ListResult.self, from: data)
                DispatchQueue.main.async {
                    self.listResult?(result.results)
                    completion(result.results)
                    self.listIsLoading?(false)
                }
            } catch {
                print(error)
                DispatchQueue.main.async {
                    self.listIsLoading?(false)
                }
            }
        }
        task.resume()
    }
}
