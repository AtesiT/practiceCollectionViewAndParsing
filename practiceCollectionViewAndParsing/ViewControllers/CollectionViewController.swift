import UIKit

final class CollectionViewController: UICollectionViewController {
    
    private let networkManager = NetworkManager.shared
    
    private let arrayCells = NameCells.allCases
    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayCells.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        guard let cell = cell as? CollectionViewCell else {return UICollectionViewCell()}
        cell.label.text = arrayCells[indexPath.row].title
        return cell
    }
}

//  MARK: - Actions with Collection
extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 50, height: 50)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userAction = arrayCells[indexPath.item]
        
        switch userAction {
        case .parsePhoto:
            print("Was tapped button to parse photo")
            parsePhoto()
        case .parseData:
            print("Was tapped button to parse data")
            parseData()
        case .sendData:
            print("Was tapped button to send data")
            sendData()
        }
    }
}


//  MARK: - Functions
extension CollectionViewController {
    private func parsePhoto() {
        networkManager.parsePhoto(from: NameCells.parsePhoto.link) { result in
            switch result {
            case .success(let imageData):
                print(imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
    private func parseData() {
        networkManager.parseData(TheParseData.self, from: NameCells.parseData.link) { result in
            switch result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            }
        }
    }
    private func sendData() {
        let parameters: [String: Any] = [
            "userId": 0,
            "id": 0,
            "title": "John",
            "body": "Hi"
        ]
        networkManager.sendData(with: parameters, to: NameCells.sendData.link) { result in
            switch result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            }
        }
    }
}
