//
//  ContentView.swift
//  SunoCoding
//
//  Created by Sergii D on 2/20/25.
//

import SwiftUI

final class SongsFeedViewModel: ObservableObject {
    @Published var songs: [Song]
    
    init(songs: [Song] = []) {
        self.songs = songs
    }
}

struct SongsFeedView: View {
    @ObservedObject var viewModel: SongsFeedViewModel
    let restApi = SongsRestApi()
    
    init(viewModel: SongsFeedViewModel = SongsFeedViewModel(songs: [])) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10.0) {
                ForEach(viewModel.songs) { song in
                    SongCardView(song: song)
                        
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
        .task {
            do {
                viewModel.songs = try await restApi.fetchSongsFeed(from: URL(string: "https://apitest.suno.com/api/songs")!).songs
            } catch(let error) {
                print(error)
            }
            
        }
    }
}

#Preview {
    SongsFeedView(viewModel: SongsFeedViewModel(songs: [
        Song(displayName: "🎐Nanashi_Zero🎐[YouTube💤BiliBili]",
             imageURL: "https://cdn1.suno.ai/ffa48fbf-ac87-4a02-8cf2-f3766f518d58_c134aeb8.png"),
        Song(displayName: "🎐Nanashi_Zero🎐[YouTube💤BiliBili]",
             imageURL: "https://cdn1.suno.ai/ffa48fbf-ac87-4a02-8cf2-f3766f518d58_c134aeb8.png")
    ]))
}
