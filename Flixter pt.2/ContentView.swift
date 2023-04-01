//
//  ContentView.swift
//  Flixter Pt.2
//
//  Created by Derrick on 3/30/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var movieVM = MovieViewModel()
    var body: some View {
            TabView {
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
                                    VStack(alignment: .leading) {
                                        Text(movieVM.movie[index].title)
                                            .font(.headline)
                                            .frame(alignment: .leading)
//                                            .foregroundColor(.white)
                                        Text(movieVM.movie[index].overview.prefix(80) + "...")
                                            .font(.subheadline)
                                            .frame(alignment: .trailing)
//                                            .foregroundColor(.white)
                                        
                                    }
//                                    .background(.black).ignoresSafeArea()
                                }
//                                .background(.black)
                            
                            }
                        }
                    } // end of list view
                    .listStyle(.plain)
//                    .background(.black)
                    .navigationTitle("Movies")
                    .navigationBarTitleDisplayMode(.inline)
                    .onAppear{
                        self.movieVM.fetchMovie()
                    }
                } // end of 1st nav view
                .tabItem {
                    Label("Now Playing", systemImage: "film")
                }
                .preferredColorScheme(.dark)
                
                NavigationView {
                    var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()),GridItem(.flexible())]
                    ScrollView {
                        LazyVGrid(columns: threeColumnGrid) {
                            ForEach(movieVM.movie.indices, id: \.self) {index in
                                NavigationLink(destination: DetailView(movie: movieVM.movie[index])) {
                                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w185\(movieVM.movie[index].poster_path)")) {image in
                                        image
                                            .resizable()
                                    } placeholder: {
                                        Color.gray
                                    }
                                    .frame(width: 100, height: 150, alignment: .trailing)
                                }
                            }
                        }
                        .padding(.horizontal, 25)
                        } // end of scroll view
                    .navigationTitle("Posters")
                    .navigationBarTitleDisplayMode(.inline)
                } // end of 2nd nav view
//                .preferredColorScheme(.dark)
                .tabItem {
                    Label("Posters", systemImage: "doc.richtext")
                }
            } //
        } // body
} // content view

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

