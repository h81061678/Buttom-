//
//  ViewController.swift
//  sendButtonOneMore
//
//  Created by 魏文咸 on 2018/10/17.
//  Copyright © 2018 魏文咸. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var sendButton: UIButton!
    var timeStop:Int!
    var timer:Timer?
    var counter = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendButton.layer.cornerRadius = 5;
        label.text = "還沒處發";
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if self.timer != nil{
            self.timer?.invalidate()
        }
    }
    
    func timerEanbled(){
        sendButton.backgroundColor = UIColor(named: "reColor");
        sendButton.layer.borderWidth = 2
        sendButton.layer.borderColor = UIColor.red.cgColor
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(resendButton), userInfo: nil, repeats: true)
    }
    
    @objc func resendButton(){
        if (counter > 1){
            counter = counter - 1
            label.text = "已觸發";
            sendButton.setTitle(" 於\(counter)秒後可觸發 ", for: .normal)
        }else{
            label.text = "可重新觸發";
            sendButton.layer.borderWidth = 0
            sendButton.isEnabled = true
            sendButton.setTitleColor(.white, for: .normal)
            sendButton.backgroundColor = UIColor(named: "myColor");
            self.timer?.invalidate()
            sendButton.setTitle("重新發送", for: .normal)
            counter = 20
        }
    }

    @IBAction func sendAction(_ sender: UIButton) {
        sendButton.isEnabled = false;
        self.timerEanbled()
    }
    
}

