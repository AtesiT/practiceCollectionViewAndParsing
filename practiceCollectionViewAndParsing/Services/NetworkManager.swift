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
    
    func sendData(with structData: [String: Any], to url: URL, completion: @escaping (Result<Any, NetworkError>) -> Void) {
        let serializedData = try? JSONSerialization.data(withJSONObject: structData)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = serializedData
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data, let response else {
                print(error?.localizedDescription ?? "No error")
                return
            }
            print(response)
            do {
                let dataJSON = try JSONSerialization.jsonObject(with: data)
                completion(.success(dataJSON))
            } catch {
                completion(.failure(.dataError))
            }
        }.resume()
    }
    
}
