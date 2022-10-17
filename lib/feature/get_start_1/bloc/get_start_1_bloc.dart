import 'package:bloc/bloc.dart';
import 'package:chat_ui/feature/get_start_1/bloc/get_start_1_states.dart';
import 'package:chat_ui/models/robot_asks_question.dart';
import 'package:chat_ui/models/robot_message_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mit_x/mit_x.dart';

class GetStart1Bloc extends Cubit<GetStart1States> {
  GetStart1Bloc() : super(InitGetStart1());
  static GetStart1Bloc get(BuildContext context) => BlocProvider.of(context);
  final List<RobotMessageModel> robotMessageModel = [
    RobotMessageModel(message: "Hi, Whats Your First Name?".tr, fromMe: false),
  ];

  final List<RobotAsksQuestionCategory> robotAsksQuestionCategory = [
    RobotAsksQuestionCategory(question: "Security".tr),
    RobotAsksQuestionCategory(question: "Supply Chain".tr),
    RobotAsksQuestionCategory(question: "Information Technology".tr),
    RobotAsksQuestionCategory(question: "Human Resource".tr),
    RobotAsksQuestionCategory(question: "Business Research".tr),
  ];

  late String firstName;
  late String lastName;
  int nexQuestion = 0;
  void addRobotMessage(
      {required TextEditingController sendMessage, required bool fromMe}) {
    robotMessageModel
        .add(RobotMessageModel(message: sendMessage.text, fromMe: fromMe));
    if (nexQuestion == 0) {
      firstName = sendMessage.text;
      robotMessageModel.add(RobotMessageModel(
          message:
              "${"Ok".tr}${",".tr} $firstName ${"Whats Your Last Name?".tr}",
          fromMe: false));
    } else if (nexQuestion == 1) {
      lastName = sendMessage.text;
      robotMessageModel.add(RobotMessageModel(
          message:
              "${"Mr".tr} $firstName $lastName ${",".tr} ${"What's your Title?".tr}",
          fromMe: false));
    } else if (nexQuestion == 2) {
      robotMessageModel.add(RobotMessageModel(
          message: "What Categories you will need expert In?".tr,
          fromMe: false));
    } else if (nexQuestion == 3) {
      sendMessage.text = "";
      emit(EndQuestionGetStart1());
      return;
    }

    sendMessage.text = "";
    nexQuestion++;
    emit(NextQuestionGetStart1());
  }
}
