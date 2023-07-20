import 'package:quiz_flutter/question.dart';

class QuestionFactory {
  List<Question> _questionBank = [
    Question("Is the Earth round?", true),
    Question("Do all mammals lay eggs?", false),
    Question("Is the sun a star?", true),
    Question("Is the Pacific Ocean the largest ocean on Earth?", true),
    Question("Is London the capital of Germany?", false),
    Question("Do penguins live in the Arctic?", false),
    Question("Is the chemical formula for oxygen 'O2'?", true),
    Question("Is the Great Wall of China visible from space?", false),
    Question("Is the human body made up mostly of water?", true),
    Question("Do all birds have feathers?", true),
    Question("Is the Sahara Desert the largest desert in the world?", false),
    Question("Do plants perform photosynthesis during the night?", false),
    Question("Is the Statue of Liberty located in Los Angeles?", false),
    Question("Is the speed of light faster than the speed of sound?", true),
    Question("Is the iPhone made by Microsoft?", false),
    Question("Is the Earth the third planet from the sun?", true),
    Question("Do all spiders produce webs?", false),
    Question("Is the chemical symbol for gold 'Ag'?", false),
    Question("Is Antarctica the coldest continent on Earth?", true),
    Question("Do all cells in the human body have a nucleus?", false),
    Question("Is the human body made up of 70% water?", true),
    Question("Is the Nile River the longest river in the world?", true),
    Question("Do all mammals have hair or fur?", true),
    Question("Is the speed of sound faster in water than in air?", true),
    Question("Do elephants have four knees?", false),
    Question("Is the Mona Lisa located in the Louvre Museum?", true),
    Question("Are all cacti native to deserts?", true),
    Question("Is the chemical symbol for helium 'He'?", true),
    Question("Do all birds fly?", false),
    Question("Is Mount Everest the highest point on Earth?", true),
    Question("Is Pluto considered a planet?", false),
    Question("Do all human babies have blue eyes at birth?", false),
    Question(
        "Is the Amazon rainforest the largest rainforest in the world?", true),
    Question("Do all living organisms require oxygen to survive?", false),
    Question("Is the Eiffel Tower located in Barcelona?", false),
    Question("Do all snakes lay eggs?", false),
    Question("Is the chemical symbol for carbon dioxide 'CO'", false),
    Question("Is the Sahara Desert expanding?", true),
    Question("Do all planets in our solar system have moons?", false),
    Question("Is the Sydney Opera House in Australia?", true),
    Question("Do all spiders produce venom?", false),
    Question("Is the human brain responsible for controlling bodily functions?",
        true),
    Question("Do all mammals give live birth?", false),
    Question("Is the chemical symbol for iron 'Fe'?", true),
    Question("Is the Sahara Desert larger than the United States?", false),
    Question("Do all flowers produce nectar?", false),
    Question(
        "Is the Pacific Ring of Fire an area known for frequent earthquakes and volcanic eruptions?",
        true),
    Question("Do all living organisms undergo photosynthesis?", false),
    Question("Is the Arctic Circle located at the North Pole?", true),
    Question("Do all insects have wings?", false),
    Question("Is the chemical symbol for water 'H2O'?", true),
    Question("Do all species of penguins live in cold climates?", false),
    Question("Is the Sahara Desert covered in sand dunes?", true),
    Question("Do all mammals have mammary glands?", true),
    Question("Is the planet Mercury the closest to the sun?", true),
    Question("Do all birds lay eggs?", true),
    Question("Is the chemical symbol for nitrogen 'N'", true),
    Question("Do all reptiles lay eggs?", false),
    Question("Is the Yellowstone National Park located in Canada?", false),
    Question("Do all fruits have seeds?", false),
    Question("Is the chemical symbol for sodium 'Na'?", true),
  ];

  int _questionNumber = 0;
  bool _isFinished = false;

  // Getters for encapsulation
  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  int getQuestionBankLength() {
    return _questionBank.length;
  }

  bool isFinished() {
    return _isFinished;
  }

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    } else {
      _isFinished = true;
    }
  }
}
