//
//  HomeViewController.swift
//  TDSIdeMenuSamples
//
//  Created by Tinu Dahiya on 22/08/18.
//  Copyright © 2018 dahiyaboy. All rights reserved.
//

import UIKit

enum TDSideMenu {
    case SideFadeInOut
    case CurveSideIn
    case SideFlip
}

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var objSideFadeInOutVC : SideFadeInOutVC!
    var objCurveSideInVC : CurveSideInVC!
    var objSideFlipVC : SideFlipVC!
    
    var menutype : TDSideMenu!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let menu = UIBarButtonItem(image: UIImage(named: "ic-menu"),
                                   landscapeImagePhone: nil,
                                   style: .plain,
                                   target: self,
                                   action: #selector(self.menuAction(sender:)))
        
        let back = UIBarButtonItem(image: UIImage(named: "ic-back"),
                                   landscapeImagePhone: nil,
                                   style: .plain,
                                   target: self,
                                   action: #selector(self.backAction(sender:)))
        
        self.navigationItem.leftBarButtonItems = [back , menu]
        
        
        if menutype == TDSideMenu.SideFadeInOut{
            self.title = "SideFadeInOut"
        }
        else if menutype == TDSideMenu.CurveSideIn {
            self.title = "CurveSideIn"
        }
        else if menutype == TDSideMenu.SideFlip {
            self.title = "SideFlip"
        }
        
    }

    @objc func backAction( sender : UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func menuAction( sender : UIBarButtonItem){
        let window = UIApplication.shared.keyWindow!
        
        if menutype == TDSideMenu.SideFadeInOut {
            self.objSideFadeInOutVC  = self.storyboard?.instantiateViewController(withIdentifier: "SideFadeInOutVC") as! SideFadeInOutVC
            objSideFadeInOutVC.delegate = self
            window.addSubview(self.objSideFadeInOutVC.view)
            self.objSideFadeInOutVC.showMenu()
        }
        else if menutype == TDSideMenu.CurveSideIn {
            self.objCurveSideInVC  = self.storyboard?.instantiateViewController(withIdentifier: "CurveSideInVC") as! CurveSideInVC
            objCurveSideInVC.delegate = self
            window.addSubview(self.objCurveSideInVC.view)
            self.objCurveSideInVC.showMenu()
        }
        else if menutype == TDSideMenu.SideFlip {
            self.objSideFlipVC  = self.storyboard?.instantiateViewController(withIdentifier: "SideFlipVC") as! SideFlipVC
            objSideFlipVC.delegate = self
            window.addSubview(self.objSideFlipVC.view)
            self.objSideFlipVC.showMenu()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        return cell!
    }
}

extension HomeViewController : SideFadeInOutDelegate, CurveSideInDelegate, SideFlipDelegate {
    func hideSideFadeInOutMenu() {
        self.objSideFadeInOutVC.hideMenu {
            self.objSideFadeInOutVC.view.removeFromSuperview()
        }
    }
    
    func hideCurveSideInMenu() {
        self.objCurveSideInVC.hideMenu {
            self.objCurveSideInVC.view.removeFromSuperview()
        }
    }
    
    func hideSideFlipMenu() {
        self.objSideFlipVC.hideMenu {
            self.objSideFlipVC.view.removeFromSuperview()
        }
    }
    
    
}
