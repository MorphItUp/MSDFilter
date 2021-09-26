//
//  FilterItem.swift
//  MSDFilter
//
//  Created by Mohamed El Gedawy on 26/09/2021.
//

import UIKit

// MARK: - Filter Protocol

protocol FilterProtocol {
    var image: UIImage { get }
    var name: String { get }
}

class FilterItem: FilterProtocol {
    
    // MARK: - Properties
    
    var image: UIImage
    var name: String
    
    // MARK: - Init
    
    init(filterImage: UIImage, filterName: String) {
        self.name = filterName
        self.image = filterImage
    }
}

extension FilterItem {
    
    public static func identity() -> [FilterProtocol] {
        var items: [FilterProtocol] = []
        items = [FilterFactory.createFilter(filter: .monochrome),
                 FilterFactory.createFilter(filter: .polkaDot),
                 FilterFactory.createFilter(filter: .sepiaTone),
                 FilterFactory.createFilter(filter: .sketch),
                 FilterFactory.createFilter(filter: .vignette) ]
        return items
    }
    
}
