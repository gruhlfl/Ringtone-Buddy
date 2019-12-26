import UIKit
import AVFoundation

class ViewController: UIViewController {
    
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
        
        // 1
        let content = UNMutableNotificationContent()
        content.title = "Notification Tutorial"
        content.subtitle = "from ioscreator.com"
        content.body = " Notification triggered"
        content.sound = UNNotificationSound.default
        
        content.sound = UNNotificationSound(named:UNNotificationSoundName(rawValue: "notification.wav"))


//        // 2
//        let imageName = "applelogo"
//        guard let imageURL = Bundle.main.url(forResource: imageName, withExtension: "png") else { return }
//
//        let attachment = try! UNNotificationAttachment(identifier: imageName, url: imageURL, options: .none)
//
//        content.attachments = [attachment]
        
        // 3
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest(identifier: "notification.id.01", content: content, trigger: trigger)
        
        // 4
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
//        let content = UNMutableNotificationContent()
//        content.title = "Notification Tutorial"
//        content.subtitle = "from ioscreator.com"
//        content.body = " Notification triggered"
//        //Default sound
//        content.sound = UNNotificationSound.default
//        //Play custom sound
//        content.sound = UNNotificationSound.init(named:UNNotificationSoundName(rawValue: "notification.caf"))
//
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
//        let identifier = "Reminder-\(Date())"
//        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
//        let center = UNUserNotificationCenter.current()
//        center.add(request, withCompletionHandler: { (error) in
//            if error != nil {
//                print("local notification created successfully.")
//            }
//        })
        
//        let content = UNMutableNotificationContent()
//        content.title = NSString.localizedUserNotificationString(forKey: "Wake up!", arguments: nil)
//        content.body = NSString.localizedUserNotificationString(forKey: "Rise and shine! It's morning time!",
//                                                                arguments: nil)
//
//        // Configure the trigger for a 7am wakeup.
//        var dateInfo = DateComponents()
//        dateInfo.hour = 13
//        dateInfo.minute = 31
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateInfo, repeats: false)
//
//        // Create the request object.
//        let request = UNNotificationRequest(identifier: "MorningAlarm", content: content, trigger: trigger)
        
//        let soundsDirectoryURL = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first!.appendingPathComponent("Sounds")
//
//        //attempt to create the folder
//        do {
//            try FileManager.default.createDirectory(atPath: soundsDirectoryURL.path,
//                                            withIntermediateDirectories: true, attributes: nil)
//        } catch let error as NSError {
//            print("Error: \(error.localizedDescription)")
//        }

//        let path = Bundle.main.path(forResource: "notification.caf", ofType: nil)!
//        let url = URL(fileURLWithPath: path)
//
//        do {
//            //create your audioPlayer in your parent class as a property
//            audioPlayer = try AVAudioPlayer(contentsOf: url)
//            audioPlayer?.play()
//        } catch {
//            print("couldn't load the file")
//        }
    }
}
