//
//  ServiceResponse.swift
//  FindTheFilm
//
//  Created by Michael Sidoruk on 19/05/2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import Foundation

struct Film: Codable {
    var title: String
    var year: String
    var director: String
    var actors: String
    var plot: String
    var country: String
    var rating: String
    var poster: String
    
    enum CodingKeys : String, CodingKey {
        case title = "Title"
        case year = "Year"
        case director = "Director"
        case actors = "Actors"
        case plot = "Plot"
        case country = "Country"
        case rating = "imdbRating"
        case poster = "Poster"
    }
    
}
