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
}

