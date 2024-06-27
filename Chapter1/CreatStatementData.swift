//
//  CreatStatementData.swift
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

func createStatementData(playDictionary: [String: Play], invoice: Invoice) -> Statement {
        
    let statement = Statement()
    statement.customer = invoice.customer
    statement.performances = invoice.performances.map(enrichiPerformance)
    statement.totalAmount = totalAmount()
    statement.totalCredicts = totalVolumeCredits()

    return statement
    
    // MARK: - inline func
    func enrichiPerformance(performance: Show) -> Show {
        
        let calculator = createPerformanceCalculator(performance: performance, play: returnPlay(playId: performance.playID) ?? Play(playID: "", name: "", type: ""))
        
        var show = performance.copy()
        show.play = calculator.play
        show.amount = calculator.amount()
        show.volumeCredicts = calculator.volumCredicts()
        
        return show
    }
    
    func returnPlay(playId: String) -> Play? {
        return playDictionary[playId]
    }
        
    func totalAmount() -> Int {
            
        return statement.performances.reduce(0) { $0 + $1.amount }
    }
    
    func totalVolumeCredits() -> Int {

        return statement.performances.reduce(0) { $0 + $1.volumeCredicts }
    }
}
