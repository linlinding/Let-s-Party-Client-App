//
//  TabBarController.swift
//  LETSPARTY
//
//  Created by LinLin Ding on 10/29/16.
//  Copyright © 2016 LinLin Ding. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var tabBar: UITabBar=self.tabBar
        var item0:UITabBarItem=tabBar.items![0]
        var item1:UITabBarItem=tabBar.items![1]
        var item2:UITabBarItem=tabBar.items![2]
        
        
        item0.image=#imageLiteral(resourceName: "partyLogo3")
        item1.image=#imageLiteral(resourceName: "partyLogo1")
        item2.image=#imageLiteral(resourceName: "partyLogo4")
        
       // party
    }


    

   }
