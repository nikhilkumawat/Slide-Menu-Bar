//
//  myTableViewController.swift
//  SlideMenu 3
//
//  Created by SCL IT on 17/01/18.
//  Copyright © 2018 Nikhil. All rights reserved.
//

import UIKit

class myTableViewController: UITableViewController {

    var menu_vc: MenuViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        menu_vc = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeLeft)
    }

    @objc func respondToGesture(gesture: UISwipeGestureRecognizer){
        switch gesture.direction {
        case UISwipeGestureRecognizerDirection.right:
            print("Right Swipe")
            // show Menu
            //            show_menu()
            close_on_swipe()
        case UISwipeGestureRecognizerDirection.left:
            print("Left Swipe")
            // close Mneu
            close_on_swipe()
        default:
            break
        }
    }
    
    func close_on_swipe(){
        if AppDelegate.menu_bool{
            // show the menu
            show_menu()
        }
        else{
            // close menu
            close_menu()
        }
    }
    
    @IBAction func menu_action(_ sender: UIBarButtonItem) {
        
        if AppDelegate.menu_bool{
            // show the menu
            show_menu()
        }
        else{
            // close menu
            close_menu()
        }
        
    }
    
    func show_menu(){
        UIView.animate(withDuration: 0.3) { ()-> Void in
            
            self.menu_vc.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            self.menu_vc.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            self.addChildViewController(self.menu_vc)
            self.view.addSubview(self.menu_vc.view)
            AppDelegate.menu_bool = false
            
        }
        
    }
    
    func close_menu()
    {
        UIView.animate(withDuration: 0.3, animations:  { ()-> Void in
            self.menu_vc.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            
        }) { (finished) in
            self.menu_vc.view.removeFromSuperview()
        }
        AppDelegate.menu_bool = true
        
    }
}
