//
//  AppointmentTableViewCell.swift
//  Patient-Kit
//
//  Created by zcrome on 5/21/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class AppointmentTableViewCell: UITableViewCell {

	
	@IBOutlet weak var leftDecoratorView: UIView!
	@IBOutlet weak var reasonLabel: UILabel!
	@IBOutlet weak var appointmentDateLabel: UILabel!
	@IBOutlet weak var appointmentScheduleLabel: UILabel!
	@IBOutlet weak var doctorPictureImage: UIImageView!
	
	
	
    override func awakeFromNib() {
        super.awakeFromNib()
			leftDecoratorView.backgroundColor = AppColor.darkPurple
			reasonLabel.textColor = AppColor.black
			appointmentDateLabel.textColor = AppColor.darkGray
			appointmentScheduleLabel.textColor = AppColor.darkGray
//            self.backgroundColor = AppColor.smoke
    }
	
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
	
	
	func updateValue(from appointment: Appointment){
		
//        doctorNameLabel.text = "Dr. \(appointment.doctor.firstName) \(appointment.doctor.lastName)"
        reasonLabel.text = "\(appointment.reason)"
        appointmentDateLabel.text = "\(UtilDates.spanishFormat(date: UtilDates.getDate(stringDate: appointment.doctorOperationTime.operationTime.start)!))"
        appointmentScheduleLabel.text = "\(UtilDates.getHourMinutes(UtilDates.getDate(stringDate: appointment.doctorOperationTime.operationTime.start)!))"
	}
	
}













