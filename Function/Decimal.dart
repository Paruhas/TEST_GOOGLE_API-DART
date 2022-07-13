import "dart:math";
import 'package:decimal/decimal.dart';

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
        int input1_decreaseLength = input1.length - 1;

        res = double.parse(
                Decimal_OBJ["mul"](input1_decreaseLength, -1).toString())
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
