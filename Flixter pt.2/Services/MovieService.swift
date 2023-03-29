//
//  MovieService.swift
//  Flixter pt.2
//
//  Created by Derrick on 3/28/23.
//

import Foundation

enum NetworkError : Error {
    case BadURL
    case NoData
    case DecodingError
}

struct getMovie {
    
    func getMovie(completion : @escaping(Result<Movie?, NetworkError>) -> Void){
        
        guard let url = URL.movieURL() else {
            return completion(.failure(.BadURL))
        }
        URLSession.shared.dataTask(with : url) {data, response, error in
            guard let data = data, error == nil
            else {
                return completion(.failure(.NoData))
                // continue from here
            }
            
        }
    }
}


