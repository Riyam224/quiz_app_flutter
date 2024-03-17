// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:task6/models/quiz_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // todo question 3/4 logic
  List<Question> questionList = getQuestion();
  int currentQues = 0;
  Answer? selectedAnswer;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            Text(
              'Simple Quiz App',
              style: TextStyle(
                fontFamily: 'Molengo',
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Question ${currentQues + 1} / ${questionList.length}',
                  style: const TextStyle(
                    fontFamily: 'Molengo',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                  ),
                ),
              ),
            ),
            // todo
            const SizedBox(
              height: 50,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      child: Text(
                        '${questionList[currentQues].questionText}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Molengo',
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                const Positioned(
                  top: -12,
                  right: 0,
                  left: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    child: Icon(
                      size: 45,
                      Icons.check,
                      color: Colors.green,
                    ),
                  ),
                ),

                // todo half circle  in the left
                Transform.rotate(
                  angle: 1.57,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 32, bottom: 32),
                    child: Container(
                      height: 30,
                      width: 50,
                      color: Colors.transparent,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // todo simi circle  in the right
                Positioned(
                  right: 0.02,
                  child: Transform.rotate(
                    angle: -1.57,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 30.0),
                      child: Container(
                          width: 50,
                          height: 30,
                          color: Colors.transparent,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40),
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            // todo
            Column(
              children: [
                for (Answer answer in questionList[currentQues].answerList)
                  // todo
                  AnswerButton(answer),
              ],
            ),
            SizedBox(
              height: 30,
            ),

            // todo next button
            nextButton(),
          ],
        ),
      ),
    );
  }

// todo*********
  AnswerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;

    return Container(
      margin: EdgeInsets.all(10),
      width: 250,
      height: 60,
      child: MaterialButton(
        // todo
        color:
            isSelected ? Color(0xffffa827) : Color.fromARGB(255, 236, 224, 224),
        shape: isSelected
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: Colors.black,
                  width: 2.0,
                ),
              )

            // todo
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
        onPressed: () {
          setState(() {
            selectedAnswer = answer;
          });
        },

        child: Text(
          '${answer.AnswerText}',
          style: TextStyle(
            fontSize: 20,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

// todo next button
  nextButton() {
    // todo
    bool isLastQues = false;
    if (currentQues == questionList.length - 1) {
      isLastQues = true;
    }
    return Container(
        margin: EdgeInsets.all(10),
        width: 350,
        height: 55,
        decoration: BoxDecoration(
          color: Color(0xffe0e0e0),
          borderRadius: BorderRadius.circular(30),
        ),
        child: MaterialButton(
            // todo
            onPressed: () {
              if (selectedAnswer!.isCorrect) {
                score++;
              }
              // todo
              if (selectedAnswer == null) {
              } else {
                if (isLastQues) {
                  bool isPassed = false;
                  if (score >= questionList.length * 0.5) {
                    isPassed = true;
                  }
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          title: Center(
                            child: Text(
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: score >= questionList.length * 0.5
                                      ? Color(0xff649b6a)
                                      : Colors.red,
                                ),
                                "${isPassed ? 'Passed' : 'Failed'} | Score is $score"),
                            // todo
                          ),
                          content: Padding(
                            padding: const EdgeInsets.only(
                                left: 60, right: 60, top: 20),
                            child: MaterialButton(
                                color: Colors.black,
                                minWidth: 14,
                                height: 80,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'Restart',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                onPressed: () {
                                  // todo
                                  setState(() {
                                    Navigator.pop(context);
                                    currentQues = 0;
                                    selectedAnswer = null;
                                    score = 0;
                                  });
                                }),
                          ),
                        );
                      });
                } else {
                  setState(() {
                    selectedAnswer = null;
                    currentQues++;
                  });
                }
              }
            },
            child: Text(
              isLastQues ? 'Submit' : 'Next',
              style: TextStyle(
                fontSize: 30,
              ),
            )));
  }
}
