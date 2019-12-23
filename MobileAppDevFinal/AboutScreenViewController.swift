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

		if let url = URL(string: "https://twitter.com/Ninjoe_Gamer") {
		    UIApplication.shared.open(url)
		}
	}
	
	override func viewDidLoad() {
		  super.viewDidLoad()
	}
}
