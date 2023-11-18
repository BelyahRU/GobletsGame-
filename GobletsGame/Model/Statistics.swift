//
//  Statistics.swift
//  GobletsGame
//
//  Created by Александр Андреев on 22.07.2023.
//

import Foundation
class Statistics {
    
    public static let shared = Statistics()
    
    public var resultsArray = [Result]()
    
    private init() {
        generateArray()
    }
    
    private func generateArray() {
        resultsArray.append(Result(name: "KITTI", time: "00:21"))
        resultsArray.append(Result(name: "PIGGY", time: "00:34"))
        resultsArray.append(Result(name: "MAGGY", time: "01:09"))
        resultsArray.append(Result(name: "SWEN", time: "01:12"))
        resultsArray.append(Result(name: "FFFFF", time: "01:14"))
        resultsArray.append(Result(name: "MIRROR", time: "01:16"))
        resultsArray.append(Result(name: "FLAY", time: "01:18"))
        resultsArray.append(Result(name: "BAND", time: "01:20"))
        resultsArray.append(Result(name: "FLAFFY", time: "01:22"))
        resultsArray.append(Result(name: "QWERTY", time: "01:24"))
    }
    
}

struct Result {
    var name: String
    var time: String
}
