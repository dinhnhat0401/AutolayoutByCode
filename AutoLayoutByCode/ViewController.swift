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
            let tmpView = UIView()
            contentViews.append(tmpView)
            configContentView(for: contentViews[i])
            
//            NSLayoutConstraint.constraints(withVisualFormat: "|imageView|", options: [], metrics: nil, views: views)
        }
    }
    
    private func configContentView(for view: UIView) {
        let imageView = UIImageView(image: UIImage(named: "harry-dinh"))
        let description = UILabel()
        
        view.addSubview(imageView)
        view.addSubview(description)
        
        let views: [String: UIView] = ["view": view, "imageView": imageView, "description": description]

        for _ in views {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.constraints(withVisualFormat: "|imageView|", options: [], metrics: nil, views: views)
        NSLayoutConstraint.constraints(withVisualFormat: "V:|imageView", options: [], metrics: nil, views: views)
        NSLayoutConstraint.constraints(withVisualFormat: "V:[description]|", options: [], metrics: nil, views: views)
        
    }
}
