import Foundation

enum NameCells: CaseIterable {
    case parsePhoto, parseData, sendData, parseDataAlamofire, sendDataAlamofire
    
    var title: String {
        switch self {
        case .parsePhoto:
            return "Parse Photo"
        case .parseData:
            return "Parse Data"
        case .sendData:
            return "Send Data"
        case .parseDataAlamofire:
            return "Parse Data Alamofire"
        case .sendDataAlamofire:
            return "Send Data Alamofire"
        }
    }
    
    var link: URL {
        switch self {
        case .parsePhoto: return URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Google_2015_logo.svg/2560px-Google_2015_logo.svg.png")!
        case .parseData: return URL(string: "https://jsonplaceholder.typicode.com/posts/1")!
        case .sendData: return URL(string: "https://jsonplaceholder.typicode.com/posts")!
        case .parseDataAlamofire: return URL(string: "https://jsonplaceholder.typicode.com/posts/1")!
        case .sendDataAlamofire: return URL(string: "https://jsonplaceholder.typicode.com/posts")!
        }
    }
}

enum NetworkError: Error {
    case dataError
    case networkError
    case downloadError
}


struct TheParseData: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
