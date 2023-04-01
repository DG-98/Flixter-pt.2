//
//  DetailView.swift
//  Flixter Pt.2
//
//  Created by Derrick on 3/30/23.
//

import SwiftUI

struct DetailView: View {
    let movie: Movie
    var body: some View {
        GeometryReader { geometry in
        VStack {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w185\(movie.poster_path)")) {image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width)
            } placeholder: {
                Color.gray
            }
            Text(movie.title)
            HStack(spacing: 100) {
                VStack {
                    Text(String("\(movie.vote_average) Vote Average"))
                    Text(String("\(movie.vote_count) Votes"))
                }
                Text(String("\(movie.popularity) Popularity"))
            }
            .padding()
            Text(movie.overview)
            }
            
        }
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(movie: Movie(title:"MEG3AN", poster_path: URL(string:"https://image.tmdb.org/t/p/w185\(movie.poster_path)")!,
//                                  description: "A brilliant toy company roboticist uses artificial intelligence to develop M3GAN, a life-like doll programmed to emotionally bond with her newly orphaned niece. But when the doll's programming works too well, she becomes overprotective of her new friend with terrifying results.",
//                                  backdrop_path: URL(string:backdropBase+"/q2fY4kMXKoGv4CQf310MCxpXlRI.jpg")!,
//                                  vote_average: 7.5,
//                                  vote_count: 1822,
//                                  popularity: 1103.359))
//    }
//}

