import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/features/game/controller/game.controller.dart';
import 'package:tic_tac_toe/features/game/model/game.model.dart';

final gameControllerProvider = Provider((ref) => GameController());

final gameProvider = StateNotifierProvider<GameNotifier, GameModel>((ref) {
  final controller = ref.read(gameControllerProvider);
  return GameNotifier(controller);
});

class GameNotifier extends StateNotifier<GameModel> {
  final GameController controller;

  GameNotifier(this.controller)
    : super(
        GameModel(
          board: List.filled(9, null),
          currentPlayer: Player.x,
          winner: null,
          isDraw: false,
        ),
      );

  void markOnBoard(int index) {
    state = controller.markOnBoard(state, index);
  }

  void reset() {
    state = controller.resetGame();
  }
}
