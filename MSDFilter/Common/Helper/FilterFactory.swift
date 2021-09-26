//
//  FilterFactory.swift
//  MSDFilter
//
//  Created by Mohamed El Gedawy on 26/09/2021.
//

import UIKit
import GPUImage

enum FilterType: Int {
    case original
    case sepiaTone
    case sketch
    case monochrome
    case polkaDot
    case haze
}

class FilterFactory {
    
    static func createFilter(filter: FilterType) -> FilterProtocol {
        
        let image = UIImage(named: "mountains")!
        
        switch filter {
        case .original:
            return FilterItem(filterImage: image, filterName: "Original")
        case .sepiaTone:
            let sepiaToneFilter = SepiaToneFilter()
            let filteredImage = image.filterWithOperation(sepiaToneFilter)
            return FilterItem(filterImage: filteredImage, filterName: "SepiaTone")
        case .sketch:
            let sketchFilter = SketchFilter()
            sketchFilter.edgeStrength = 12
            let filteredImage = image.filterWithOperation(sketchFilter)
            return FilterItem(filterImage: filteredImage, filterName: "Sketch")
        case .monochrome:
            let monochromeFilter = MonochromeFilter()
            let filteredImage = image.filterWithOperation(monochromeFilter)
            return FilterItem(filterImage: filteredImage, filterName: "Monochrome")
        case .polkaDot:
            let polkaDotFilter = PolkaDot()
            let filteredImage = image.filterWithOperation(polkaDotFilter)
            return FilterItem(filterImage: filteredImage, filterName: "Polka Dot")
        case .haze:
            let haze = Haze()
            let filteredImage = image.filterWithOperation(haze)
            return FilterItem(filterImage: filteredImage, filterName: "Haze")
        
        }
        
    }
    
}
