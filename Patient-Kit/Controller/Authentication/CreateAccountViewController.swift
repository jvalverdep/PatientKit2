//
//  CreateAccountViewController.swift
//  Patient-Kit
//
//  Created by Melanie on 5/14/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {

  
  @IBOutlet weak var submitButton: UIButton!
  
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    let label = UILabel(frame: CGRect(x:0, y:0, width:100 , height:50))
    label.backgroundColor = .clear
    label.numberOfLines = 1
    label.font = UIFont.boldSystemFont(ofSize: 14)
    label.textAlignment = .center
    label.textColor = .black
    label.text = "Create An Account"
    self.navigationItem.titleView = label
    
    Gradient.applyGradientTo(View: submitButton,
                             withColors: [AppColor.darkPurple.cgColor, AppColor.lightPurple.cgColor],
                             withStartPoint: CGPoint(x: 0.0, y: 0.5),
                             andEndPoint: CGPoint(x: 1, y: 0.5))
    submitButton.layer.cornerRadius = submitButton.bounds.height / 2
    submitButton.clipsToBounds = true
  }

    

}
