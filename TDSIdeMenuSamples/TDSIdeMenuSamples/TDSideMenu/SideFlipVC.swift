//
//  SideFlipVC.swift
//  TDSIdeMenuSamples
//
//  Created by Tinu Dahiya on 22/08/18.
//  Copyright © 2018 dahiyaboy. All rights reserved.
//

import UIKit

protocol SideFlipDelegate : class {
    func hideSideFlipMenu()
}

class SideFlipVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var btnCoverScreen: UIButton!
    
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnMic: UIButton!
    @IBOutlet weak var btnGlass: UIButton!
    @IBOutlet weak var btnFilm: UIButton!
    @IBOutlet weak var btnBrief: UIButton!
    @IBOutlet weak var btnEasel: UIButton!
    @IBOutlet weak var btnBook: UIButton!
    
    var delegate : SideFlipDelegate?
    var duration = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let borderColor = UIColor(displayP3Red: 35.0/255.0, green: 36.0/255.0, blue: 57.0/255.0, alpha: 1.0).cgColor
        btnCancel.layer.borderColor = borderColor
        btnCancel.layer.borderWidth = 1.0
        btnMic.layer.borderColor = borderColor
        btnMic.layer.borderWidth = 1.0
        btnGlass.layer.borderColor = borderColor
        btnGlass.layer.borderWidth = 1.0
        btnFilm.layer.borderColor = borderColor
        btnFilm.layer.borderWidth = 1.0
        btnBrief.layer.borderColor = borderColor
        btnBrief.layer.borderWidth = 1.0
        btnEasel.layer.borderColor = borderColor
        btnEasel.layer.borderWidth = 1.0
        btnBook.layer.borderColor = borderColor
        btnBook.layer.borderWidth = 1.0
        
    }

    private func setAnchorPoint(anchorPoint: CGPoint, view: UIView) {
        var newPoint = CGPoint(x: view.bounds.size.width * anchorPoint.x,
                               y: view.bounds.size.height * anchorPoint.y)
        
        var oldPoint = CGPoint(x: view.bounds.size.width * view.layer.anchorPoint.x,
                               y: view.bounds.size.height * view.layer.anchorPoint.y)
        
        newPoint = newPoint.applying(view.transform)
        oldPoint = oldPoint.applying(view.transform)
        
        var position = view.layer.position
        position.x -= oldPoint.x
        position.x += newPoint.x
        
        position.y -= oldPoint.y
        position.y += newPoint.y
        
        view.layer.position = position
        view.layer.anchorPoint = anchorPoint
    }
    
    
    @IBAction func btnCoverScreenAction(_ sender: UIButton) {
        delegate?.hideSideFlipMenu()
    }
    
    @IBAction func btnCancelAction(_ sender: UIButton) {
        delegate?.hideSideFlipMenu()
    }
  
    
    private func displace() {
        let rotationTransformCancel = CATransform3DRotate(btnCancel.layer.transform, CGFloat.pi/2, 0, 1, 0)
        let rotationTransformMic = CATransform3DRotate(btnMic.layer.transform, CGFloat.pi/2, 0, 1, 0)
        let rotationTransformGlass = CATransform3DRotate(btnGlass.layer.transform, CGFloat.pi/2, 0, 1, 0)
        let rotationTransformFilm = CATransform3DRotate(btnFilm.layer.transform, CGFloat.pi/2, 0, 1, 0)
        let rotationTransformBrief = CATransform3DRotate(btnBrief.layer.transform, CGFloat.pi/2, 0, 1, 0)
        let rotationTransformEasel = CATransform3DRotate(btnEasel.layer.transform, CGFloat.pi/2, 0, 1, 0)
        let rotationTransformBook = CATransform3DRotate(btnBook.layer.transform, CGFloat.pi/2, 0, 1, 0)
        
        self.setAnchorPoint(anchorPoint: CGPoint(x: 0, y: 0.5), view: self.btnCancel)
        self.btnCancel.layer.transform = rotationTransformCancel
        self.setAnchorPoint(anchorPoint: CGPoint(x: 0, y: 0.5), view: self.btnMic)
        self.btnMic.layer.transform = rotationTransformMic
        self.setAnchorPoint(anchorPoint: CGPoint(x: 0, y: 0.5), view: self.btnGlass)
        self.btnGlass.layer.transform = rotationTransformGlass
        self.setAnchorPoint(anchorPoint: CGPoint(x: 0, y: 0.5), view: self.btnFilm)
        self.btnFilm.layer.transform = rotationTransformFilm
        self.setAnchorPoint(anchorPoint: CGPoint(x: 0, y: 0.5), view: self.btnBrief)
        self.btnBrief.layer.transform = rotationTransformBrief
        self.setAnchorPoint(anchorPoint: CGPoint(x: 0, y: 0.5), view: self.btnEasel)
        self.btnEasel.layer.transform = rotationTransformEasel
        self.setAnchorPoint(anchorPoint: CGPoint(x: 0, y: 0.5), view: self.btnBook)
        self.btnBook.layer.transform = rotationTransformBook
        
        self.btnCoverScreen.alpha = 0.0
        self.menuView.alpha = 0.0
    }
    
    func showMenu()  {
        self.displace()
        UIView.animate(withDuration: duration, delay: 0.0, options: .curveEaseOut, animations: {
             self.btnCancel.layer.transform = CATransform3DIdentity
        })
        
        UIView.animate(withDuration: duration, delay: 0.15, options: .curveEaseOut, animations: {
             self.btnMic.layer.transform = CATransform3DIdentity
        })
        
        UIView.animate(withDuration: duration, delay: 0.30, options: .curveEaseOut, animations: {
            self.btnGlass.layer.transform = CATransform3DIdentity
        })
        
        UIView.animate(withDuration: duration, delay: 0.45, options: .curveEaseOut, animations: {
            self.btnFilm.layer.transform = CATransform3DIdentity
        })
        
        UIView.animate(withDuration: duration, delay: 0.60, options: .curveEaseOut, animations: {
             self.btnBrief.layer.transform = CATransform3DIdentity
        })
        
        UIView.animate(withDuration: duration, delay: 0.75, options: .curveEaseOut, animations: {
             self.btnEasel.layer.transform = CATransform3DIdentity
        })
        
        UIView.animate(withDuration: duration, delay: 0.90, options: .curveEaseOut, animations: {
             self.btnBook.layer.transform = CATransform3DIdentity
        })
        
        UIView.animateKeyframes(withDuration: 0.0, delay: 0.0, options: .calculationModeDiscrete, animations: {
            self.btnCoverScreen.alpha = 1.0
            self.menuView.alpha = 1.0
        })
    }
    
  
    
    func hideMenu(completion : @escaping () -> Void)  {
        
        let rotationTransformCancel = CATransform3DRotate(btnCancel.layer.transform, CGFloat.pi/2, 0, 1, 0)
        let rotationTransformMic = CATransform3DRotate(btnMic.layer.transform, CGFloat.pi/2, 0, 1, 0)
        let rotationTransformGlass = CATransform3DRotate(btnGlass.layer.transform, CGFloat.pi/2, 0, 1, 0)
        let rotationTransformFilm = CATransform3DRotate(btnFilm.layer.transform, CGFloat.pi/2, 0, 1, 0)
        let rotationTransformBrief = CATransform3DRotate(btnBrief.layer.transform, CGFloat.pi/2, 0, 1, 0)
        let rotationTransformEasel = CATransform3DRotate(btnEasel.layer.transform, CGFloat.pi/2, 0, 1, 0)
        let rotationTransformBook = CATransform3DRotate(btnBook.layer.transform, CGFloat.pi/2, 0, 1, 0)
        
        UIView.animate(withDuration: duration, delay: 0.0, options: .curveEaseOut, animations: {
            self.setAnchorPoint(anchorPoint: CGPoint(x: 0, y: 0.5), view: self.btnCancel)
            self.btnCancel.layer.transform = rotationTransformCancel
        })
        
        UIView.animate(withDuration: duration, delay: 0.15, options: .curveEaseOut, animations: {
            self.setAnchorPoint(anchorPoint: CGPoint(x: 0, y: 0.5), view: self.btnMic)
            self.btnMic.layer.transform = rotationTransformMic
        })
        
        UIView.animate(withDuration: duration, delay: 0.30, options: .curveEaseOut, animations: {
            self.setAnchorPoint(anchorPoint: CGPoint(x: 0, y: 0.5), view: self.btnGlass)
            self.btnGlass.layer.transform = rotationTransformGlass
        })
        
        UIView.animate(withDuration: duration, delay: 0.45, options: .curveEaseOut, animations: {
            self.setAnchorPoint(anchorPoint: CGPoint(x: 0, y: 0.5), view: self.btnFilm)
            self.btnFilm.layer.transform = rotationTransformFilm
        })
        
        UIView.animate(withDuration: duration, delay: 0.60, options: .curveEaseOut, animations: {
            self.setAnchorPoint(anchorPoint: CGPoint(x: 0, y: 0.5), view: self.btnBrief)
            self.btnBrief.layer.transform = rotationTransformBrief
        })
        
        UIView.animate(withDuration: duration, delay: 0.75, options: .curveEaseOut, animations: {
            self.setAnchorPoint(anchorPoint: CGPoint(x: 0, y: 0.5), view: self.btnEasel)
            self.btnEasel.layer.transform = rotationTransformEasel
        })
        
        UIView.animate(withDuration: duration, delay: 0.90, options: .curveEaseOut, animations: {
            self.setAnchorPoint(anchorPoint: CGPoint(x: 0, y: 0.5), view: self.btnBook)
            self.btnBook.layer.transform = rotationTransformBook
        })
        
        UIView.animateKeyframes(withDuration: 0.0, delay: 2.0, options: .calculationModeDiscrete, animations: {
            self.btnCoverScreen.alpha = 0.0
            self.menuView.alpha = 0.0
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                completion()
            })
        })
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        return cell!
    }
    
}
