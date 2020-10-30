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
    let playerVars = ["playsinline":1]
    let playerView = YTPlayerView()
    func makeCoordinator() -> Coordinator {
        Coordinator(playerView)
    }
    
    func makeUIView(context: Context) -> YTPlayerView {
        playerView.delegate = context.coordinator
        playerView.load(withVideoId: videoId, playerVars: playerVars)
       return playerView
    }
    func updateUIView(_ playerView: YTPlayerView, context: Context) {
        DispatchQueue.main.async {
            if action == "Play"{
                playerView.playVideo()
            }else if action == "Pause"{
                playerView.pauseVideo()
            }
        }
    }
    class Coordinator : NSObject, YTPlayerViewDelegate {
        var parent: YTPlayerView
        var valueSubscriber: AnyCancellable? = nil
        init(_ playerView:YTPlayerView) {
           parent = playerView
        }
        deinit {
            valueSubscriber?.cancel()
        }
        func playerView(_ playerView: YTPlayerView, didChangeTo state: YTPlayerState) {
            print(state)
            switch state {
            case .playing:
                print("playing")
            default:
                print("default")
            }
        }
    }
}
