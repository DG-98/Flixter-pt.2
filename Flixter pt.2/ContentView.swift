//
//  ContentView.swift
//  Flixter Pt.1
//
//  Created by Derrick on 3/22/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var movieVM = MovieViewModel()
    var body: some View {
        NavigationView {
            List{
                ForEach(movieVM.movie.indices, id: \.self) {index in
                    NavigationLink(destination: DetailView(movie: movieVM.movie[index])) {
                        HStack {
                            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w185\(movieVM.movie[index].poster_path)")) {image in
                                image
                                    .resizable()
                            } placeholder: {
                                Color.gray
                            }
                                .frame(width: 100, height: 150, alignment: .trailing)
                            VStack {
                                Text(movieVM.movie[index].title)
                                    .font(.headline)
                                    .frame(alignment: .leading)
                                Text(movieVM.movie[index].overview.prefix(80) + "...")
                                    .font(.subheadline)
                                    .frame(alignment: .trailing)

                                }
                            }
                        }
                }
            }
            .navigationTitle("Movies")
            .navigationBarTitleDisplayMode(.inline)
            .padding()
            .onAppear{
                self.movieVM.fetchMovie()
            }
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

