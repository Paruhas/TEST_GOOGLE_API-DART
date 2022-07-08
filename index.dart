import "dart:math";
import "dart:io";
import 'dart:convert';

void drawTriangle() {
  print(" /|");
  print("/_|");
}

void sayHi(String? input1, int? input2) {
  print("Hi ${input1}, your age is ${input2}");
}

double addNumbers(double num1, double num2) {
  return num1 + num2;
}

List listCreate() {
  List arr = [];
  arr.add({"a": "1"});
  arr.add({"b": "1"});

  return arr;
}

String promptString(String promptText) {
  print(promptText);
  String? answer = stdin.readLineSync() ?? "No answer found.";
  return answer;
}

double promptDouble(String promptText) {
  print(promptText);
  String? prompt = stdin.readLineSync() ?? "0";
  double? answer = double.tryParse(prompt) ?? 0;
  return answer;
}

double? mathOP(double num1, double num2, String op) {
  List arr_op = ["+", "-", "*", "/"];

  double? result = null;

  if (op == arr_op[0]) {
    result = num1 + num2;
  } else if (op == arr_op[1]) {
    result = num1 - num2;
  } else if (op == arr_op[2]) {
    result = num1 * num2;
  } else if (op == arr_op[3]) {
    result = num1 / num2;
  } else if (op == arr_op[0]) {
    result = null;
  }

  return result;
}

bool guessGame(String answer, String guess) {
  if (guess == answer) {
    return true;
  } else {
    return false;
  }
}

void print_forEach(List arr, String? option) {
  if (option == null ||
      option == "" ||
      int.tryParse(option)! > 2 ||
      int.tryParse(option)! < 0) {
    option = "0";
  }

  switch (option) {
    case "0":
      for (var item in arr) {
        print(item);
      }
      break;

    case "1":
      for (var i = 0; i < arr.length; i++) {
        print(arr[i]);
      }
      break;

    case "2":
      int i = 0;
      while (i < arr.length) {
        print(arr[i]);
        i++;
      }
      break;

    default:
      print("Invalid option");
      break;
  }
}

class Book {
  Book(String aTitle, String aAuthor, int aNumPages) {
    this.title = aTitle;
    this.author = aAuthor;
    this.numPages = aNumPages;
  }

  String? title;
  String? author;
  int? numPages;
}

class Student {
  String name = "";
  double gpa = 0.0;

  Student(String aName, double aGpa) {
    this.name = aName;
    this.gpa = aGpa;
  }

  bool hasHonors() {
    return this.gpa >= 3.5;
  }
}

class MathQuestion {
  String question = "";
  double answer = 0;

  MathQuestion(String aQuestion, double aAnswer) {
    this.question = aQuestion;
    this.answer = aAnswer;
  }

  getOBJ() {
    return {"question": this.question, "answer": this.answer};
  }
}

void main() {
  List<MathQuestion> questions = [
    MathQuestion("3 + 5", 8),
    MathQuestion("10 - 8", 2),
    MathQuestion("100 / 25", 4)
  ];

  int score = 0;

  for (MathQuestion mathQuestion in questions) {
    double answer = promptDouble(mathQuestion.question);

    if (answer == mathQuestion.answer) {
      print("Correct!");
      score++;
    } else {
      print("Incorrect!, answer is ${mathQuestion.answer}");
    }
  }

  print("You got ${score} out of ${questions.length}");

  // questions.forEach((element) {
  //   print(element.getOBJ());
  // });
}
