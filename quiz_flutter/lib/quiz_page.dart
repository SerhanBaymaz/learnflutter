import 'package:flutter/material.dart';
import 'package:quiz_flutter/question_factory.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int score = 0;

  List<Icon> scoreKeeper = [];
  QuestionFactory questionFactory = QuestionFactory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text(
                          "Are you sure you want to reset the score?"),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("No")),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: const Text("Yes")),
                      ],
                    ));
          },
        ),
        title: const Text('Pick the correct answer'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          color: Colors.grey[300],
          child: const Center(
            child: Text(
              "© 2023 - Serhan's Quiz App",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    questionFactory.getQuestionText(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 3,
                child: Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          Text(
                            "Score: $score",
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Remaining: ${questionFactory.getRemainingQuestions()}",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      )),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: (scoreKeeper.length / 5)
                              .ceil(), // Calculate the number of rows needed

                          itemBuilder: (BuildContext context, int rowIndex) {
                            // Calculate the starting and ending index for each row
                            int startIndex = rowIndex * 5;
                            int endIndex = (startIndex + 5) < scoreKeeper.length
                                ? (startIndex + 5)
                                : scoreKeeper.length;

                            // Create a row containing 5 icons or less, if it's the last row
                            return Row(
                              children:
                                  scoreKeeper.sublist(startIndex, endIndex),
                            );
                          },
                          scrollDirection: Axis
                              .vertical, // Set this to vertical since we're creating rows
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                )),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildElevatedButton("TRUE", Colors.green),
                  buildElevatedButton("FALSE", Colors.red),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton buildElevatedButton(String text, Color color) {
    bool realAnswer = questionFactory.getQuestionAnswer();
    String realAnswerString = realAnswer.toString();

    String userAnswerString = text.toLowerCase();

    return ElevatedButton(
      onPressed: () {
        setState(() {
          if (realAnswerString == userAnswerString) {
            score++;
            scoreKeeper.add(
              const Icon(
                Icons.check,
                color: Colors.green,
              ),
            );
          } else {
            score--;
            scoreKeeper.add(
              const Icon(
                Icons.close,
                color: Colors.red,
              ),
            );
          }
          questionFactory.nextQuestion();
          if (questionFactory.isFinished() == true) {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => AlertDialog(
                      title: const Text("Quiz is finished!"),
                      content: Text("Your score is $score"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.pushNamed(context, '/main');
                            },
                            child: const Text("OK")),
                      ],
                    ));
          }
        });
      },
      style: ElevatedButton.styleFrom(
        primary: color,
        minimumSize: const Size(160, 70),
        elevation: 10,
        textStyle: const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Text(text),
    );
  }
}
