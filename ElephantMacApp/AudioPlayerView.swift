//
//  AudioPlayerView.swift
//  Elephant
//
//  Created by 陸卉媫 on 5/21/25.
//
// source: https://www.kodeco.com/books/swiftui-cookbook/v1.0/chapters/1-create-an-audio-player-in-swiftui

import AVFoundation

class AudioPlayerView: ObservableObject {
    var audioPlayer: AVAudioPlayer?

    @Published var isPlaying = false
    
}
