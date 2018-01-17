//
//  MenuViewController.swift
//  SlideMenu 3
//
//  Created by SCL IT on 17/01/18.
//  Copyright © 2018 Nikhil. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let title_arr = ["Home", "About us", "Rate us", "Share", "Logout"]
    
    @IBOutlet weak var menu_tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menu_tableView.delegate = self
        menu_tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return title_arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "menu_cell") as! MenuTableViewCell
        
        cell.label_title.text = title_arr[indexPath.row]
        return cell
    }

}
