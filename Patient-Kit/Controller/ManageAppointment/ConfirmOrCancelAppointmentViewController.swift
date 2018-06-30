//
//  ConfirmOrCancelAppointmentViewController.swift
//  Patient-Kit
//
//  Created by Javier Valverde on 6/30/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import UserNotifications

class ConfirmOrCancelAppointmentViewController: UIViewController,UNUserNotificationCenterDelegate {

    @IBOutlet weak var doctorFullNameLabel: UILabel!
    @IBOutlet weak var doctorProfessionLabel: UILabel!
    @IBOutlet weak var doctorWorkDateLabel: UILabel!
    @IBOutlet weak var doctorWorkHourLabel: UILabel!
    
    @IBOutlet weak var reasonTextView: UITextView!
    @IBOutlet weak var confirmButton: UIButton!
    
    var doctorWorkHour: DoctorWorkHour? {
        didSet {
        
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        Gradient.applyGradientTo(View: confirmButton,
                                 withColors: [AppColor.darkPurple.cgColor, AppColor.lightPurple.cgColor],
                                 withStartPoint: CGPoint(x: 0.0, y: 0.5),
                                 andEndPoint: CGPoint(x: 1, y: 0.5))
        confirmButton.layer.cornerRadius = confirmButton.bounds.height / 2
        confirmButton.clipsToBounds = true
        updateValues()
        
       
        UNUserNotificationCenter.current().delegate = self
    }

    func updateValues() {
        if let currentDoctorWorkHour = doctorWorkHour {
            doctorFullNameLabel.text = "Dr." + currentDoctorWorkHour.fullName!
            doctorProfessionLabel.text = currentDoctorWorkHour.profession
            doctorWorkDateLabel.text = "\(UtilDates.spanishFormat(date: UtilDates.getDate(stringDate: currentDoctorWorkHour.start)!))"
            doctorWorkHourLabel.text = "\(UtilDates.getHourMinutes(UtilDates.getDate(stringDate: currentDoctorWorkHour.start)!))"
        }
    }
    @IBAction func confirmAction(_ sender: UIButton) {
        if let currentDoctorWorkHour = doctorWorkHour {
            let parameters: [String: Any] = [
                "patient_id": 1,
                "dot": currentDoctorWorkHour.doctorOperationTimeId,
                "reason": reasonTextView.text
            ]
            Alamofire.request(HealthUpcAPI.createAppointment, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON(completionHandler: { response in
                switch response.result {
                    case .success( _):
                        DispatchQueue.main.async {
                            self.sendNoti(text: "your appointment was")
                            
                        }
                        for controller in self.navigationController!.viewControllers as Array {
                            if controller.isKind(of: MyAppointmentsViewController.self) {
                                self.navigationController!.popToViewController(controller, animated: true)
                                break
                                }
                            }
                    case .failure(let error):
                        print(error)
                }
            })
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.alert, .sound])
    }
    
    func sendNoti(text: String){
        
//        let content = UNMutableNotificationContent()
//        content.title = "Patient-kit"
//        content.body = text
//        content.badge = 1
//        
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1,
//                                                        repeats: false)
//        
//        let requestIdentifier = "demoNotification"
//        let request = UNNotificationRequest(identifier: requestIdentifier,
//                                            content: content, trigger: trigger)
//        
//        UNUserNotificationCenter.current().add(request,
//                                               withCompletionHandler: { (error) in
//                                                // Handle error
//        })
    }
}
