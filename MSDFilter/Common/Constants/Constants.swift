//
//  Constants.swift
//  MSDFilter
//
//  Created by Mohamed El Gedawy on 27/09/2021.
//

import Foundation

enum Constants {
    
    enum Storyboard: String {
        case filter
        case collage
        
        var name: String {
            return self.rawValue.capitalized
        }
    }
    
}
