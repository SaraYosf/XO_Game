import 'package:flutter/material.dart';

class GameBtn extends StatefulWidget {
  String txt;
  Function onBtnClick;
  int index;
  GameBtn(this.txt, this.onBtnClick,this.index, {super.key});

  @override
  State<GameBtn> createState() => _GameBtnState();
}

class _GameBtnState extends State<GameBtn> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ElevatedButton(
          onPressed: () {
            widget.onBtnClick(widget.index);
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(width: 3, color: Colors.white))),
          child: Text(
            widget.txt,
            style: const TextStyle(fontSize: 30),
          ),
        ));
  }
}
