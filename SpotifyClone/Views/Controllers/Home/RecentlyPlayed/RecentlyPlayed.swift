
import UIKit

class TrackCell: CollectionBaseCell {
    override func setupView() {
        self.addSubview(title)
        self.addSubview(imgArtwork)
        title.numberOfLines = 2
        self.addConstraintWithFormat(formate: "H:|[v0]|", views: imgArtwork)
        self.addConstraintWithFormat(formate: "H:|-10-[v0]|", views: title)
        self.addConstraintWithFormat(formate: "V:|-5-[v0]-5-[v1(42)]|", views: imgArtwork, title)
        updateUI()
    }
    
    private func updateUI(){
         imgArtwork.image = #imageLiteral(resourceName: "artist")
         title.text = "Best of Coke Studio @MTV songs"
    }
}


class RecentyPlayedCell: CollectionBaseCell {
    
    
    var onTapSelection:(()->())?
    
    let lblSectionTitle: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 26)
        lbl.text = "Recently played"
        lbl.textColor = .white
        return lbl
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        collView.showsHorizontalScrollIndicator = false
        collView.backgroundColor = .clear
        return collView
    }()
    
    override func setupView() {
        self.addSubview(lblSectionTitle)
        self.addSubview(collectionView)
        self.collectionView.register(TrackCell.self, forCellWithReuseIdentifier: "trackCell")
        self.addConstraintWithFormat(formate: "H:|[v0]|", views: collectionView)
        self.addConstraintWithFormat(formate: "H:|-15-[v0]|", views: lblSectionTitle)
        self.addConstraintWithFormat(formate: "V:|-10-[v0(40)]-20-[v1]|", views: lblSectionTitle, collectionView)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    
}


//MARK: - Collection View Functionality

extension RecentyPlayedCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "trackCell", for: indexPath) as! TrackCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.onTapSelection?()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.height - 40, height: collectionView.frame.size.height )
    }
    
    
}

