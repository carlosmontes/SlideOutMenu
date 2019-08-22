//
//  SecondViewController.swift
//  SlideOutMenu
//
//  Created by CARLOS MONTES on 8/21/19.
//  Copyright © 2019 NTP. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

  init() {
    super.init(nibName: nil, bundle: nil)
    self.tabBarItem = UITabBarItem(title: "Second View", image: UIImage(named: "second"), tag: 1)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

