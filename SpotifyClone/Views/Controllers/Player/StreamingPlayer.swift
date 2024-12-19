

import Foundation
import MediaPlayer

class StreamingPlayer {
    
    var avPlayer: AVPlayer!
    
    init(){
        avPlayer = AVPlayer()
    }
    
    func playStream(fileURL: String){
        
        let url = NSURL(string: fileURL)
        
        avPlayer = AVPlayer(url: url! as URL)
        
        avPlayer.play()
        print("Play Streaming")
        setPlayerScreen(fileURL);
        
    }
    
    func playAudio(){
        if(avPlayer.rate == 0 && avPlayer.error == nil){
            avPlayer.play()
        }
    }
    
    func pauseAudio() {
        
        if(avPlayer.rate > 0 && avPlayer.error == nil){
            avPlayer.pause()
        }
    }
    
    func setPlayerScreen(_ url: String){
        
        let songName = url.split(separator: "/")
        
        let title: String =  String(songName.last ?? "Default Name")
        
        let songInfo = [
            MPMediaItemPropertyTitle: "\(title)",
            MPMediaItemPropertyArtist: "\(title)"
        ];
        
        MPNowPlayingInfoCenter.default().nowPlayingInfo = songInfo
        
        
    }
}
