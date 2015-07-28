//
//  ViewController.swift
//  BlurrySidebar
//
//  Created by Leandro Silva on 7/27/15.
//  Copyright (c) 2015 The Daddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SidebarDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    var sidebar:Sidebar = Sidebar()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sidebar = Sidebar(sourceView: self.view, menuItems: ["Batman", "Batman Again", "Batman & The Joker"])
        sidebar.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func toggleMenu(sender: UIBarButtonItem) {
        sidebar.showSidebar(!sidebar.isSidebarOpen)
    }
    
    func sidebarDidSelectButtonAtIndex(index:Int) {
        switch index {
        case 0:
            imageView.image = UIImage(named: "batman_1.jpg")
            break
        case 1:
            imageView.image = UIImage(named: "batman_2.jpg")
            break
        case 2:
            imageView.image = UIImage(named: "batman_3.jpg")
            break
        default:
            imageView.image = UIImage(named: "batman_1.jpg")
        }
    }
    
    @IBAction func share(sender: UIBarButtonItem) {
        let imageToShare = imageView.image!
        
        let objectsToShare = [imageToShare]
        let activityViewController = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            
        // New Excluded Activities Code
        activityViewController.excludedActivityTypes = [UIActivityTypeAirDrop, UIActivityTypeAddToReadingList]
        
        self.presentViewController(activityViewController, animated: true, completion: nil)
    }
}

