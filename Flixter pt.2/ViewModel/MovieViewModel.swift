//
//  MovieViewModel.swift
//  Flixter pt.2
//
//  Created by Derrick on 3/29/23.
//

import Foundation

class MovieViewModel : ObservableObject {
    @Published private var movie : [Movie]? = [] 
    
    func fetchMovie() {
        MovieService().getMovie{ result in
            switch result {
            case .success(let movie):
                DispatchQueue.main.async {
                    self.movie = movie
                }
            case.failure(_ ):
                print("Error")
            }
        }
    }
}
