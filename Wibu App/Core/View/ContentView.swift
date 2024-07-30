//
//  ContentView.swift
//  Wibu App
//
//  Created by irfan wahendra on 18/07/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var animeVM = AnimeListViewModel()
    let columns: [GridItem] = [GridItem(.adaptive(minimum: 100), spacing: 10)]
    
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVGrid(columns: columns, spacing: 10){
                    ForEach (animeVM.animeList){ animes in
                        let url = URL(string: animes.img)
                        Group {
                            VStack(alignment: .leading){
                                AsyncImage(url: url) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView()
                                        
                                    case .success(let img):
                                        img.resizable().scaledToFill()
                                        
                                    case .failure(let error):
                                        VStack{
                                            Image(systemName: "photo.fill")
                                            Text("Error loading image: \(error.localizedDescription)")
                                        }
                                    @unknown default:
                                        fatalError()
                                    }
                                }
                                .frame(width: 100, height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                Text(animes.name)
                                    .font(.system(.headline, design: .rounded, weight: .bold))
                                    .lineLimit(1, reservesSpace: true)
                                    .multilineTextAlignment(.leading)
                                Text(animes.anime)
                                    .font(.system(.caption, design: .rounded))
                                    .lineLimit(1)
                            }
                        }
                        .contextMenu{
                            Button{
                                
                            } label :{
                                Label("share", systemImage: "square.and.arrow.up")
                            }
                        }
                    }
                }
                .padding()
            }
            .task {
                await animeVM.fetchAnime()
            }
        }
    }
}

#Preview {
    ContentView()
}
