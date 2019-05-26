//
//  NetworkingService.swift
//  FindTheFilm
//
//  Created by Michael Sidoruk on 19/05/2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
}

class NetworkingService {
    
    let endpoint = "http://www.omdbapi.com/"
    
    var task: URLSessionTask?
    
    //fetch films
    
    func fetchSearchRecordings(matching query: String?, page: Int, onCompletion: @escaping (RecordingsResult) -> Void) {
        
        func fireErrorCompletion(_ error: Error?) {
            onCompletion(RecordingsResult(recordings: nil, error: error,
                                          currentPage: 0, pageCount: 0))
        }
        
        var queryOrEmpty = "queryExample"// "initiateValue"
        
        if let query = query, !query.isEmpty {
            queryOrEmpty = query
        }
        
        var components = URLComponents(string: endpoint)
        components?.queryItems = [
                                  URLQueryItem(name: "s", value: queryOrEmpty),
                                  URLQueryItem(name: "type", value: "movie"),
                                  URLQueryItem(name: "apikey", value: "eae75c46"),
                                  URLQueryItem(name: "page", value: String(page)),
        ]

        
        guard let url = components?.url else {
            fireErrorCompletion(NetworkError.invalidURL)
            return
        }
        
        task?.cancel()
        
        task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            DispatchQueue.main.async {
                
                if let error = error {
                    guard (error as NSError).code != NSURLErrorCancelled else {
                        return
                    }
                    fireErrorCompletion(error)
                    return
                }
                
                guard let data = data else {
                    fireErrorCompletion(error)
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(ServiceResponse.self, from: data)
                    
                    onCompletion(RecordingsResult(recordings: Array(result.search),
                                                  error: nil,
                                                  currentPage: page,
                                                  pageCount: Int(result.totalResults)! / 10))
                } catch {
                    fireErrorCompletion(error)
                }
            }
        }
        
        task?.resume()
    }
    
    
     //fetch film
    func fetchFilmRecording(matching query: String, onCompletion: @escaping (FilmRecordingsResult) -> Void) {
        
        func fireErrorCompletion(_ error: Error?) {
            onCompletion(FilmRecordingsResult(recordings: nil, error: error))
        }
        
        var components = URLComponents(string: endpoint)
        components?.queryItems = [
            URLQueryItem(name: "i", value: query),
            URLQueryItem(name: "apikey", value: "eae75c46"),
        ]
        //        print(components?.url?.absoluteString)
        
        
        guard let url = components?.url else {
            fireErrorCompletion(NetworkError.invalidURL)
            return
        }
        
        task?.cancel()
        
        task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            DispatchQueue.main.async {
                
                if let error = error {
                    guard (error as NSError).code != NSURLErrorCancelled else {
                        return
                    }
                    fireErrorCompletion(error)
                    return
                }
                
                guard let data = data else {
                    fireErrorCompletion(error)
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(Film.self, from: data)
                    
                    onCompletion(FilmRecordingsResult(recordings: result, error: nil))
                } catch {
                    fireErrorCompletion(error)
                }
            }
        }
        
        task?.resume()
    }
    
}
