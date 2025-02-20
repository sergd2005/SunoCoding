//
//  SongCardView.swift
//  SunoCoding
//
//  Created by Sergii D on 2/20/25.
//

import SwiftUI

struct SongCardView: View {
    let song: Song
    var body: some View {
        ZStack {
            if let url = URL(string: song.imageURL) {
                AsyncImage(url: url) { image in
                    VStack(spacing: .zero) {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .rotationEffect(.degrees(180))
                            
                    }
                    
                } placeholder: {
                    ProgressView()
                }
            }
            VStack {
                Text(song.displayName)
                    .background(.gray.opacity(0.5))
                Spacer()
            }
        }
    }
}

#Preview {
    SongCardView(song: Song(displayName: "🎐Nanashi_Zero🎐[YouTube💤BiliBili]",
                            imageURL: "https://cdn1.suno.ai/ffa48fbf-ac87-4a02-8cf2-f3766f518d58_c134aeb8.png"))
}
