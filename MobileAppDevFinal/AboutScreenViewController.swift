//
//  AboutScreenViewController.swift
//  MobileAppDevFinal
//
//  Created by Joseph DeCrisanti on 12/23/19.
//  Copyright © 2019 Joseph DeCrisanti. All rights reserved.
//

import Foundation
import UIKit

class AboutScreen : UIViewController {
	
	@IBAction func TwitterButton(_ sender: Any) {

		if let url = URL(string:"https://www.linkedin.com/in/joseph-decrisanti-1a3550131") {
		    UIApplication.shared.open(url)
		}
	}
	
	override func viewDidLoad() {
		  super.viewDidLoad()
	}
}
