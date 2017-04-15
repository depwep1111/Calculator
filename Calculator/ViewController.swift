//
//  ViewController.swift
//  Calculator
//
//  Created by Cntt06 on 4/15/17.
//  Copyright © 2017 Cntt06. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var numberOnScreen: Double = 0 // so hien tai tren man hinh
    var preNumber: Double = 0 // so truoc do
    var isNumber = true // Button nhan la so hay khong
    var operation = 0 //// Phep toan duoc goi (+,-,*,/)
    var isMinus = false // button (+/-) co bi nhan chua
    var isPoint = false // button (.) co bi nhan chua
    var isEqual = false
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) { // cac button so duoc nhan
        if isNumber == false // neu button phep tinh da duoc nhan
        {
            if sender.tag != 0
            {
                label.text = String(sender.tag-1)
                numberOnScreen = Double(label.text!)!
                isNumber = true
            }
        }
        else{
            if sender.tag != 0
            {
                label.text = label.text! + String(sender.tag - 1)
                numberOnScreen = Double(label.text!)!
            }
            
            else if label.text! != "" && isPoint == false
            {
                label.text = label.text! + "."
                isPoint = true
            }
            
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func Button(_ sender: UIButton) { // cac button khac so
        if label.text != "" && sender.tag != 11 && sender.tag != 16 // neu button (+,-,*,/) duoc nhan
        {
            preNumber = Double(label.text!)!
            if sender.tag == 12  // phep chia
            {
                label.text = "/"
            }
            else if sender.tag == 13   // phep nhan
            {
                label.text = "x"
            }
            else if sender.tag == 14  // phep tru
            {
                label.text = "-"
            }
            else if sender.tag == 15  //  phep cong
            {
                label.text = "+"
            }
            operation = sender.tag
            isNumber = false
            isPoint = false
        }
        else if sender.tag == 16 // dau bang duoc nhan
        {
            if operation == 12 // tinh chia
            {
                label.text = String(preNumber / numberOnScreen)
            }
            else if operation == 13 // tinh nhan
            {
                label.text = String(preNumber * numberOnScreen)
            }
            else if operation == 14 // tinh tru
            {
                label.text = String(preNumber - numberOnScreen)
            }
            else if operation == 15 // tinh cong
            {
                label.text = String(preNumber + numberOnScreen)
            }
            isEqual = true
        }
        else if sender.tag == 11 // xoa toan bo khi nut C dc nhan
        {
            label.text = ""
            preNumber = 0
            numberOnScreen = 0
            operation = 0
            isPoint = false
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

