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
        
//        for i in 0...2 {
//            let tmpView = UIView()
//            containerView.addSubview(tmpView)
//            contentViews.append(tmpView)
//            configContentView(for: contentViews[i])
//        }
        
        let views = ["containerView": containerView,
                     "scrollView": scrollView
//                     "contentView1": contentViews[0],
//                     "contentView2": contentViews[1],
//                     "contentView3": contentViews[2]
        ]
        for (_, view) in views {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.constraints(withVisualFormat: "H:|-0@750-[containerView]-0@750-|", options: [], metrics: nil, views: views)
        NSLayoutConstraint.constraints(withVisualFormat: "V:|-0@750-[containerView]-0@750-|", options: [], metrics: nil, views: views)
        NSLayoutConstraint.constraints(withVisualFormat: "|[scrollView]|", options: [.alignAllLeading, .alignAllTrailing, .alignAllTop, .alignAllBottom, .alignAllCenterX, .alignAllCenterY], metrics:nil, views: views)
//        NSLayoutConstraint.constraints(withVisualFormat: "|[contentView1][contentView2][contentView3]|", options: [], metrics: nil, views: views)
    }
    
    private func configContentView(for view: UIView) {
        let imageView = UIImageView(image: UIImage(named: "harry-dinh"))
        imageView.contentMode = .scaleAspectFit
        let description = UILabel()
        
        view.addSubview(imageView)
        view.addSubview(description)
        
        let views = ["view": view, "imageView": imageView, "description": description]

        for (_, view) in views {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.constraints(withVisualFormat: "|[imageView]|", options: [], metrics: nil, views: views)
        NSLayoutConstraint.constraints(withVisualFormat: "V:|[imageView]", options: [], metrics: nil, views: views)
        NSLayoutConstraint.constraints(withVisualFormat: "V:[description]|", options: [], metrics: nil, views: views)
        
    }
}
