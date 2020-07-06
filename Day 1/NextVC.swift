//
//  NextVC.swift
//  Day 1
//
//  Created by Captain on 05/07/20.
//  Copyright © 2020 Captain. All rights reserved.
//

import UIKit

class NextVC: UIViewController,UITextFieldDelegate
{
    @IBOutlet var txt_Date: UITextField!
    
    var datepicker1 : UIDatePicker!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        print("Next View Controller Success")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("view will appear called")
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 0 {
            print("Textfiled Delegate Methode Call")
            self.pickdate()
        }
    }
    func pickdate() {
        print("datepicker call")
        let frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216)
        self.datepicker1 = UIDatePicker(frame: frame)
        self.datepicker1.datePickerMode = UIDatePicker.Mode.dateAndTime
        self.datepicker1.minimumDate = Calendar.current.date(byAdding: .day, value: 1, to: Date())
        self.txt_Date.inputView = self.datepicker1
        let tool = UIToolbar()
        tool.sizeToFit()
        let Done = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(DoneButtonClick(_:)))
        let Space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let Cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(CancelButtonClick(_:)))
        tool.backgroundColor = UIColor.lightGray
        tool.setItems([Done,Space,Cancel], animated: true)
        tool.isUserInteractionEnabled = true
        txt_Date.inputAccessoryView = tool
    }
    @objc func DoneButtonClick(_ sender : UIBarButtonItem) {
        print("Done Click")
        let format = DateFormatter()
        format.dateFormat = "dd/MM/yyyy hh:mm a"
        let finaldate = format.string(from: (datepicker1.date as NSDate) as Date)
        print(finaldate)
        self.txt_Date.text = finaldate
        self.txt_Date.resignFirstResponder()
    }
    @objc func CancelButtonClick(_ sender : UIBarButtonItem) {
        self.txt_Date.resignFirstResponder()
    }
}
