import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islem_dukkani/Questions.dart';
import 'package:islem_dukkani/question.dart';
import '../../core/reusable_widgets/label_text.dart';
import 'home_page.dart';
import '../../core/reusable_widgets/alert_dialog.dart';

ManyQuestions manyQuestions = ManyQuestions();

class GamePage extends StatefulWidget {
  final String userName;
  final int? gameEndTime;
  final bool? lowLevel;
  final bool? mediumLevel;
  final bool? hardLevel;

  GamePage({
    Key? key,
    required this.userName,
    this.gameEndTime,
    this.mediumLevel,
    this.hardLevel,
    this.lowLevel,
  }) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage>
    with SingleTickerProviderStateMixin {
  int step = 0;
  int point = 0;
  late Timer _timer;
  late int _remainingTime;
  bool _startAnimationButtonVisible = true;
  Map<String, Color> optionColors = {
    "A": Colors.blue[100]!,
    "B": Colors.blue[100]!,
    "C": Colors.blue[100]!,
    "D": Colors.blue[100]!,
  };

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.gameEndTime ?? 0;
    _changeQuestion();
  }

  void _startAnimation() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        timer.cancel();
        _showResultDialog();
      }
    });
  }

  void _changeQuestion() {
    setState(() {
      if (widget.lowLevel!) {
        step = Random().nextInt(19) + 1;
      } else if (widget.mediumLevel!) {
        step = Random().nextInt(9) + 31;
      } else if (widget.hardLevel!) {
        step = Random().nextInt(9) + 20;
        step++;
      }
      // Reset option colors
      optionColors = {
        "A": Colors.blue[100]!,
        "B": Colors.blue[100]!,
        "C": Colors.blue[100]!,
        "D": Colors.blue[100]!,
      };
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int minutes = _remainingTime ~/ 60;
    int seconds = _remainingTime % 60;

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            backgroundColor: Colors.teal,
            title: LabelText(text: widget.userName),
            actions: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelText(text: "Toplam Puaniniz : $point"),
                    LabelText(
                        text:
                            "Oyun Süresi : ${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}"),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (!_startAnimationButtonVisible) stopAnimation,
              const SizedBox(height: 15),
              if (_startAnimationButtonVisible) startGame,
            ],
          ),
          body: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pink,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 6.0,
                      ),
                    ],
                    color: Colors.red[100],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 120,
                  width: 500,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        manyQuestions.questionBank[step].question,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              buildOption("A", manyQuestions.questionBank[step].aSikki),
              buildOption("B", manyQuestions.questionBank[step].bSikki),
              buildOption("C", manyQuestions.questionBank[step].cSikki),
              buildOption("D", manyQuestions.questionBank[step].dSikki),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOption(String label, String text) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: () {
          setState(() {
            String kontrol = manyQuestions.questionBank[step].answer;
            if (text == kontrol) {
              point += 10;
              optionColors[label] = Colors.green;
            } else {
              point -= 10;
              optionColors[label] = Colors.red;
            }
            _changeQuestion();
          });
        },
        child: Container(
          height: 20,
          width: 200,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.blue,
                offset: Offset(0.0, 1.0),
                blurRadius: 6.0,
              ),
            ],
            color: optionColors[label],
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              "$label: $text",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }

  Widget get stopAnimation => FloatingActionButton.extended(
        heroTag: "stop",
        backgroundColor: Colors.red,
        icon: Icon(Icons.stop, color: Colors.white),
        onPressed: () {
          _timer.cancel();
          _showResultDialog();
        },
        label: const LabelText(text: 'stop'),
      );

  Widget get startGame => FloatingActionButton.extended(
        backgroundColor: Colors.teal,
        heroTag: 'start',
        onPressed: () {
          _startAnimation();
          setState(() {
            _startAnimationButtonVisible = false;
          });
        },
        label: const LabelText(text: 'Start'),
        icon: const Icon(Icons.play_circle_filled),
      );

  void _showResultDialog() {
    String message;
    if (point > 50) {
      message = 'Tebrikler!';
    } else if (point == 50) {
      message = 'Daha iyisini yapabilirsin';
    } else {
      message = 'Daha çok çalışmalısın!!';
    }

    ShowCustomDialogBox.showAlertDialogWithAction(
      context: context,
      title: 'Oyun Bitti',
      message: 'Oyun Sonuçları: $message',
      content: 'Puanınız : $point',
      rightButtonOnPressed: () => Get.offAll(HomePage()),
    );
  }
}
