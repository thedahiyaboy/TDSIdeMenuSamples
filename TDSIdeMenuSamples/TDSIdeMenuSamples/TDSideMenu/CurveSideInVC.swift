//
//  RotationInOutVC.swift
//  TDSIdeMenuSamples
//
//  Created by Tinu Dahiya on 21/08/18.
//  Copyright © 2018 dahiyaboy. All rights reserved.
//

import UIKit

protocol CurveSideInDelegate : class {
    func hideCurveSideInMenu()
}

class CurveSideInVC: UIViewController {

    @IBOutlet weak var btnCoverScreen: UIButton!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var curveImgView: UIImageView!
    @IBOutlet weak var profileImgView: UIImageView!
    @IBOutlet weak var btnHouse: UIButton!
    @IBOutlet weak var btnAlarm: UIButton!
    @IBOutlet weak var btnFlash: UIButton!
    @IBOutlet weak var btnMarker: UIButton!
    @IBOutlet weak var btnCafe: UIButton!
    @IBOutlet weak var btnSetting: UIButton!
    
    var delegate : CurveSideInDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImgView.layer.cornerRadius = profileImgView.frame.width/2
        profileImgView.clipsToBounds = true
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    @IBAction func btnCoverScreenAction(_ sender: UIButton) {
        delegate?.hideCurveSideInMenu()
    }
    
    func diplace(){
        self.profileImgView.transform = CGAffineTransform(translationX: -self.menuView.frame.width, y: 0)
        self.btnSetting.transform = CGAffineTransform(translationX: -self.menuView.frame.width, y: 0)
        self.btnHouse.transform = CGAffineTransform(translationX: -self.menuView.frame.width, y: 0)
        self.btnCafe.transform = CGAffineTransform(translationX: -self.menuView.frame.width, y: 0)
        self.btnFlash.transform = CGAffineTransform(translationX: -self.menuView.frame.width, y: 0)
        self.btnAlarm.transform = CGAffineTransform(translationX: -self.menuView.frame.width, y: 0)
        self.btnMarker.transform = CGAffineTransform(translationX: -self.menuView.frame.width, y: 0)
        self.curveImgView.transform = CGAffineTransform(translationX: -self.curveImgView.frame.width, y: 0)
        self.btnCoverScreen.alpha = 0.0
        self.menuView.alpha = 0.0
    }
    
    func showMenu()  {
        self.diplace()
        UIView.animate(withDuration: 0.7, delay: 0.35, options: .curveEaseOut, animations: {
            self.profileImgView.transform = .identity
        })

        UIView.animate(withDuration: 0.7, delay: 0.3, options: .curveEaseOut, animations: {
            self.btnHouse.transform = .identity
        })

        UIView.animate(withDuration: 0.7, delay: 0.25, options: .curveEaseOut, animations: {
            self.btnAlarm.transform = .identity
        })

        UIView.animate(withDuration: 0.7, delay: 0.2, options: .curveEaseOut, animations: {
            self.btnFlash.transform = .identity
        })
        
        UIView.animate(withDuration: 0.7, delay: 0.15, options: .curveEaseOut, animations: {
            self.btnMarker.transform = .identity
        })
        
        UIView.animate(withDuration: 0.7, delay: 0.1, options: .curveEaseOut, animations: {
            self.btnCafe.transform = .identity
        })
        
        UIView.animate(withDuration: 0.7, delay: 0.05, options: .curveEaseOut, animations: {
            self.btnSetting.transform = .identity
        })
        
        UIView.animateKeyframes(withDuration: 0.7, delay: 0.0, options: .calculationModeDiscrete, animations: {
            self.btnCoverScreen.alpha = 1.0
            self.menuView.alpha = 1.0
            self.curveImgView.transform = .identity
        })
    }
    
    func hideMenu(completion : @escaping () -> Void)  {
        
        UIView.animate(withDuration: 0.7, delay: 0.05, options: .curveEaseOut, animations: {
            self.profileImgView.transform = CGAffineTransform(translationX: -self.menuView.frame.width, y: 0)
        })
        
        UIView.animate(withDuration: 0.7, delay: 0.1, options: .curveEaseOut, animations: {
            self.btnHouse.transform = CGAffineTransform(translationX: -self.menuView.frame.width, y: 0)
        })
        
        UIView.animate(withDuration: 0.7, delay: 0.15, options: .curveEaseOut, animations: {
            self.btnAlarm.transform = CGAffineTransform(translationX: -self.menuView.frame.width, y: 0)
            
        })
        
        UIView.animate(withDuration: 0.7, delay: 0.2, options: .curveEaseOut, animations: {
            self.btnFlash.transform = CGAffineTransform(translationX: -self.menuView.frame.width, y: 0)
        })
        
        UIView.animate(withDuration: 0.7, delay: 0.25, options: .curveEaseOut, animations: {
            self.btnMarker.transform = CGAffineTransform(translationX: -self.menuView.frame.width, y: 0)
        })
        
        UIView.animate(withDuration: 0.7, delay: 0.30, options: .curveEaseOut, animations: {
            self.btnCafe.transform = CGAffineTransform(translationX: -self.menuView.frame.width, y: 0)
        })
        
        UIView.animate(withDuration: 0.7, delay: 0.35, options: .curveEaseOut, animations: {
            self.btnSetting.transform = CGAffineTransform(translationX: -self.menuView.frame.width, y: 0)
        })
        
        UIView.animate(withDuration: 0.7, delay: 0.2, options: .curveEaseOut, animations: {
            self.curveImgView.transform = CGAffineTransform(translationX: -self.curveImgView.frame.width, y: 0)
            self.btnCoverScreen.alpha = 0.0
        }) { (fin) in
            self.menuView.alpha = 0.0
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                completion()
            })
        }
    }
    
    
}
