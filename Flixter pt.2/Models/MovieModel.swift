//
//  MovieModel.swift
//  Flixter pt.2
//
//  Created by Derrick on 3/28/23.
//

import Foundation

struct MovieModel: Decodable {
    let main : Movie
}

struct Movie : Decodable {
    let backdrop_path : String
    let overview : String
    let popularity : Double
    let poster_path : String
    let title : String
    let vote_average: Double
    let vote_count : Double
}

