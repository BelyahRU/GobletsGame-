//
//  Levels.swift
//  GobletsGame
//
//  Created by Александр Андреев on 23.07.2023.
//



struct LevelLayout {
    let layout: [[CupColor]]
}

let level1 = LevelLayout(layout: [
    [.white, .white, .white],
    [.white, .empty, .white],
    [.gold, .empty, .white],
    [.white, .white, .white]
])

let level2 = LevelLayout(layout: [
    [.white, .white, .white],
    [.white, .white, .empty],
    [.gold, .white, .empty],
    [.white, .white, .empty],
    [.white, .white, .empty],
])

let level3 = LevelLayout(layout: [
    [.white, .white, .white],
    [.white, .white, .empty],
    [.empty, .white, .empty],
    [.white, .white, .empty],
    [.white, .white, .gold],
])

let level4 = LevelLayout(layout: [
    [.white, .white, .white],
    [.white, .empty, .white],
    [.white, .white, .gold],
    [.white, .white, .empty],
    [.white, .white, .empty],
])

let level5 = LevelLayout(layout: [
    [.white, .white, .white],
    [.white, .white, .white],
    [.white, .white, .white],
    [.white, .white, .white],
    [.white, .gold, .empty],
])

let level6 = LevelLayout(layout: [
    [.white, .white, .white],
    [.white, .white, .white],
    [.empty, .white, .gold],
    [.empty, .white, .white],
    [.empty, .white, .white],
])


