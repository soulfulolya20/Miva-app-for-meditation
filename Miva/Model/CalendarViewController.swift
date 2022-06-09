//
//  CalendarViewController.swift
//  Miva
//
//  Created by Admin on 5/5/22.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController, FSCalendarDelegate {

    
    var calendar = FSCalendar()
    let dateLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .systemFont(ofSize: 60, weight: .medium)
        lbl.text = "🙂"
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.898, green: 0.843, blue: 0.808, alpha: 1)
        calendar.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        calendar.frame = CGRect(x: 0,
                                y: 60,
                                width: view.frame.width,
                                height: view.frame.width)
        view.addSubview(calendar)
        view.addSubview(dateLabel)
        
        dateLabel.topAnchor.constraint(equalTo: calendar.bottomAnchor, constant: 50).isActive = true
        dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM"
        let str = formatter.string(from: date)
        print(str)
        switch str {
        case "07-06" :
            dateLabel.text = "😃"
        case "08-06" :
            dateLabel.text = "😊"
        case "09-06":
            dateLabel.text = "🙂"
        case "10-06":
            dateLabel.text = "🙂"
        default:
            dateLabel.text = ""
        }
    }
}
