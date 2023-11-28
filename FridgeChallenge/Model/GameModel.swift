//
//  GameModel.swift
//  FridgeChallenge
//
//  Created by Quest76 on 26.11.2023.
//

import Foundation

class GameModel: ObservableObject {
  @Published var board: [[Bool]]
  @Published var moves: Int
  
  var isSolved: Bool {
    self.board.allSatisfy { $0.allSatisfy { $0 == true }}
  }
  
  init() {
    self.board = Array(repeating: Array(repeating: true, count: 4), count: 5)
    self.moves = 0
  }
  
  func flip(x: Int, y: Int) {
    for i in 0...3 {
      if i != x {
        self.board[y][i].toggle()
      }
    }
    for i in 0...4 {
      self.board[i][x].toggle()
    }
    
    self.moves += 1
  }
  
  func shuffle() {
    for _ in 0...100 {
      let x = Int.random(in: 0...3)
      let y = Int.random(in: 0...4)
      
      self.flip(x: x, y: y)
    }
  }
  
  func reset() {
    self.shuffle()
    self.moves = 0
  }
}

