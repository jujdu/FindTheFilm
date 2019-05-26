//
//  Recording.swift
//  FindTheFilm
//
//  Created by Michael Sidoruk on 19/05/2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import Foundation

struct Search: Codable {
    let title: String
    let poster: String
    let year: String
    let imdbID: String
    
    enum CodingKeys: String, CodingKey {
        
        case title = "Title"
        case poster = "Poster"
        case year = "Year"
        case imdbID = "imdbID"
    }
}
