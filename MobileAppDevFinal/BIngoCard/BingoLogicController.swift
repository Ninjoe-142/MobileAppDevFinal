//
//  BingoLogicController.swift
//  MobileAppDevFinal
//
//  Created by Joseph DeCrisanti on 11/14/18.
//  Copyright © 2018 Joseph DeCrisanti. All rights reserved.
//
//  This is the logic controler for the bingo view contoler

import Foundation
import UIKit

enum  WinConition : String{
    case vertical
    case horizontal
    case diagonal
    case none
}

/// This function switches a passed in array and if the array passed in is one of the wining arrays then it returns the
/// appropreate win condition
/// - Parameter array: The array passed in by victoryChecker
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

/// This fuction calls the findButton fuction and the checkBingo type function
/// - Parameter sender: The UIButton that is sent from the button press
func victoryChecker(_ sender: UIButton) -> WinConition{
    
    let winningArray = findButton(sender)
    
    let winType = checkBingoType(winningArray)
    
    return winType
}

/// This function takes in a UIbutton and checks to see which arrays that buttton exists in then passes that array to victory verifier
/// - Parameter sender: The UIButton sent by VictoryChecker
func findButton(_ sender : UIButton) -> Array <UIButton> {
    
    for array in allColumns{
        for _ in array{
            if sender.backgroundColor == UIColor.lightGray{
                if vicrotyVerifier(array){
                    return array
                }
            }
        }
    }
    
    for array in allDiagonals{
        for _ in array{
            if sender.backgroundColor == UIColor.lightGray{
                if vicrotyVerifier(array){
                    return array
                }
            }
        }
    }
    
    for array in allRows{
        for _ in array{
            if sender.backgroundColor == UIColor.lightGray{
                if vicrotyVerifier(array){
                    return array
                }
            }
        }
    }
    return []
}


/// This fuction takes an array and iderates over the array to see if all of the buttons in that array have the background color of grey
/// - Parameter row: The Array passed in by findbutton
func vicrotyVerifier(_ row : Array<UIButton>) -> Bool {
    for buttons in row {
        if buttons.backgroundColor == UIColor.lightGray{
            winNumber += 1
        }
    }
    if winNumber != row.count {
        winNumber = 0
        return false
    }else{
        winNumber = 0
        return true
    }
}

func findNumber(_ num: Int) -> String{
	for array in allNumberArrays {
		for i in array{
			if i == num {
				switch array {
					case bNumbers:
					return "B"
					case iNumbers:
					return "I"
					case nNumbers:
					return "N"
					case gNumbers:
					return "G"
					case oNumbers:
					return "O"
					default:
					return "Error"
					}
				}
			}
		}
	return "Error"
}
