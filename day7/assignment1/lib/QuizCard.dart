import 'package:flutter/material.dart';

class QuizCard extends StatelessWidget {
  const QuizCard(
      {super.key,
      required this.quiz,
      required this.onCorrect,
      required this.onIncorrect});
  final Map<String, dynamic> quiz;
  final Function onCorrect;
  final Function onIncorrect;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 64),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            quiz["question"],
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            height: 16,
          ),
          ListView.builder(
              itemCount: quiz["options"].length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 8),
                  child: ElevatedButton(
                      onPressed: () {
                        if (quiz["answer"] == index + 1) {
                          onCorrect();
                        } else {
                          onIncorrect();
                        }
                      },
                      child: Text(quiz["options"][index])),
                );
              })
        ],
      ),
    );
  }
}
