// 7-2 Swift类型转换
// https://www.imooc.com/video/12668

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

//let item0 = library[0] as? Movie // Movie
//let item1 = library[1] as? Movie // nil
//let item2 = library[2] as! Game // Game
//let item3 = library[3] as! Game // error: Execution was interrupted, reason: signal SIGABRT.

for mediaItem in library {
    if let movie = mediaItem as? Movie {
        print("Movie:", movie.name, "Genre:", movie.genre)
    }
    
    if let music = mediaItem as? Music {
        print("Music:", music.name, "Artist:", music.artist)
    }
    
    if let game = mediaItem as? Game {
        print("Game:", game.name, "Geveloper:", game.developer)
    }
}
//Movie: Zootopia Genre: Animation
//Music: Hello Artist: Adele
//Game: LIMBO Geveloper: Playdead
//Music: See you again Artist: Wiz Khalifa
//Game: The Bridge Geveloper: The Quantum Astrophysicists Guild
//Movie Count: 1, Music Count: 2, Game Count: 2
