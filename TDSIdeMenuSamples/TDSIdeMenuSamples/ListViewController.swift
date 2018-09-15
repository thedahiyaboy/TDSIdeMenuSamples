//
//  ViewController.swift
//  TDSIdeMenuSamples
//
//  Created by Tinu Dahiya on 22/08/18.
//  Copyright © 2018 dahiyaboy. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var arrList = ["SideFadeInOut", "CurveSideIn", "SideFlip"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = arrList[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        if indexPath.row == 0 {
            vc.menutype = TDSideMenu.SideFadeInOut
        }
        else if indexPath.row == 1 {
            vc.menutype = TDSideMenu.CurveSideIn
        }
        else if indexPath.row == 2 {
            vc.menutype = TDSideMenu.SideFlip
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

