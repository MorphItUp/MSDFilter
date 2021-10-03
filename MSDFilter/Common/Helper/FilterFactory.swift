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
    
    // MARK: - Properties
    
    private static var image = UIImage(named: "mountains")!.imageResize(sizeChange: CGSize(width: 250, height: 250))
    
    // MARK: - Methods
    
    static func createFilter(filter: FilterType) -> FilterProtocol {
        
        switch filter {
        case .original:
            return FilterItemViewModel(filterImage: image, filterName: "Original")
        case .sepiaTone:
            let sepiaToneFilter = SepiaToneFilter()
            let filteredImage = image.filterWithOperation(sepiaToneFilter)
            return FilterItemViewModel(filterImage: filteredImage, filterName: "SepiaTone")
        case .sketch:
            let sketchFilter = SketchFilter()
            sketchFilter.edgeStrength = 12
            let filteredImage = image.filterWithOperation(sketchFilter)
            return FilterItemViewModel(filterImage: filteredImage, filterName: "Sketch")
        case .monochrome:
            let monochromeFilter = MonochromeFilter()
            let filteredImage = image.filterWithOperation(monochromeFilter)
            return FilterItemViewModel(filterImage: filteredImage, filterName: "Monochrome")
        case .polkaDot:
            let polkaDotFilter = PolkaDot()
            let filteredImage = image.filterWithOperation(polkaDotFilter)
            return FilterItemViewModel(filterImage: filteredImage, filterName: "Polka Dot")
        case .haze:
            let haze = Haze()
            let filteredImage = image.filterWithOperation(haze)
            return FilterItemViewModel(filterImage: filteredImage, filterName: "Haze")
            
        }
        
    }
    
    static func createTrendyFilters(completion: @escaping ([FilterProtocol]) -> ()) {
        
        var filterArray: [FilterProtocol] = []
        
        let sepiaToneFilter = SepiaToneFilter()
        let sketchFilter = SketchFilter()
        let monochromeFilter = MonochromeFilter()
        let polkaDotFilter = PolkaDot()
        let haze = Haze()
        
        filterArray = [FilterItemViewModel(filterImage: image, filterName: "Original"),
                       FilterItemViewModel(filterImage: image.filterWithOperation(sepiaToneFilter), filterName: "SepiaTone"),
                       FilterItemViewModel(filterImage: image.filterWithOperation(sketchFilter), filterName: "Sketch"),
                       FilterItemViewModel(filterImage: image.filterWithOperation(monochromeFilter), filterName: "Monochrome"),
                       FilterItemViewModel(filterImage: image.filterWithOperation(polkaDotFilter), filterName: "Polka Dot"),
                       FilterItemViewModel(filterImage: image.filterWithOperation(haze), filterName: "Haze")]
        completion(filterArray)
        
        
    }
    
    static func createColorFilters(completion: @escaping ([FilterProtocol]) -> ()) {
        
        var filterArray: [FilterProtocol] = []
        
        let colorMatrixFilter = ColorMatrixFilter()
        let toonFilter = ToonFilter()
        let colorSpacefilter = CGAColorspaceFilter()
        
        filterArray = [FilterItemViewModel(filterImage: image.filterWithOperation(colorMatrixFilter), filterName: "Color Matrix"),
                       FilterItemViewModel(filterImage: image.filterWithOperation(toonFilter), filterName: "Toon Filter"),
                       FilterItemViewModel(filterImage: image.filterWithOperation(colorSpacefilter), filterName: "Color Space")]
        completion(filterArray)
        
    }
    
    static func createArtisticFilters(completion: @escaping ([FilterProtocol]) -> ()) {
        
        var filterArray: [FilterProtocol] = []
        
        
        let vibranceFilter = Vibrance()
        let hazeFilter = Haze()
        hazeFilter.distance = 0.1
        let blurFilter = iOSBlur()
        
        filterArray = [FilterItemViewModel(filterImage: image.filterWithOperation(vibranceFilter), filterName: "Vibrance"),
                       FilterItemViewModel(filterImage: image.filterWithOperation(hazeFilter), filterName: "Haze Filter"),
                       FilterItemViewModel(filterImage: image.filterWithOperation(blurFilter), filterName: "Blur Filter")]
        completion(filterArray)
    }
    
    static func createGradientFilters(completion: @escaping ([FilterProtocol]) -> ()) {
        var filterArray: [FilterProtocol] = []
        
        let contrast = ContrastAdjustment()
        contrast.contrast = 2
        let saturation = SaturationAdjustment()
        saturation.saturation = 2
        
        
        filterArray = [FilterItemViewModel(filterImage: image.filterWithOperation(contrast), filterName: "Contrast"),
                       FilterItemViewModel(filterImage: image.filterWithOperation(saturation), filterName: "Saturation")
        ]
        completion(filterArray)
        
        
        
    }
    
    static func createSketchFilters(completion: @escaping ([FilterProtocol]) -> ()) {
        
        var filterArray: [FilterProtocol] = []
        
        let sketchFilter = SketchFilter()
        sketchFilter.edgeStrength = 1
        let edgySketchFilter = SketchFilter()
        sketchFilter.edgeStrength = 15
        
        filterArray = [FilterItemViewModel(filterImage: image.filterWithOperation(sketchFilter), filterName: "Sketch Filter"),
                       FilterItemViewModel(filterImage: image.filterWithOperation(edgySketchFilter), filterName: "Edgy Sketch")
        ]
        completion(filterArray)
        
    }
    
}
