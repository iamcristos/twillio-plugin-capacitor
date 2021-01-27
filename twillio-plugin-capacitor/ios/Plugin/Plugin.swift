import Foundation
import Capacitor
import TwilioVideo

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(TwilioVideoViewController)
public class TwilioVideoViewController: CAPPlugin {

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.success([
            "value": value
        ])
    }
    
    @objc func connect(_ call: CAPPluginCall) {
        guard let roomName = call.options["roomName"] as? String else {
            call.reject("Must provide an roomName")
            return
        }
        
        guard let token = call.options["token"] as? String else {
            call.reject("Must provide an token")
            return
        }
        var room: TVIRoom?
        var camera: TVICameraSource?
        var localVideoTrack: TVILocalVideoTrack?
        var localAudioTrack: TVILocalAudioTrack?
        var remoteParticipant: TVIRemoteParticipant?
        var remoteView: TVIVideoView?
        
//        var token: String = ""
//        var roomName: String = ""

        let connectOptions = TVIConnectOptions.init(token: token) { (builder) in
            
            // Use the local media that we prepared earlier.
            builder.audioTracks = localAudioTrack != nil ? [localAudioTrack!] : [TVILocalAudioTrack]()
            builder.videoTracks = localVideoTrack != nil ? [localVideoTrack!] : [TVILocalVideoTrack]()
            
            // The name of the Room where the Client will attempt to connect to. Please note that if you pass an empty
            // Room `name`, the Client will create one for you. You can get the name or sid from any connected Room.
            builder.roomName = roomName
        }
       room = TwilioVideo.connect(with: connectOptions, delegate: self)
//        DispatchQueue.main.sync {
//                  self.bridge.viewController.present(room, animated: true, completion: nil)
//              }
              
              call.resolve()
    }
}
