//
//  FilterScrollableView.swift
//  MSDFilter
//
//  Created by Mohamed El Gedawy on 26/09/2021.
//

import UIKit

class FilterScrollableView: UIView {
    
    // MARK: - Properties
    
    var collectionView = UICollectionView(frame: CGRect.zero,
                                          collectionViewLayout: UICollectionViewFlowLayout())
    var didSelectClosure: ((Int) -> ()) = { _ in }
    var items = [FilterProtocol]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    // MARK: - View Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initScrollItems()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = self.bounds
    }
    
    // MARK: - Helping
    private func initScrollItems() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: bounds, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: "FilterScrollableView", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "filterCell")
        collectionView.isScrollEnabled = true
        collectionView.isPagingEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.alwaysBounceHorizontal = false
        collectionView.backgroundColor = .clear
        addSubview(collectionView)

    }
}

// MARK: - UICollectionView DataSource

extension FilterScrollableView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filterCell", for: indexPath) as! FilterCollectionViewCell
        cell.updateCell(filterItem: items[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionView Delegate

extension FilterScrollableView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectClosure(indexPath.row)
    }
    
}


// MARK: - UICollectionViewDelegateFlowLayout

extension FilterScrollableView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 110)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
