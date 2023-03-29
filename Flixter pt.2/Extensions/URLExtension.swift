//
//  URLExtension.swift
//  Flixter pt.2
//
//  Created by Derrick on 3/28/23.
//

import Foundation

extension URL {
    static func movieURL() -> URL? {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=6218d5f3793b2caaedd87510695f6dba&language=en-US&page=1")
        else {
            return nil
        }
        return url
    }
}
