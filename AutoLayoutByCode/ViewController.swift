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
        self.view.addSubview(containerView)

        containerView.backgroundColor = .blue
        containerView.addSubview(scrollView)
        
        for i in 0...2 {
            let tmpView = UIView()
            scrollView.addSubview(tmpView)
            contentViews.append(tmpView)
            configContentView(for: contentViews[i], text: "This is a test" )
        }
        
        let views = ["containerView": containerView,
                     "scrollView": scrollView,
                     "contentView1": contentViews[0],
                     "contentView2": contentViews[1],
                     "contentView3": contentViews[2]
        ]
        for (_, view) in views {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[containerView]|", options: [], metrics: nil, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[containerView]|", options: [], metrics: nil, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[scrollView(==contentView1)]|", options: [], metrics:nil, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[scrollView(==contentView1)]|", options: [], metrics:nil, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "|[contentView1][contentView2(==contentView1)][contentView3(==contentView1)]|", options: [], metrics: nil, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[contentView1][contentView2(==contentView1)][contentView3(==contentView1)]|", options: [], metrics: nil, views: views))
    }
    
    private func configContentView(for view: UIView, text: String) {
        let imageView = UIImageView(image: UIImage(named: "harry-dinh"))
        imageView.contentMode = .scaleAspectFit
        let description = UILabel()
        description.text = text
        view.addSubview(imageView)
        view.addSubview(description)
        
        let views = ["view": view, "imageView": imageView, "description": description]

        for (_, view) in views {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let imgHeight = 400
        let metrics = ["imageViewHeight": imgHeight]
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[imageView]|", options: [], metrics: nil, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[imageView(imageViewHeight)][description]|", options: [], metrics: metrics, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:[description]|", options: [], metrics: nil, views: views))
        
    }
}
