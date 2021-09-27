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

class FilterItemViewModel: FilterProtocol {
    
    // MARK: - Properties
    
    var image: UIImage
    var name: String
    
    // MARK: - Init
    
    init(filterImage: UIImage, filterName: String) {
        self.name = filterName
        self.image = filterImage
    }
}

extension FilterItemViewModel {
    
    public static func identity() -> [FilterProtocol] {
        var items: [FilterProtocol] = []
        items = [FilterFactory.createFilter(filter: .original),
                 FilterFactory.createFilter(filter: .monochrome),
                 FilterFactory.createFilter(filter: .polkaDot),
                 FilterFactory.createFilter(filter: .sepiaTone),
                 FilterFactory.createFilter(filter: .sketch),
                 FilterFactory.createFilter(filter: .haze) ]
        return items
    }
    
    public static func trendyFilters(completion: @escaping ([FilterProtocol]) -> ()) {
        return FilterFactory.createTrendyFilters{ filters in
            completion(filters)
        }
    }
    
    public static func colorFilters(completion: @escaping ([FilterProtocol]) -> ()) {
        return FilterFactory.createColorFilters{ filters in
            completion(filters)
        }
    }
    
    public static func artisticFilters(completion: @escaping ([FilterProtocol]) -> ()) {
        return FilterFactory.createArtisticFilters{ filters in
            completion(filters)
        }
    }
    
    public static func gradientFilters(completion: @escaping ([FilterProtocol]) -> ()) {
        return FilterFactory.createGradientFilters{ filters in
            completion(filters)
        }
    }
    
    public static func sketchFilter(completion: @escaping ([FilterProtocol]) -> ()) {
        FilterFactory.createSketchFilters { filters in
            completion(filters)
        }
        
    }

    
}
