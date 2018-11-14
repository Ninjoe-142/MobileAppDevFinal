//
//  BingoCardViewController.swift
//  MobileAppDevFinal
//
//  Created by Joseph DeCrisanti on 10/15/18.
//  Copyright © 2018 Joseph DeCrisanti. All rights reserved.
//

import UIKit
import Foundation

class BingoCardViewController: UIViewController {
    
    @IBOutlet weak var B1Button: UIButton!
    @IBOutlet weak var B2Button: UIButton!
    @IBOutlet weak var B3Button: UIButton!
    @IBOutlet weak var B4Button: UIButton!
    @IBOutlet weak var B5Button: UIButton!
    
    @IBOutlet weak var I1Button: UIButton!
    @IBOutlet weak var I2Button: UIButton!
    @IBOutlet weak var I3Button: UIButton!
    @IBOutlet weak var I4Button: UIButton!
    @IBOutlet weak var I5Button: UIButton!
    
    @IBOutlet weak var N1Button: UIButton!
    @IBOutlet weak var N2Button: UIButton!
    @IBOutlet weak var freeButton: UIButton!
    @IBOutlet weak var N4Button: UIButton!
    @IBOutlet weak var N5Button: UIButton!
    
    @IBOutlet weak var G1Button: UIButton!
    @IBOutlet weak var G2Button: UIButton!
    @IBOutlet weak var G3Button: UIButton!
    @IBOutlet weak var G4Button: UIButton!
    @IBOutlet weak var G5Button: UIButton!
    
    @IBOutlet weak var O1Button: UIButton!
    @IBOutlet weak var O2Button: UIButton!
    @IBOutlet weak var O3Button: UIButton!
    @IBOutlet weak var O4Button: UIButton!
    @IBOutlet weak var O5Button: UIButton!
    
    @IBOutlet weak var topLabel: UILabel!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if topLabel.text == sender.titleLabel?.text{
             sender.backgroundColor = UIColor.lightGray
        }
        didWin(checkVictory(sender))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        arrayInit()
        numberGenerator(allColumns, allNumberArrays)
        
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(numberPicker), userInfo: nil, repeats: true)
    }
    
    func numberGenerator(_ allColumns : Array <Array<UIButton>>, _ columnNumbers : Array <Array<Int>>){
        
        var count = 0
        var numbers = [Int]()
        
        for array in allColumns{
            numbers = columnNumbers[count]
            for button in array{
                let pickedNumber = Int.random(in: 0...numbers.count - 1)
                let n = numbers[pickedNumber]
                numbers.remove(at: pickedNumber)
                
                button.setTitle("\(n)", for: .normal)
                }
            count += 1
            }
        freeButton.setTitle("free", for: .normal)
    }
    
    @objc func numberPicker(){
        
        if allNumbers.count == 0{
            timer.invalidate()
            navigationItem.hidesBackButton = false
            topLabel.text = "You Lost"
        }
        
        let pickedNumber = Int.random(in: 0...allNumbers.count - 1)
        let number = allNumbers[pickedNumber]
        allNumbers.remove(at: pickedNumber)
        
        topLabel.text = "\(number)"
    }
    
    func arrayInit() {
        bColumn = [B1Button, B2Button, B3Button, B4Button, B5Button]
        iColumn = [I1Button, I2Button, I3Button, I4Button, I5Button]
        nColumn = [N1Button, N2Button, N4Button, N5Button, freeButton]
        gColumn = [G1Button, G2Button, G3Button, G4Button, G5Button]
        oColumn = [O1Button, O2Button, O3Button, O4Button, O5Button]
        
        diagonal1 = [B1Button, I2Button, G4Button, O5Button, freeButton]
        diagonal2 = [B5Button, I4Button, G2Button, O1Button, freeButton]
        
        row1 = [B1Button, I1Button, N1Button, G1Button, O1Button]
        row2 = [B2Button, I2Button, N2Button, G2Button, O2Button]
        row3 = [B3Button, I3Button, G3Button, O3Button, freeButton]
        row4 = [B4Button, I4Button, N4Button, G4Button, O4Button]
        row5 = [B5Button, I5Button, N5Button, G5Button, O5Button]
        
        allDiagonals = [diagonal1, diagonal2]
        allColumns = [bColumn, iColumn, nColumn, gColumn, oColumn]
        allRows = [row1, row2, row3, row4, row5]
        
        allNumbers = bNumbers + iNumbers + nNumbers + gNumbers + oNumbers
        allNumberArrays = [bNumbers, iNumbers, nNumbers, gNumbers, oNumbers]
    }
    
    func didWin(_ type : WinConition) {
        if type != .none{
            timer.invalidate()
            topLabel.text = "You won \(type.rawValue) bingo!"
            navigationItem.hidesBackButton = false
        }
    }
}