//
//  MyAppointmentsViewController.swift
//  Patient-Kit
//
//  Created by zcrome on 5/21/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MyAppointmentsViewController: UIViewController {
    var currentIndex = 0
	@IBOutlet weak var appointmentsTableView: UITableView!
	
	var appointments = [Appointment]()
	
    override func viewDidLoad() {
        super.viewDidLoad()

      appointmentsTableView.register(UINib(nibName: "AppointmentTableViewCell", bundle: nil), forCellReuseIdentifier: "AppointmentTableViewCell")
			self.navigationController?.navigationBar.tintColor = UIColor.white;
			appointmentsTableView.separatorStyle = .singleLine
			
    }

	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		let label = UILabel(frame: CGRect(x:0, y:0, width:100 , height:50))
		label.backgroundColor = .clear
		label.numberOfLines = 2
		label.font = UIFont(name: "Poppins-SemiBold", size: 15)
		label.textAlignment = .center
		label.textColor = .white
		label.text = "My Appointments"
		self.navigationItem.titleView = label
		self.navigationController?.navigationBar.barTintColor = AppColor.darkPurple
        
        getAppointments()
        
	}
	
	@IBAction func addApointmentAction(_ sender: Any) {
		
	}
	
//    override func performSegue(withIdentifier identifier: String, sender: Any?) {
//        if identifier == "goToDetail"{
//            if let appointmentDetailVC = storyboard?.instantiateViewController(withIdentifier: "appointment_detail") as? AppointmentDetailViewController{
//                self.navigationController?.pushViewController(appointmentDetailVC, animated: true)
//                appointmentDetailVC.appointment = appointments[currentIndex]
//            }
//        }
//    }
	
	func getAppointments() {
		Alamofire.request(HealthUpcAPI.getAppointments + "/1", method: .get, parameters: nil).responseJSON(completionHandler: { response in
			switch response.result {
			case .success(let value):
				let json = JSON(value)
				if let appointments = json["appointments"].array{
					self.appointments = Appointment.from(jsonAppointments: appointments)
					self.appointmentsTableView.reloadData()
				}
			case .failure(let error):
				print(error)
			}
		})
	}
    
    
}



extension MyAppointmentsViewController: UITableViewDelegate{
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
		return 65
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
		currentIndex = indexPath.row
		self.performSegue(withIdentifier: "goToDetail", sender: self)
		
		
	}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetail" {
            let destination = segue.destination as! AppointmentDetailViewController
            destination.appointment = appointments[currentIndex]
        }
    }
	
}


extension MyAppointmentsViewController: UITableViewDataSource{
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return appointments.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "AppointmentTableViewCell") as! AppointmentTableViewCell
        
		cell.selectionStyle = .none
        cell.updateValue(from: appointments[indexPath.row])
		
		return cell
	}
	
	
}








