//
//  RecordingResult.swift
//  FindTheFilm
//
//  Created by Michael Sidoruk on 19/05/2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import Foundation

struct RecordingsResult {
    let recordings: [Search]?
    let error: Error?
    let currentPage: Int
    let pageCount: Int
    
    var hasMorePages: Bool {
        return currentPage < pageCount
    }
    
    var nextPage: Int {
        return hasMorePages ? currentPage + 1 : currentPage
    }
    
}
