//
//  BingoLogicController.swift
//  MobileAppDevFinal
//
//  Created by Joseph DeCrisanti on 11/14/18.
//  Copyright © 2018 Joseph DeCrisanti. All rights reserved.
//

import Foundation
import UIKit

enum  WinConition : String{
    case vertical
    case horizontal
    case diagonal
    case none
}

func checkBingoType(_ array : Array <UIButton>) -> WinConition {
    switch array {
    case bColumn:
        return .vertical
    case iColumn:
        return .vertical
    case nColumn:
        return .vertical
    case gColumn:
        return .vertical
    case oColumn:
        return .vertical
    case diagonal1:
        return .diagonal
    case diagonal2:
        return .diagonal
    case row1:
        return .horizontal
    case row2:
        return .horizontal
    case row3:
        return .horizontal
    case row4:
        return .horizontal
    case row5:
        return .horizontal
    default:
        return .none
    }
}

func checkVictory(_ sender: UIButton) -> WinConition{
    
    let winningArray = findButton(sender)
    
    let winType = checkBingoType(winningArray)
    
    return winType
}

func findButton(_ sender : UIButton) -> Array <UIButton> {
    
    for array in allColumns{
        for _ in array{
            if sender.backgroundColor == UIColor.lightGray{
                if checkForVictory(array) == true{
                    return array
                }
            }
        }
    }
    
    for array in allDiagonals{
        for _ in array{
            if sender.backgroundColor == UIColor.lightGray{
                if checkForVictory(array) == true{
                    return array
                }
            }
        }
    }
    
    for array in allRows{
        for _ in array{
            if sender.backgroundColor == UIColor.lightGray{
                if checkForVictory(array) == true{
                    return array
                }
            }
        }
    }
    return []
}


func checkForVictory(_ row : Array<UIButton>) -> Bool {
    for buttons in row {
        if buttons.backgroundColor == UIColor.lightGray{
            winNumber += 1
        }
    }
    if winNumber != 5 {
        winNumber = 0
        return false
    }else{
        winNumber = 0
        return true
    }
}
