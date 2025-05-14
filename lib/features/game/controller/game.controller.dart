import 'package:tic_tac_toe/features/game/model/game.model.dart';

class GameController {
  GameModel markOnBoard(GameModel game, int index) {
    if (game.board[index] != null || game.winner != null) {
      return game;
    }

    final newBoard = [...game.board];
    newBoard[index] = game.currentPlayer;

    final winner = _checkWinner(newBoard);
    final isDraw = !newBoard.contains(null) && winner == null;

    return game.copyWith(
      board: newBoard,
      currentPlayer: game.currentPlayer == Player.x ? Player.o : Player.x,
      winner: winner,
      isDraw: isDraw,
    );
  }

  GameModel resetGame() {
    return GameModel(
      board: List.filled(9, null),
      currentPlayer: Player.x,
      winner: null,
      isDraw: false,
    );
  }

  Player? _checkWinner(List<Player?> board) {
    const winPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var pattern in winPatterns) {
      final a = pattern[0], b = pattern[1], c = pattern[2];
      if (board[a] != null && board[a] == board[b] && board[b] == board[c]) {
        return board[a];
      }
    }
    return null;
  }
}
