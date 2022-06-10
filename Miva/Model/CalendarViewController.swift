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
        lbl.text = ""
        return lbl
    }()
    
    let emotLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .systemFont(ofSize: 17, weight: .medium)
        lbl.text = "Как Вы себя чувствуете сегодня?"
        lbl.textColor = UIColor(red: 0.29, green: 0.29, blue: 0.29, alpha: 1.00)
        return lbl
    }()
    var emotDict: [String: String] = [:]
    
    var addEmotionOneButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("😃", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 60, weight: .medium)
        //btn.titleLabel?.textColor = Colors.textColor
        btn.backgroundColor = .clear
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(addEmotionAction), for: .touchUpInside)
        btn.isEnabled = true
        btn.tag = 1
        return btn
    }()
    
    var addEmotionTwoButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("😊", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 60, weight: .medium)
        //btn.titleLabel?.textColor = Colors.textColor
        btn.backgroundColor = .clear
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(addEmotionAction), for: .touchUpInside)
        btn.isEnabled = true
        btn.tag = 2
        return btn
    }()
    
    var addEmotionThreeButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("🙂", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 60, weight: .medium)
        //btn.titleLabel?.textColor = Colors.textColor
        btn.backgroundColor = .clear
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(addEmotionAction), for: .touchUpInside)
        btn.isEnabled = true
        btn.tag = 3
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.898, green: 0.843, blue: 0.808, alpha: 1)
        calendar.delegate = self
        calendar.select(calendar.today)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        calendar.frame = CGRect(x: 0,
                                y: 60,
                                width: view.frame.width,
                                height: view.frame.width)
        view.addSubview(calendar)
        view.addSubview(dateLabel)
        view.addSubview(addEmotionOneButton)
        view.addSubview(addEmotionTwoButton)
        view.addSubview(addEmotionThreeButton)
        view.addSubview(emotLabel)
        
        emotLabel.topAnchor.constraint(equalTo: calendar.bottomAnchor, constant: 15).isActive = true
        emotLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        addEmotionTwoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addEmotionTwoButton.topAnchor.constraint(equalTo: emotLabel.bottomAnchor, constant: 15).isActive = true
        addEmotionTwoButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        addEmotionTwoButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        addEmotionOneButton.rightAnchor.constraint(equalTo: addEmotionTwoButton.leftAnchor, constant: -15).isActive = true
        addEmotionOneButton.topAnchor.constraint(equalTo: emotLabel.bottomAnchor, constant: 15).isActive = true
        addEmotionOneButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        addEmotionOneButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        addEmotionThreeButton.leftAnchor.constraint(equalTo: addEmotionTwoButton.rightAnchor, constant: 15).isActive = true
        addEmotionThreeButton.topAnchor.constraint(equalTo: emotLabel.bottomAnchor, constant: 15).isActive = true
        addEmotionThreeButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        addEmotionThreeButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        dateLabel.topAnchor.constraint(equalTo: addEmotionTwoButton.bottomAnchor, constant: 30).isActive = true
        dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM"
        let str = formatter.string(from: date)
        print(str)
        if emotDict[str] != nil {
            dateLabel.text = emotDict[str]
        } else  { dateLabel.text = "" }
//        switch str {
//        case "07-06" :
//            dateLabel.text = "😃"
//        case "08-06" :
//            dateLabel.text = "😊"
//        case "09-06":
//            dateLabel.text = "🙂"
//        case "10-06":
//            dateLabel.text = "🙂"
//        default:
//            dateLabel.text = ""
//        }
    }
}

extension CalendarViewController {
    
    @objc func addEmotionAction(sender: UIButton!) {
        print(sender.tag)
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM"
        let str = formatter.string(from: calendar.selectedDate!)
        switch sender.tag {
            
        case 1:
            if !emotDict.keys.contains(str) {
                emotDict[str] = "😃"
                dateLabel.text = "😃"
            } else {
                emotDict.updateValue("😃", forKey: str)
                dateLabel.text = "😃"
            }
            
        case 2:
            if !emotDict.keys.contains(str) {
                emotDict[str] = "😊"
                dateLabel.text = "😊"
            }else {
                emotDict.updateValue("😊", forKey: str)
                dateLabel.text = "😊"
            }
            
        case 3:
            if !emotDict.keys.contains(str) {
                emotDict[str] = "🙂"
                dateLabel.text = "🙂"
            }else {
                emotDict.updateValue("🙂", forKey: str)
                dateLabel.text = "🙂"
            }
            
        default:
            return
        }
    }
}
