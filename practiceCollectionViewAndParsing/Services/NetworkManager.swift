import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}

}

extension NetworkManager {
    func parsePhoto(from url: URL, completion: @escaping (Result<Data, NetworkError>) -> Void ) {
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else {
                completion(.failure(.dataError))
                return
            }
            DispatchQueue.main.async {
                completion(.success(imageData))
            }
        }
    }
    
    func parseData<T:Decodable>(_ type: T.Type, from url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error ?? "No error")
                return
            }
            do {
                let jsonData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(jsonData))
            } catch {
                completion(.failure(.dataError))
            }
        }.resume()
    }
}
