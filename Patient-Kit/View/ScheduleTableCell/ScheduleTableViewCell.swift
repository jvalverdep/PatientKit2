//
//  ScheduleTableViewCell.swift
//  Patient-Kit
//
//  Created by zcrome on 5/19/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {

	@IBOutlet weak var scheduleDoctorNameLabel: UILabel!
	@IBOutlet weak var scheduleDoctorHoursLabel: UILabel!
	
    @IBOutlet weak var scheduledStackView: UIStackView!
    
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	
	
	func updateValue(from doctorWorkHour: DoctorWorkHour){
        if let fullName = doctorWorkHour.fullName {
            scheduleDoctorNameLabel.text = fullName
            scheduleDoctorHoursLabel.text = "\(UtilDates.getHourMinutes(UtilDates.getDate(stringDate: doctorWorkHour.start)!)) - \(UtilDates.getHourMinutes(UtilDates.getDate(stringDate: doctorWorkHour.end)!))"
        }
		
	}
}
