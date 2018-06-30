//
//  UtilDates.swift
//  Patient-Kit
//
//  Created by zcrome on 5/26/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation


class UtilDates{
	
	static func getDate(stringDate: String) -> Date? {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
		dateFormatter.timeZone = NSTimeZone.local
		return dateFormatter.date(from: stringDate)
	}
	
	static func getHourMinutes(_ date: Date) -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "HH:mm"
		dateFormatter.timeZone = NSTimeZone.local
		return dateFormatter.string(from: date)
	}
	
	static func spanishFormat(date: Date) -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "dd-MM-yyyy"
		dateFormatter.timeZone = NSTimeZone.local
		return dateFormatter.string(from: date).replacingOccurrences(of: "-", with: "/")
	}
	
}



//
// extension Date {
//
//	enum Timestamp {
//		case years
//		case months
//		case weeks
//		case days
//		case hours
//		case minutes
//		case seconds
//	}
//
//
//	func zFrom(year: Int, month: Int, day: Int) -> Date {
//		let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian)!
//		var dateComponents = DateComponents()
//		dateComponents.year = year
//		dateComponents.month = month
//		dateComponents.day = day
//		let date = gregorianCalendar.date(from: dateComponents)!
//		return date
//	}
//
//	func zEnglishFormat() -> String {
//		let dateFormatter = DateFormatter()
//		dateFormatter.timeZone = NSTimeZone.local
//		dateFormatter.dateFormat = "yyyy-MM-dd"
//		return dateFormatter.string(from: self)
//	}
//
//	func zGetHourMinutes(_ date: Date) -> String {
//		let dateFormatter = DateFormatter()
//		dateFormatter.dateFormat = "HH:mm"
//		dateFormatter.timeZone = NSTimeZone.local
//		return dateFormatter.string(from: date)
//	}
//
//	func zSpanishFormat() -> String {
//		let dateFormatter = DateFormatter()
//		dateFormatter.dateFormat = "dd-MM-yyyy"
//		dateFormatter.timeZone = NSTimeZone.local
//		return dateFormatter.string(from: self)
//	}
//
//	func zDayAndMonth() -> String {
//		let dateFormatter = DateFormatter()
//		dateFormatter.dateFormat = "dd MMMM"
//		dateFormatter.timeZone = NSTimeZone.local
//		return dateFormatter.string(from: self)
//	}
//
//	func zAaddDays(daysToAdd: Int) -> Date {
//		let secondsInDays: TimeInterval = Double(daysToAdd) * 60 * 60 * 24
//		let dateWithDaysAdded: Date = self.addingTimeInterval(secondsInDays)
//		return dateWithDaysAdded
//	}
//
//	func zAddHours(hoursToAdd: Int) -> Date {
//		let secondsInHours: TimeInterval = Double(hoursToAdd) * 60 * 60
//		let dateWithHoursAdded: Date = self.addingTimeInterval(secondsInHours)
//		return dateWithHoursAdded
//	}
//
//	func zYear() -> Int {
//		return Calendar.current.dateComponents([.year], from: self, to: self).year ?? 0
//	}
//
//	func zMonth() -> Int {
//		return Calendar.current.dateComponents([.month], from: self, to: self).month ?? 0
//	}
//
//	func zWeek() -> Int {
//		return Calendar.current.dateComponents([.weekOfMonth], from: self, to: self).weekOfMonth ?? 0
//	}
//
//	func zDaysCount() -> Int {
//		return Calendar.current.dateComponents([.day], from: self, to: self).day ?? 0
//	}
//
//	func zHoursCount() -> Int {
//		return Calendar.current.dateComponents([.hour], from: self, to: self).hour ?? 0
//	}
//
//	func zMinutesCount() -> Int {
//		return Calendar.current.dateComponents([.minute], from: self, to: self).minute ?? 0
//	}
//
//	func zSecondsCount() -> Int {
//		return Calendar.current.dateComponents([.second], from: self, to: self).second ?? 0
//	}
//
//	fileprivate func zagoIn(_ timestamp: Timestamp) -> String{
//		if timestamp == .years{
//			if self.zYear() == 1{
//				return "hace un año atrás"
//			}else{
//				return "hace \(self.zYear()) años atrás"
//			}
//		}
//
//		if timestamp == .months{
//			if self.zMonth() == 1{
//				return "hace un mes atrás"
//			}else{
//				return "hace \(self.zMonth()) meses atrás"
//			}
//		}
//
//		if timestamp == .weeks{
//			if self.zWeek() == 1{
//				return "hace una semana"
//			}else{
//				return "hace \(self.zWeek()) semanas"
//			}
//		}
//
//		if timestamp == .days{
//			if self.zDaysCount() == 1{
//				return "hace un día"
//			}else{
//				return "hace \(self.zDaysCount()) horas"
//			}
//		}
//
//		if timestamp == .hours{
//			if self.zHoursCount() == 1{
//				return "hace una hora"
//			}else{
//				return "hace \(self.zHoursCount()) horas"
//			}
//		}
//
//		if timestamp == .minutes{
//			if self.zMinutesCount() == 1{
//				return "hace un minuto"
//			}else{
//				return "hace \(self.zMinutesCount()) minutos"
//			}
//		}
//
//		if timestamp == .seconds && self.zSecondsCount() > 0{
//			return "hace unos segundos"
//		}
//
//		return ""
//	}
//
//	func zAgoTimestamp()->String{
//		if self.zSecondsCount() > 60{
//			if self.zMinutesCount() == 1{
//				return "hace un minuto"
//			}else if self.zMinutesCount() < 60 {
//				return "hace \(self.zMinutesCount()) minutos"
//			}else{
//				if self.zHoursCount() == 1{
//					return "hace una hora"
//				}else if self.zHoursCount() < 24 {
//					return "hace \(self.zHoursCount()) horas"
//				}else{
//					if self.zDaysCount() == 1{
//						return "hace un día"
//					}else if self.zDaysCount() < 7{
//						return "hace \(self.zDaysCount()) días"
//					}else{
//						if self.zWeek() == 1{
//							return "hace una semana"
//						}else if self.zWeek() < 4{
//							return "hace \(self.zWeek()) semanas"
//						}else{
//							if self.zMonth() == 1{
//								return "hace un mes atrás"
//							}else if self.zMonth() < 12 {
//								return "hace \(self.zMonth()) meses atrás"
//							}else{
//								if self.zYear() == 1{
//									return "hace un año atrás"
//								}else{
//									return "hace \(self.zYear()) años atrás"
//								}
//							}
//						}
//					}
//				}
//			}
//		}else{
//			return "hace unos segundos"
//		}
//	}
//
//
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
