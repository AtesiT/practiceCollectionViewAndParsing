import UIKit

enum NameCells: CaseIterable {
    case parsePhoto, parseData, sendData
    
    var title: String {
        switch self {
        case .parsePhoto:
            return "Parse Photo"
        case .parseData:
            return "Parse Data"
        case .sendData:
            return "Send Data"
        }
    }
}

final class CollectionViewController: UICollectionViewController {
    
    private var arrayCells = NameCells.allCases
    
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

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 50, height: 50)
    }
}
