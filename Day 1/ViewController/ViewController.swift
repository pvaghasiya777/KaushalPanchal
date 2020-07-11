//
//  ViewController.swift
//  Day 1
//
//  Created by Captain on 04/07/20.
//  Copyright © 2020 Captain. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet var btn_Delete: UIBarButtonItem!
    @IBOutlet var lbl_Title: UILabel!
    @IBOutlet var txt_Firstname: UITextField!
    @IBOutlet var txt_lastname: UITextField!
    @IBOutlet var txt_number: UITextField!
    @IBOutlet var txt_age: UITextField!
    @IBOutlet var btn_submit: UIButton!
    @IBOutlet var lbl_result: UILabel!
    @IBOutlet var Progress: UIActivityIndicatorView!
    
    var Arr_Full_Detail : NSMutableArray = NSMutableArray()
    let Story : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("dis appear call")
    }
    @IBAction func btn_Submit_Action(_ sender: UIButton) {
        print("Submit Button Clicked")
        print("Test message for Github setup")
        Progress.color  = .systemRed
        Progress.startAnimating()
        self.Show_Alert()
        
//        let txt_test = UITextField()
//        txt_test.text = "abcdefg"
//
//        self.txt_Firstname.layer.cornerRadius = 10
//        self.txt_Firstname.layer.borderWidth = 1
//        self.txt_Firstname.layer.borderColor = UIColor.lightGray.cgColor
//
//
//        self.Arr_Full_Detail.add(self.txt_Firstname.text!)
//        self.Arr_Full_Detail.add(self.txt_lastname.text!)
//        self.Arr_Full_Detail.add(self.txt_number.text!)
//        self.Arr_Full_Detail.add(self.txt_age.text!)
//
//        self.lbl_result.text = Arr_Full_Detail.componentsJoined(by: ",\n")
//        self.lbl_Title.text = "Form Fill Succesfull"
    }
    func Show_Alert() {
        let alert = UIAlertController(title: "Sign Out", message: "You can alaways acces your content by singing click", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: {_ in }))
        alert.addAction(UIAlertAction(title: "Edit", style: .default, handler: {(_: UIAlertAction!)in
                print("ok button click")
            let Next_VC = self.Story.instantiateViewController(withIdentifier: "ImagepickerVC") as! ImagepickerVC
            self.navigationController?.pushViewController(Next_VC, animated: true)
            
            self.Progress.stopAnimating()
        }))
        alert.addAction(UIAlertAction(title: "Update", style: .default, handler: {(_: UIAlertAction!)in
                print("ok button click")
        }))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(_: UIAlertAction!)in
                print("ok button click")
            let Next_VC = self.Story.instantiateViewController(withIdentifier: "NextVC") as! NextVC
            self.navigationController?.pushViewController(Next_VC, animated: true)
        }))
//        alert.addAction(UIAlertAction(title: "Delete", style: .default, handler: {(_: UIAlertAction!)in
//                print("ok button click")
//        }))
        self.present(alert, animated: true, completion: nil)
    }

}

