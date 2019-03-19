// 7-1 Swift类型检查
// https://www.imooc.com/video/12667

import UIKit

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var genre: String
    
    init(name: String, genre: String) {
        self.genre = genre
        super.init(name: name)
    }
}

class Music: MediaItem {
    var artist: String
    
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

class Game: MediaItem {
    var developer: String
    
    init(name: String, developer: String) {
        self.developer = developer
        super.init(name: name)
    }
}

let library: [MediaItem] = [
    Movie(name: "Zootopia", genre: "Animation"),
    Music(name: "Hello", artist: "Adele"),
    Game(name: "LIMBO", developer: "Playdead"),
    Music(name: "See you again", artist: "Wiz Khalifa"),
    Game(name: "The Bridge", developer: "The Quantum Astrophysicists Guild")
]

var musicCount = 0
var movieCount = 0
var gameCount = 0
for mediaItem in library {
    if mediaItem is Movie {
        movieCount += 1
    }
    
    if mediaItem is Music {
        musicCount += 1
    }
    
    if mediaItem is Game {
        gameCount += 1
    }
}
print("Movie Count: \(movieCount), Music Count: \(musicCount), Game Count: \(gameCount)")
// Movie Count: 1, Music Count: 2, Game Count: 2
