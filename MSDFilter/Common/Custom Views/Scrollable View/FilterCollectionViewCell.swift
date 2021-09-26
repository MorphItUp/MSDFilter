//
//  FilterCollectionViewCell.swift
//  MSDFilter
//
//  Created by Mohamed El Gedawy on 26/09/2021.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var filterName: UILabel!
    
    // MARK: - View Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateViewUI()
    }
    
    // MARK: - Methods
    
    func updateCell(filterItem: FilterProtocol) {
        imageView.image = filterItem.image
        filterName.text = filterItem.name
    }
    
    // MARK: - Private Methods
    
    private func updateViewUI() {
        imageView.layer.cornerRadius = 10
    }
}
