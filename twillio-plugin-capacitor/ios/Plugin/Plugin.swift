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
        print("we got here")
        guard let roomName = call.options["roomName"] as? String else {
            call.reject("Must provide an roomName")
            return
        }
        
        guard let token = call.options["token"] as? String else {
            call.reject("Must provide an token")
            return
        }
        var room: Room?
        var camera: CameraSource?
        var localVideoTrack: LocalVideoTrack?
        var localAudioTrack: LocalAudioTrack?
        var remoteParticipant: RemoteParticipant?
        var remoteView: VideoView?
        
//        var token: String = ""
//        var roomName: String = ""

        let connectOptions = ConnectOptions.init(token: token) { (builder) in
            
            // Use the local media that we prepared earlier.
            builder.audioTracks = localAudioTrack != nil ? [localAudioTrack!] : [LocalAudioTrack]()
            builder.videoTracks = localVideoTrack != nil ? [localVideoTrack!] : [LocalVideoTrack]()
            
            // The name of the Room where the Client will attempt to connect to. Please note that if you pass an empty
            // Room `name`, the Client will create one for you. You can get the name or sid from any connected Room.
            builder.roomName = roomName
        }
        room = TwilioVideoSDK.connect(options: connectOptions, delegate: self)
//        DispatchQueue.main.sync {
//                  self.bridge.viewController.present(room, animated: true, completion: nil)
//              }
              
              call.resolve()
    }
}

extension TwilioVideoViewController: RoomDelegate {
    func didConnect(to room: Room) {
    
    // At the moment, this example only supports rendering one Participant at a time.
    
    print("Connected to room \(room.name) as \(String(describing: room.localParticipant?.identity))")
    
//    if (room.remoteParticipants.count > 0) {
//        self.remoteParticipant = room.remoteParticipants[0]
//        self.remoteParticipant?.delegate = self
//    }
    }
}
