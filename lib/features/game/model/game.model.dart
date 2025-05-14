enum Player { x, o }

class GameModel {
  final List<Player?> board;
  final Player currentPlayer;
  final Player? winner;
  final bool isDraw;

  GameModel({
    required this.board,
    required this.currentPlayer,
    required this.winner,
    required this.isDraw,
  });

  GameModel copyWith({
    List<Player?>? board,
    Player? currentPlayer,
    Player? winner,
    bool? isDraw,
  }) {
    return GameModel(
      board: board ?? this.board,
      currentPlayer: currentPlayer ?? this.currentPlayer,
      winner: winner ?? this.winner,
      isDraw: isDraw ?? this.isDraw,
    );
  }
}
