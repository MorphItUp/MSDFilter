//
//  Identifiable.swift
//  MSDFilter
//
//  Created by Mohamed El Gedawy on 27/09/2021.
//

// MARK: - Protocol

protocol Identifiable {
    static var identifier: String { get }
}

// MARK: - Default implementation

extension Identifiable {
    static var identifier: String {
        return String(describing: Self.self)
    }
}
