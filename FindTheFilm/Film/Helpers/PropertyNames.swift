//
//  PropertyNames.swift
//  FindTheFilm
//
//  Created by Michael Sidoruk on 26/05/2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import Foundation

extension Film: PropertyNames {
    
}

protocol PropertyNames {
    func propertyNames() -> [String]
}

extension PropertyNames {
    func propertyNames() -> [String] {
        return Mirror(reflecting: self).children.compactMap { $0.label }
    }
}
