//
//  ViewController.swift
//  AutoLayoutByCode
//
//  Created by Đinh Văn Nhật on 2019/04/08.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var containerView = UIView()
    private var scrollView = UIScrollView()
    private var contentViews = [UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white

        containerView.backgroundColor = .blue
        containerView.addSubview(scrollView)
        
        for i in 0...2 {
            var tmpView = UIView()
            contentViews.append(tmpView)
            configContentView(for: contentViews[i])
        }
    }
    
    private func configContentView(for view: UIView) {
        
    }
}

