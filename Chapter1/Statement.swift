//
//  Statement.swift
//  CodeRefatoring
//
//  Created by hatsune miku on 2024/6/25.
//

/*
 Statement for BigCo
 Hamlet: 650.00 (55 seats)
 As You Like It: 580.00 (35 seats)
 Othello: 500.00 (40 seats)
 Amount owed is 1730.00
 You earned 47 credits
 */

import Foundation

func statement(playDictionary: [String: Play], invoice: Invoice) -> String {
    
    return renderPlainText(data: createStatementData(playDictionary: playDictionary, invoice: invoice))
}
    
func renderPlainText(data: Statement) -> String {
    
    var result = "Statement for \(data.customer)\n"
    
    let performances = data.performances
    
    for performance in performances {
        
        guard let play = performance.play else { continue }
                    
        result += "\(play.name): \(performance.amount/100).00 (\(performance.audience) seats)\n"
    }
    
    result += "Amount owed is \(data.totalAmount/100).00\n"
    result += "You earned \(data.totalCredicts) credits\n"
            
    return result
}
