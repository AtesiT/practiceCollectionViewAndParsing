import Foundation
import Alamofire

final class NetworkManagerAlamofire {
    static let shared = NetworkManagerAlamofire()
    
    private init() {}
    
    func parseData(from url: URL) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    guard let dataDetails = value as? [String: Any] else {return}
                    print(dataDetails)
                case .failure(let error):
                    print("Error is: ", error)
                }
            }
    }
    
    func sendData(to url: URL) {
        let parameters = TheParseData(userId: 0, id: 0, title: "John", body: "Hi")
        
        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder(encoder: JSONEncoder()))
            .validate()
            .responseDecodable(of: TheParseData.self) { dataResponse in
                switch dataResponse.result {
                case .success(let data):
                    print(data)
                case .failure(let error):
                    print(error)
                }
            }
    }
}

