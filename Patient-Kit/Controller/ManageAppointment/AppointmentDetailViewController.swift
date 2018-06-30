//
//  AppointmentDetailViewController.swift
//  Patient-Kit
//
//  Created by zcrome on 5/21/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AppointmentDetailViewController: UIViewController {

	
    @IBOutlet weak var doctorImageView: UIImageView!
    @IBOutlet weak var doctorNameLabel: UILabel!
    @IBOutlet weak var doctorProfessionLabel: UILabel!
    @IBOutlet weak var scheduledDateLabel: UILabel!
    @IBOutlet weak var scheduledTimeLabel: UILabel!
    @IBOutlet weak var cancelAppointmentButton: UIButton!
	
    var appointment: Appointment? {
        didSet {
            
        }
    }
	
    override func viewDidLoad() {
        super.viewDidLoad()

        cancelAppointmentButton.backgroundColor = UIColor.red
        cancelAppointmentButton.layer.cornerRadius = cancelAppointmentButton.bounds.height / 2
			
        self.view.backgroundColor = AppColor.smoke
        updateValues()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		let label = UILabel(frame: CGRect(x:0, y:0, width:100 , height:50))
		label.backgroundColor = .clear
		label.numberOfLines = 2
		label.font = UIFont(name: "Poppins-SemiBold", size: 15)
		label.textAlignment = .center
		label.textColor = .white
		label.text = "Appointment's Detail"
		self.navigationItem.titleView = label
	}
    @IBAction func cancelAction(_ sender: UIButton) {
        if let currentAppointment = appointment {
            Alamofire.request("\(HealthUpcAPI.deleteAppointment)/\(currentAppointment.id)", method: .delete, parameters: nil, encoding: JSONEncoding.default)
                .responseJSON(completionHandler: { response in
                    switch response.result {
                    case .success( _):
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
    
    func updateValues() {
        if let currentAppointment = appointment {
            doctorNameLabel.text = "Dr." + currentAppointment.doctorOperationTime.doctor.firstName + currentAppointment.doctorOperationTime.doctor.lastName
            doctorProfessionLabel.text = currentAppointment.doctorOperationTime.doctor.profession
            scheduledDateLabel.text = "\(UtilDates.spanishFormat(date: UtilDates.getDate(stringDate: currentAppointment.doctorOperationTime.operationTime.start)!))"
            scheduledTimeLabel.text = "\(UtilDates.getHourMinutes(UtilDates.getDate(stringDate: currentAppointment.doctorOperationTime.operationTime.start)!))"
        }
    }
    
}
