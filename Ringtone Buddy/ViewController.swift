import UIKit
import AVFoundation

class ViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    private var audioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) {
            (granted, error) in
            if granted {
                print("yes")
            } else {
                print("No")
            }
        }
        
        UNUserNotificationCenter.current().delegate = self
        
        // 1
        let content = UNMutableNotificationContent()
        content.title = "Notification Tutorial"
        content.subtitle = "from ioscreator.com"
        content.body = " Notification triggered"
//        content.sound = UNNotificationSound.default
        
//        content.sound = UNNotificationSound(named:UNNotificationSoundName(rawValue: "notification.wav"))

        // 3
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        let request = UNNotificationRequest(identifier: "notification.id.01", content: content, trigger: trigger)
        
        // 4
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        print("willPresent??")
    }
}
