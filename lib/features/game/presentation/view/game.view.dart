import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/features/game/model/game.model.dart';
import 'package:tic_tac_toe/features/game/presentation/widget/board-tile.widget.dart';
import 'package:tic_tac_toe/features/game/provider/game.provider.dart';

class GameView extends ConsumerWidget {
  const GameView({super.key});

  String getPlayerText(Player? p) {
    return p == null
        ? ''
        : p == Player.x
        ? 'X'
        : 'O';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(gameProvider);
    final notifier = ref.read(gameProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text('Tic Tac Toe')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            game.winner != null
                ? 'Winner: ${getPlayerText(game.winner)}'
                : game.isDraw
                ? 'It\'s a Draw!'
                : 'Turn: ${getPlayerText(game.currentPlayer)}',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 300,
              width: 300,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder:
                    (context, index) => BoardTile(
                      text: getPlayerText(game.board[index]),
                      onTap: () => notifier.markOnBoard(index),
                    ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: notifier.reset, child: Text('Reset Game')),
        ],
      ),
    );
  }
}
