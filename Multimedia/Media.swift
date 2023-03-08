//
//  Media.swift
//  Multimedia
//
//  Created by Aleksandr Derevyanko on 08.03.2023.
//

struct Tracks {
    var trackName: String
    var trackType: String
    init(trackName: String, trackType: String = ".mp3") {
        self.trackName = trackName
        self.trackType = trackType
    }
}

struct Videos {
    var videoName: String
    var videoLink: String
}

 var tracks: [Tracks] = [
    Tracks(trackName: "1"),
    Tracks(trackName: "2"),
    Tracks(trackName: "3"),
    Tracks(trackName: "4"),
    Tracks(trackName: "5")
]

var videos: [Videos] = [
    Videos(videoName: "Япония, которая взрывает мозг", videoLink: "https://youtu.be/Gb0TQ7VeApY"),
    Videos(videoName: "Австралия, которую вы не знаете", videoLink: "https://youtu.be/tVTT95C8J4o"),
    Videos(videoName: "Норвегия. Богатая и очень красивая", videoLink: "https://youtu.be/zyZAMR56mXY")
]
