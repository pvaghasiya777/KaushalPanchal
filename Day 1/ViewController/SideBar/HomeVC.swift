//
//  HomeVC.swift
//  Day 1
//
//  Created by Captain on 25/07/20.
//  Copyright © 2020 Captain. All rights reserved.
//

import UIKit

class HomeVC: UIViewController,SWRevealViewControllerDelegate {

    @IBOutlet var menubar_btn: UIBarButtonItem!
    @IBOutlet var collection_view: UICollectionView!
    let sectionInsets = UIEdgeInsets(top: 8.0, left:  8.0, bottom: 8.0, right: 8.0)
       let itemsperrow : CGFloat = 3
    var Arr_Menu : NSMutableArray = ["","Profile","DASHBORD","PROJECT","PURCHASE ORDER","SHOP DRAWINGS","PACKAGES","PACKING LIST","MATERIAL LIST","DOCUMENT","REPORT","SETTING","LOGOUT"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initlization()
    }
    func initlization() {
        if revealViewController() != nil {
            self.revealViewController().delegate = self
            menubar_btn.target = self.revealViewController()
            menubar_btn.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.revealViewController()?.rearViewRevealWidth = 280
        }
        self.collection_view.register(UINib(nibName: "Test_Cell", bundle: nil), forCellWithReuseIdentifier: "Test_Cell")
    }
}
extension HomeVC : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.Arr_Menu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: Test_Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Test_Cell", for: indexPath) as! Test_Cell
        cell.lbl_name.text = self.Arr_Menu[indexPath.section] as! String
        return cell
    }
    func collectionView(_ collectionView: UICollectionView,
                           layout collectionViewLayout: UICollectionViewLayout,
                           sizeForItemAt indexPath: IndexPath) -> CGSize
       {
           let paddingSpace = sectionInsets.left * (itemsperrow + 1)
           let availableWidth = (self.view.frame.width) - paddingSpace
           let availableHeight = (collectionView.frame.height) - paddingSpace
           let widthPerItem = availableWidth / itemsperrow
           let heightPerItem = availableHeight / itemsperrow
           return CGSize(width: Int(widthPerItem), height: Int(heightPerItem))
       }
       func collectionView(_ collectionView: UICollectionView,
                           layout collectionViewLayout: UICollectionViewLayout,
                           insetForSectionAt section: Int) -> UIEdgeInsets {
           return sectionInsets
       }
       func collectionView(_ collectionView: UICollectionView,
                           layout collectionViewLayout: UICollectionViewLayout,
                           minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return sectionInsets.left
       }
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           return sectionInsets.left
       }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("Did select")
//    }
    
}
