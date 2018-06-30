//
//  CreateAppointmentViewController.swift
//  Patient-Kit
//
//  Created by zcrome on 5/22/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit
import CVCalendar
import Alamofire
import SwiftyJSON

class CreateAppointmentViewController: UIViewController {
    var currentIndex = 0
	
    @IBOutlet weak var menuView: CVCalendarMenuView!
    @IBOutlet weak var calendarView: CVCalendarView!
    @IBOutlet weak var availableAppointmentsTableView: UITableView!
    
    var availableDoctorWorkHours: [DoctorWorkHour] = []
	
    override func viewDidLoad() {
        super.viewDidLoad()
        menuView.delegate = self
        calendarView.delegate = self
        menuView.backgroundColor = AppColor.lightPurple
        calendarView.backgroundColor = AppColor.lightPurple
        updateCalendarWithDoctors(withDate: "\(calendarView.presentedDate.year)-\(calendarView.presentedDate.month)-\(calendarView.presentedDate.day)")
        availableAppointmentsTableView.register(UINib(nibName: "ScheduleTableViewCell", bundle: nil)
            , forCellReuseIdentifier: "scheduleCell")
			
			availableAppointmentsTableView.separatorStyle = .none
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
        menuView.commitMenuViewUpdate()
        
        calendarView.commitCalendarViewUpdate()
        
	}
    
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		let label = UILabel(frame: CGRect(x:0, y:0, width:100 , height:50))
		label.backgroundColor = .clear
		label.numberOfLines = 2
		label.font = UIFont(name: "Poppins-SemiBold", size: 15)
		label.textAlignment = .center
		label.textColor = .white
		label.text = "New Appointment"
		self.navigationItem.titleView = label
	}
    
    func updateCalendarWithDoctors(withDate date: String) {
        let parameters = ["d": date]
        Alamofire.request(HealthUpcAPI.getDoctorsWorkHourByDay, method: .get, parameters: parameters).responseJSON(completionHandler: { response in
            switch response.result {
            case .success(let value):
                self.availableDoctorWorkHours = DoctorWorkHour.from(jsonDoctorWorkHours: JSON(value).arrayValue )
                self.availableAppointmentsTableView.reloadData()
            case .failure(let error):
                print(error)
            }
        })
    }
}


extension CreateAppointmentViewController: CVCalendarViewDelegate{
    func presentationMode() -> CalendarMode {
        return .monthView
    }

    func firstWeekday() -> Weekday {
        return Weekday.monday
    }

    func presentedDateUpdated(_ date: CVDate) {
        updateCalendarWithDoctors(withDate: "\(date.year)-\(date.month)-\(date.day)")
        availableAppointmentsTableView.reloadData()
    }

}

extension CreateAppointmentViewController: CVCalendarMenuViewDelegate{

    func dayOfWeekFont() -> UIFont{
        return UIFont(name: "Poppins-Regular", size: 12)!
    }
    
    func dayOfWeekTextColor(by weekday: Weekday) -> UIColor{
        return .white
    }

}

extension CreateAppointmentViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        currentIndex = indexPath.row
        self.performSegue(withIdentifier: "goToConfirmOrCancel", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToConfirmOrCancel" {
            let destination = segue.destination as! ConfirmOrCancelAppointmentViewController
            destination.doctorWorkHour = availableDoctorWorkHours[currentIndex]
        }
    }
}

extension CreateAppointmentViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return availableDoctorWorkHours.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell") as! ScheduleTableViewCell
        
        
        cell.selectionStyle = .none
        cell.updateValue(from: availableDoctorWorkHours[indexPath.row])
        return cell
    }
    
    
    
    
}












