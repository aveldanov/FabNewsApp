//
//  NewsListTableViewController.swift
//  FabNews
//
//  Created by Veldanov, Anton on 9/14/20.
//

import UIKit

class NewsListTableViewController: UITableViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }


    
    private func setup(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.setStatusBar(backgroundColor: .darkGray)
        self.navigationController?.navigationBar.barTintColor = .darkGray
        self.navigationController?.navigationBar.backgroundColor = .darkGray

    }
    
}

extension UINavigationController {

    func setStatusBar(backgroundColor: UIColor) {
        let statusBarFrame: CGRect
        if #available(iOS 13.0, *) {
            statusBarFrame = view.window?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero
        } else {
            statusBarFrame = UIApplication.shared.statusBarFrame
        }
        let statusBarView = UIView(frame: statusBarFrame)
        statusBarView.backgroundColor = backgroundColor
        view.addSubview(statusBarView)
    }

}
