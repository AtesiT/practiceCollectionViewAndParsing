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
}
