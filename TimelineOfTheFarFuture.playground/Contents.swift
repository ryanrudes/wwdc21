/*
| filename       |  credits
|----------------|-----------------------------
| planet.png     | Planet icon by Icons8
| earth.png      | Earth Planet icon by Icons8
| dna.png        | DNA Helix icon by Icons8
| atom.png       | Physics icon by Icons8
| pi.png         | Pi icon by Icons8
| technology.png | Wearable Technology icon by Icons8
| person.png     | Person icon by Icons8

Information source:
https://en.wikipedia.org/wiki/Timeline_of_the_far_future
 
Background music source (Public Domain Creative Commons):
https://www.youtube.com/watch?v=wJ98LoSWH-s
*/

import PlaygroundSupport
import AVFoundation
import SwiftUI

var music: AVAudioPlayer!

func play() {
    if let musicURL = Bundle.main.url(forResource: "Exoplanet", withExtension: "mp3") {
        if let audioPlayer = try? AVAudioPlayer(contentsOf: musicURL) {
            music = audioPlayer
            music.numberOfLoops = -1
            music.volume = 0.4
            music.play()
        }
    }
}

play()
PlaygroundPage.current.setLiveView(ContentView()
                                    .frame(width: 500, height: 800))
