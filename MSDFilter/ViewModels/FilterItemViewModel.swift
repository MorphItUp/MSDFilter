//
//  FilterItem.swift
//  MSDFilter
//
//  Created by Mohamed El Gedawy on 26/09/2021.
//

import UIKit

// MARK: - Filter Protocol

protocol FilterProtocol {
    var image: UIImage! { get }
    var name: String! { get }
}

class FilterItemViewModel: FilterProtocol {
    
    // MARK: - Private Properties
    
    private var trendyFilterArray: [FilterProtocol] = []
    private var colorFilterArray: [FilterProtocol] = []
    private var artisticFilterArray: [FilterProtocol] = []
    private var gradientFilterArray: [FilterProtocol] = []
    private var sketchFilterArray: [FilterProtocol] = []
    
    // MARK: - Properties
    
    var image: UIImage!
    var name: String!
    
    // MARK: - Init
    
    init(filterImage: UIImage, filterName: String) {
        self.name = filterName
        self.image = filterImage
    }
    
    init() {}
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
    
    public func trendyFilters(completion: @escaping ([FilterProtocol]) -> ()) {
        guard self.trendyFilterArray.isEmpty else { return completion(trendyFilterArray) }
        FilterFactory.createTrendyFilters { filters in
            self.trendyFilterArray = filters
            completion(filters)
        }
        
    }
    
    public func colorFilters(completion: @escaping ([FilterProtocol]) -> ()) {
        guard self.colorFilterArray.isEmpty else { return completion(colorFilterArray) }
        return FilterFactory.createColorFilters { filters in
            self.colorFilterArray = filters
            completion(filters)
        }
    }
    
    public func artisticFilters(completion: @escaping ([FilterProtocol]) -> ()) {
        guard self.artisticFilterArray.isEmpty else { return completion(artisticFilterArray) }
        return FilterFactory.createArtisticFilters { filters in
            self.artisticFilterArray = filters
            completion(filters)
        }
    }
    
    public func gradientFilters(completion: @escaping ([FilterProtocol]) -> ()) {
        guard self.gradientFilterArray.isEmpty else { return completion(gradientFilterArray) }
        return FilterFactory.createGradientFilters { filters in
            self.gradientFilterArray = filters
            completion(filters)
        }
    }
    
    public func sketchFilter(completion: @escaping ([FilterProtocol]) -> ()) {
        guard self.sketchFilterArray.isEmpty else { return completion(sketchFilterArray) }
        return FilterFactory.createSketchFilters { filters in
            self.sketchFilterArray = filters
            completion(filters)
        }
        
    }

    
}
