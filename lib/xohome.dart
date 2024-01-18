import 'package:flutter/material.dart';
import 'package:xogame/gameBtn.dart';
import 'package:xogame/names_model.dart';

class XoHome extends StatefulWidget {
  const XoHome({super.key});

  @override
  State<XoHome> createState() => _XoHomeState();
  static const String routeName="home";

}

class _XoHomeState extends State<XoHome> {

  List<String> board = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  int score1 = 0;
  int score2 = 0;
  @override
  Widget build(BuildContext context) {
    var args= ModalRoute.of(context)?.settings.arguments as NamesModel;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("XO"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [ Text(args.name1 ), Text("$score1")],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [ Text(args.name2), Text("$score2")],
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameBtn(board[0], onBtnClick, 0),
                GameBtn(board[1], onBtnClick, 1),
                GameBtn(board[2], onBtnClick, 2),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameBtn(board[3], onBtnClick, 3),
                GameBtn(board[4], onBtnClick, 4),
                GameBtn(board[5], onBtnClick, 5),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameBtn(board[6], onBtnClick, 6),
                GameBtn(board[7], onBtnClick, 7),
                GameBtn(board[8], onBtnClick, 8),
              ],
            ),
          )
        ],
      ),
    ));
  }
  int playTurn = 1;

  onBtnClick(index) {
    if (board[index].isNotEmpty) return;
    if (playTurn.isOdd) {
      board[index] = "X";
      bool win=checkWin("X");
      if(win) {
        resetBoard();
        score1++;

      }

    } else {
      board[index] = "O";
      if(checkWin("O")){score2++;
      resetBoard();}

    }
if(playTurn>=9){
  resetBoard();

}
    setState(() {});

    playTurn++;
  }

  checkWin(String symbol) {
    for (int i = 0; i < board.length; i + 3) {
      if (board[i] == symbol && board[i + 1] == symbol && board[i + 2] == symbol) {

        return true;
      }

    }
    for (int i = 0; i < 3; i++) {
      if (board[i] == symbol && board[i + 3] == symbol && board[i + 6] == symbol)
      {
        return true;
      }
    }
    if (board[0] == symbol && board[4] == symbol && board[8] == symbol) {
      return true;
    }
    if (board[2] == symbol && board[4] == symbol && board[6] == symbol) {
      return true;
    }
    return false;
  }

  resetBoard() {
    board = [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
    ];
    playTurn = 0;
  }
}
