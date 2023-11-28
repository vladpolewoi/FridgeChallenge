import SwiftUI

struct BoardView: View {
    @StateObject private var gameModel = GameModel()
    
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    Text("0:25")
                        .font(.system(size: 54, weight: .bold).monospaced())
                  Text("\(gameModel.moves) moves")
                        .foregroundStyle(.gray)
                        
                }
                HStack {
                    Spacer()
                    
                    Button {
                      gameModel.reset()
                    } label: {
                        Image(systemName: "arrow.clockwise.circle")
                            .font(.system(size: 32))
                            .foregroundColor(.orange)
                    }
                    .controlSize(.large)
                    
                }.padding()
            }
            
            Spacer()
            
          if gameModel.isSolved {
            Text("Completed")
              .font(.system(size: 22,weight: .bold, design: .rounded))
                .foregroundStyle(.oceanMedium)
          } else {
            Text("Make all squares green")
                .font(.system(size: 22, design: .rounded))
                .foregroundStyle(.gray)
          }
            
            
            VStack(spacing: 5) {
                ForEach(0 ..< 5) { row in
                    HStack(alignment: .center, spacing: 5) {
                        ForEach(0 ..< 4) { col in
                            Button {
                                gameModel.flip(x: col, y: row)
                            } label:  {
                                PadView(isFlipped: $gameModel.board[row][col])
                            }
                            .aspectRatio(contentMode: .fit)
                            
                        }
                        
                    }
                }
            }.padding(30)
            
            Spacer()
        }.padding()
    }
}

#Preview {
    BoardView()
}
