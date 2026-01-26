import UIKit

private let reuseIdentifier = "cell"

enum NameCells: CaseIterable {
    case parsePhoto, ParseData, sendData
    
    var title: String {
        switch self {
        case .parsePhoto:
            return "Parse Photo"
        case .ParseData:
            return "Parse Data"
        case .sendData:
            return "Send Data"
        }
    }
}

final class CollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
    
        return cell
    }
}
