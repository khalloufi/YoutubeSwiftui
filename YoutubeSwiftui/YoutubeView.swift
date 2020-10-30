//
//  YoutubeView.swift
//  YoutubeSwiftui
//
//  Created by issam on 30/10/2020.
//

import UIKit
import youtube_ios_player_helper
import SwiftUI
import Combine

// MARK: - YoutubeView
struct YoutubeView: UIViewRepresentable{
    var videoId: String
    @Binding var action: String
    let playerVars = ["controls":0, "playsinline":1]
    
    func makeUIView(context: Context) -> YTPlayerView {
        let playerView = YTPlayerView()
        playerView.load(withVideoId: videoId, playerVars: playerVars)
       return playerView
    }
    func updateUIView(_ playerView: YTPlayerView, context: Context) {
        print(action)
        if action == "Play"{
            playerView.playVideo()
        }else if action == "Pause"{
            playerView.pauseVideo()
        }
    }
}
