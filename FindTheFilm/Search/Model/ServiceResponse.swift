//
//  ServiceResponse.swift
//  FindTheFilm
//
//  Created by Michael Sidoruk on 19/05/2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import Foundation

struct ServiceResponse: Codable {
    var search: [Search]
    var totalResults: String
    
    enum CodingKeys : String, CodingKey {
        case search = "Search"
        case totalResults = "totalResults"
    }
}
