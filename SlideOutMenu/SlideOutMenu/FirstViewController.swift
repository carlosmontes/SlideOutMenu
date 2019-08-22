//
//  FirstViewController.swift
//  SlideOutMenu
//
//  Created by CARLOS MONTES on 8/21/19.
//  Copyright © 2019 NTP. All rights reserved.
//

import UIKit
import SnapKit

class FirstViewController: UIViewController {
  private lazy var button: UIButton = { UIButton(type: .custom) }()
  private var appDelegate: AppDelegate

  init(appDelegate: AppDelegate) {
    self.appDelegate = appDelegate
    
    super.init(nibName: nil, bundle: nil)
    
    self.tabBarItem = UITabBarItem(title: "First View", image: UIImage(named: "first"), tag: 0)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    button.backgroundColor = .red
    button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    button.layer.cornerRadius = 8
    button.setTitle("Show Side Menu", for: .normal)
    button.addTarget(self, action: #selector(showSideMenu), for: .touchUpInside)

    view.addSubview(button)

    button.snp.makeConstraints { make in
      make.centerX.centerY.equalToSuperview()
    }
  }
  
  @objc func showSideMenu(_ sender: UIButton) {
    print("tap tap")
    
    appDelegate.toggleSideMenu()
  }
}

