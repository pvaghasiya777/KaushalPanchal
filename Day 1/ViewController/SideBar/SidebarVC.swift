//
//  SidebarVC.swift
//  Day 1
//
//  Created by Captain on 25/07/20.
//  Copyright © 2020 Captain. All rights reserved.
//

import UIKit

class SidebarVC: UITableViewController
{

    @IBOutlet var tbl_sidebar: UITableView!
    
    var Arr_Menu : NSMutableArray = ["","Profile","DASHBORD","PROJECT","PURCHASE ORDER","SHOP DRAWINGS","PACKAGES","PACKING LIST","MATERIAL LIST","DOCUMENT","REPORT","SETTING","LOGOUT"]
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.Initlization()
    }
    func Initlization() {
        self.tbl_sidebar.register(UINib(nibName: "Sidebar_Cell", bundle: nil), forCellReuseIdentifier: "Sidebar_Cell")
        self.tbl_sidebar.tableFooterView = UIView()
    }
    // MARK: - Table view data source
       override func numberOfSections(in tableView: UITableView) -> Int {
           // #warning Incomplete implementation, return the number of sections
        return self.Arr_Menu.count
       }

       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           // #warning Incomplete implementation, return the number of rows
           return 1
       }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell : Sidebar_Cell = tableView.dequeueReusableCell(withIdentifier: "Sidebar_Cell") as! Sidebar_Cell
        cell.lbl_Menuname.text = Arr_Menu[indexPath.section] as! String
        cell.selectionStyle = .none
//        cell.imageView?.image = UIImage(named: Arr_Menu[])
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Did select")
        if indexPath.section == 0 {
            
        }
        if SWSegueRearIdentifier == "Home" {
            print("Selected")
        }
        
    }

}
