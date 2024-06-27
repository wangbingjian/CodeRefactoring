//
//  Class.swift
//  CodeRefatoring
//
//  Created by hatsune miku on 2024/6/19.
//

import Foundation

enum PerformanceError: Error {
    case noPerformanceType (String)
}

func createPerformanceCalculator(performance: Show, play: Play) -> PerformanceCalculator {
    
    switch play.type {
    case "tragedy":
        return TragedyCalculator(performance: performance, play: play)
    case "comedy":
        return ComedyCalculator(performance: performance, play: play)
    default:
        //throw PerformanceError.noPerformanceType("no performance error")
        return UnknownCalculator(performance: performance, play: play)
    }
}

protocol PerformanceCalculator {
    var performance: Show { get set }
    var play: Play { get set }
    
    func amount() -> Int
    func volumCredicts() -> Int
}

extension PerformanceCalculator {
    
    func amount() -> Int {
        return 0
    }
    
    func volumCredicts() -> Int {
        return 0
    }
}

struct TragedyCalculator: PerformanceCalculator {
    
    var performance: Show
    var play: Play
    
    init(performance: Show, play: Play) {
        self.performance = performance
        self.play = play
    }
    
    func amount() -> Int {
        
        var result = 40000
        if performance.audience > 30 {
            result += 1000 * (performance.audience - 30)
        }

        return result
    }
    
    func volumCredicts() -> Int {
        return max(performance.audience - 30, 0)
    }
}

struct ComedyCalculator: PerformanceCalculator {
    
    var performance: Show
    var play: Play
    
    init(performance: Show, play: Play) {
        self.performance = performance
        self.play = play
    }
    
    func amount() -> Int {
        var result = 30000
        
        if performance.audience > 20 {
            result += 10000 + 500 * (performance.audience - 20)
        }
        result += 300 * performance.audience

        return result
    }
    
    func volumCredicts() -> Int {
        
        var result = max(performance.audience - 30, 0)
        
        if play.type == "comedy" {
            result += performance.audience / 5
        }
        
        return result
    }
}

struct UnknownCalculator: PerformanceCalculator {
    
    var performance: Show
    
    var play: Play
    
    init(performance: Show, play: Play) {
        self.performance = performance
        self.play = play
    }
}
