import 'dart:js_util';
import "dart:math";
import "dart:io";
import 'dart:convert';
import 'package:decimal/decimal.dart';

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

final parseToDecimal = (input) {
  if (input is String) {
    return Decimal.parse(input);
  } else {
    return Decimal.parse(input.toString());
  }
};

final d = Decimal.parse;

Map Decimal_OBJ = {
  "changeInput": (input) {
    if (input == null) {
      return Decimal.parse("0");
    } else if (input is String) {
      return Decimal.parse(input);
    } else {
      return Decimal.tryParse(input.toString()) ?? Decimal.parse("0");
    }
  },
  "plus": (dynamic input1, dynamic input2) {
    input1 = Decimal_OBJ["changeInput"](input1 ?? 0);
    input2 = Decimal_OBJ["changeInput"](input2 ?? 0);

    dynamic res = input1 + input2;
    res = double.tryParse(res.toString()) ?? 0;

    return res;
  },
  "minus": (input1, input2) {
    input1 = Decimal_OBJ["changeInput"](input1 ?? 0);
    input2 = Decimal_OBJ["changeInput"](input2 ?? 0);

    dynamic res = input1 - input2;
    res = double.tryParse(res.toString()) ?? 0;

    return res;
  },
  "mul": (input1, input2) {
    input1 = Decimal_OBJ["changeInput"](input1 ?? 0);
    input2 = Decimal_OBJ["changeInput"](input2 ?? 0);

    dynamic res = input1 * input2;
    res = double.tryParse(res.toString()) ?? 0;

    return res;
  },
  "div": (input1, input2) {
    input1 = Decimal_OBJ["changeInput"](input1 ?? 0);
    input2 = Decimal_OBJ["changeInput"](input2 ?? 0);

    dynamic res = input1 / input2;

    if (res.toString().indexOf("/") != -1) {
      input1 = double.tryParse(res.toString().split("/")[0]) ?? 0;
      input2 = double.tryParse(res.toString().split("/")[1]) ?? 0;
    }

    res = input1 / input2;

    res = double.tryParse(res.toString()) ?? 0;

    return res;
  },
  "abs": (input) {
    input = Decimal_OBJ["changeInput"](input ?? 0);

    dynamic res = (double.tryParse(input.toString()) ?? 0).abs();
    res = double.parse(res.toStringAsFixed(8));

    return res;
  },
  "roundDownNumber": (input1, input2) {
    input1 = Decimal_OBJ["changeInput"](input1 ?? 0);
    input2 = Decimal_OBJ["changeInput"](input2 ?? 0);

    dynamic res = (double.tryParse(input1.toString()) ?? 0);
    input2 = int.tryParse(input2.toString()) ?? 0;
    num input2_abs = input2.abs();

    if (input2.toString().split("")[0] == "-") {
      num digit = pow(10, input2_abs);

      res = double.parse(res.toString());
      res = res.floor();
      res = Decimal_OBJ["div"](res, digit);
      res = res.floor();
      res = Decimal_OBJ["mul"](res, digit);
    }
    if (input2 == 0) {
      res = res.floor();
    } else {
      num decimal = pow(10, input2_abs);

      res = double.parse(res.toString());
      res = Decimal_OBJ["mul"](res, decimal);
      res = res.floor();
      res = Decimal_OBJ["div"](res, decimal);
    }

    return res;
  },
  "OP": (input1, input2, input3) {
    input1 = Decimal_OBJ["changeInput"](input1 ?? 0);
    input2 = Decimal_OBJ["changeInput"](input2 ?? 0);

    bool res = false;

    switch (input3) {
      case ">":
        res = input1 > input2;
        break;

      case ">=":
        res = input1 >= input2;
        break;

      case "<":
        res = input1 < input2;
        break;

      case "<=":
        res = input1 <= input2;
        break;

      case "=":
        res = input1 = input2;
        break;

      case "!=":
        res = input1 != input2;
        break;

      default:
        print("Invalid operator");
        break;
    }

    return res;
  },
  "getAllowDecimal": (input1) {
    input1 = Decimal_OBJ["changeInput"](input1 ?? 0);

    input1 = input1.toString();
    List input1_splitBySpace = input1.split("");

    dynamic res = 0;

    int i = 0;
    bool hasDot = false;
    while (i < input1_splitBySpace.length) {
      if (input1_splitBySpace[i] == ".") {
        hasDot = true;
      }

      i++;
    }

    switch (hasDot) {
      case true:
        res = input1.split(".")[1].length;
        break;

      case false:
        int input1_decreasLength = input1.length - 1;

        res = double.parse(
                Decimal_OBJ["mul"](input1_decreasLength, -1).toString())
            .toInt();
        break;

      default:
        break;
    }

    return res;
  },
  "roundNumber": (input1) {
    input1 = Decimal_OBJ["changeInput"](input1 ?? 0);

    dynamic res = (double.tryParse(input1.toString()) ?? 0);
    res = double.parse(res.toStringAsFixed(0));

    return res;
  },
  "roundNumber_decimal": (input1, input2) {
    input1 = Decimal_OBJ["changeInput"](input1 ?? 0);
    input2 = Decimal_OBJ["changeInput"](input2 ?? 0);

    input2 = int.tryParse(input2.toString()) ?? 0;

    dynamic res = (double.tryParse(input1.toString()) ?? 0);
    res = double.parse(res.toStringAsFixed(input2));

    return res;
  },
};

class Location_OBJ {
  late Map location;
  dynamic latitude;
  dynamic longitude;

  Location_OBJ(aLatitude, aLongitude) {
    this.location = {
      "latitude": aLatitude,
      "longitude": aLongitude,
    };
  }

  @override
  String toString() {
    return 'location: ${location}';
  }

  bool isMap() {
    return true;
  }
}

Map Validator_OBJ = {};

void main() {}
