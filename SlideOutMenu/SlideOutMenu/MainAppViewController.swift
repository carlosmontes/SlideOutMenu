//
//  MainAppContainer.swift
//  SlideOutMenu
//
//  Created by CARLOS MONTES on 8/22/19.
//  Copyright © 2019 NTP. All rights reserved.
//

import UIKit
import SnapKit

class MainAppViewController: UIViewController {

  private lazy var backgroundOverlay: UIView = { UIView() }()
  private lazy var sideMenuWidth: CGFloat = { floor(view.frame.width * 0.75) }()
  
  private var sideMenu: UIViewController
  private var mainContent: UIViewController

  enum MenuViewState {
    case hidden
    case visible
  }
  private var currentState: MenuViewState = .hidden
  
  init(sideMenu: UIViewController, mainContent: UIViewController) {
    self.sideMenu = sideMenu
    self.mainContent = mainContent
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(mainContent.view)
    view.addSubview(backgroundOverlay)
    view.addSubview(sideMenu.view)
    
    sideMenu.didMove(toParent: self)
    mainContent.didMove(toParent: self)
    
    addConstraints()
    
    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(toggleSideMenu))
    backgroundOverlay.addGestureRecognizer(tapGestureRecognizer)
  }
  
  private func addConstraints() {
    sideMenu.view.snp.makeConstraints { make in
      make.top.equalTo(0)
      make.leading.equalTo(-sideMenuWidth)
      make.width.equalTo(sideMenuWidth)
      make.height.equalToSuperview()
    }
    
    backgroundOverlay.backgroundColor = .lightGray
    backgroundOverlay.layer.opacity = 0
    
    backgroundOverlay.snp.makeConstraints { make in
      make.top.leading.equalTo(0)
      make.width.height.equalToSuperview()
    }
    
    mainContent.view.snp.makeConstraints { make in
      make.top.equalTo(0)
      make.leading.equalTo(sideMenu.view.snp.trailing)
      make.width.height.equalToSuperview()
    }
  }
  
  @objc func toggleSideMenu() {
    animateMenu(open: currentState == .hidden)
  }
  
  private func animateMenu(open: Bool) {
    UIView.animate(withDuration: 0.25, animations: { [weak self] in
      self?.backgroundOverlay.layer.opacity = open ? 0.35 : 0.0
      self?.sideMenu.view.snp.updateConstraints { make in
        if open {
          make.leading.equalTo(0)
        } else if let menuWidth = self?.sideMenuWidth {
          make.leading.equalTo(-menuWidth)
        }
      }
      self?.view.layoutIfNeeded()
    })
    currentState = open ? .visible : .hidden
  }
}
