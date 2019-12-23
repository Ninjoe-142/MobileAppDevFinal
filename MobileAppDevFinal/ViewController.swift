//
//  ViewController.swift
//  MobileAppDevFinal
//
//  Created by Joseph DeCrisanti on 10/15/18.
//  Copyright © 2018 Joseph DeCrisanti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func playButton(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "PlayingCard") as? BingoCardViewController {
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
	@IBAction func aboutButton(_ sender: Any) {
		if let vc = storyboard?.instantiateViewController(withIdentifier: "About") as? AboutScreen {
		navigationController?.pushViewController(vc, animated: true)
		}
	}
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

