//
//  ViewController.swift
//  Stop Watch App
//
//  Created by Anuranjan Bose on 20/03/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit




extension UITableView {
    func showTableView(_ duration: TimeInterval? = 0.6, onCompletion: (() -> Void)? = nil) {
        self.alpha = 0
        self.isHidden = false
        UITableView.animate(withDuration: duration!,
                       animations: { self.alpha = 1 },
                       completion: { (value: Bool) in
                        if let complete = onCompletion { complete() }
                        })
    }
    
    func hideTableView(_ duration: TimeInterval? = 0.6, onCompletion: (() -> Void)? = nil) {
        UITableView.animate(withDuration: duration!,
                       animations: { self.alpha = 0 },
                       completion: { (value: Bool) in
                        self.isHidden = true
                        if let complete = onCompletion { complete() }
                        })
    }
}

class ViewController: UIViewController, UITableViewDataSource {
   
    var time = Timer()
    var timeHistoryList : [String] = []
    var minute : Int = 0
    var second : Int = 0
    var isPaused : Bool = true
    @IBOutlet weak var playAndPauseButton : UIButton!
    @IBOutlet weak var recordButton : UIButton!
    @IBOutlet weak var resetButton : UIButton!
    @IBOutlet weak var recordTableView: UITableView!
    @IBOutlet weak var timeLabel: UILabel!
    
    let playButtonImage = UIImage(named: "icons8-play-50.png")
    let pauseButtonImage = UIImage(named: "icons8-pause-50.png")
    
    @IBAction func playAndPauseButton(_ sender: UIButton) {
        recordButton.isEnabled = true
        if isPaused {
            isPaused = false
            playAndPauseButton.setImage(pauseButtonImage, for: .normal)
        time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.incrementTimer), userInfo: nil, repeats: true)
        }
        else {
            isPaused = true
            playAndPauseButton.setImage(playButtonImage, for: .normal)
            time.invalidate()
        }

    }
    @IBAction func recordButton(_ sender: UIButton) {
        if let timeRecord = timeLabel.text {
            if timeRecord != " 00:00 " {
                
                
                if self.recordTableView.isHidden {
                    self.recordTableView.showTableView()
                }
                DispatchQueue.main.async {
                    self.timeHistoryList.insert(timeRecord, at: 0)
                    self.recordTableView.reloadData()
                }
                
                if isPaused {
                    recordButton.isEnabled = false
                }
            }
        }
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        recordButton.isEnabled = false
        isPaused = true
        playAndPauseButton.setImage(playButtonImage, for: .normal)
        self.recordTableView.hideTableView()
        minute = 0
        second = 0
        timeLabel.text = " 0\(minute):0\(second) "
        timeHistoryList = []
        time.invalidate()
        playAndPauseButton.isEnabled = true
        recordTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recordTableView.dataSource = self
        timeLabel.text = " 00:00 "
        //Registering nib
        let nib = UINib.init(nibName: "RecordTableViewCell", bundle: nil)
        recordTableView.register(nib, forCellReuseIdentifier: "recordCell")
        recordTableView.isHidden = true
        //Round button
        playAndPauseButton.layer.cornerRadius = (playAndPauseButton.frame.size.width)/2
        recordButton.layer.cornerRadius = (recordButton.frame.size.width)/2
        resetButton.layer.cornerRadius = (resetButton.frame.size.width)/2
        //Initially record button will be disabled
        recordButton.isEnabled = false
    
    }
    
    @objc func incrementTimer() {
        if second < 9 {
            second += 1
            timeLabel.text = " 0" + String(minute) + ":0" + String(second) + " "
            if second == 59 {
                second = 0
                minute += 1
            }
        }
        else {
            second += 1
            timeLabel.text = " 0" + String(minute) + ":" + String(second) + " "
            if second == 59 {
                second = 0
                minute += 1
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeHistoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = recordTableView.dequeueReusableCell(withIdentifier: "recordCell") as! RecordTableViewCell
        cell.setCellLabel(time: timeHistoryList[indexPath.row])
        return cell
    }
}

