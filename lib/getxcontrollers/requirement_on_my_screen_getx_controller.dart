import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qurb/controllers/get_quetions_api.dart';
import 'package:qurb/controllers/get_quetions_on_my_api.dart';
import 'package:qurb/controllers/submit_answer_api.dart';
import 'package:qurb/controllers/submit_answer_on_my_api.dart';
import 'package:qurb/models/option_model.dart';
import 'package:qurb/models/question_model.dart';
import 'package:qurb/models/response_model.dart';
import 'package:qurb/models/user_model.dart';
import 'package:qurb/screens/home_screen.dart';
import 'package:qurb/screens/regesteration_screen.dart';

import '../components/my_buttons.dart';
import '../constant.dart';
import '../screens/requirement_end_screen.dart';

class RequrementOnMyScreenGetXController extends GetxController {
  RxBool isLoading = false.obs;
  List<QuestionModel> questions = [];
  RxInt currentIndex = 0.obs;
  QuestionModel? currentQuestion;
  Map<String, dynamic> answers = {};
  UserModel userModel =
      UserModel.fromMap(GetIt.I.get<GetStorage>().read('userModel'));

  @override
  void onInit() async {
    await getQustions();
    currentQuestion = questions.elementAt(currentIndex.value);
    super.onInit();
  }

  void goToNextQuestion() {
    currentIndex.value++;
    currentQuestion = questions.elementAt(currentIndex.value);
    update();
  }

  void addAnswer({required String id, String? startOrEnd}) {
    // if (answers[currentQuestion!.id.toString()] == null) {
    if (currentQuestion!.type == 2.toString()) {
      if (answers[currentQuestion!.id.toString()] is List) {
        if ((answers[currentQuestion!.id.toString()] as List)
            .contains(id.toString())) {
          (answers[currentQuestion!.id.toString()] as List)
              .removeWhere((element) => element.toString() == id.toString());
        } else {
          (answers[currentQuestion!.id.toString()] as List).add(id.toString());
        }
      } else {
        answers[currentQuestion!.id.toString()] = [];
        (answers[currentQuestion!.id.toString()] as List).add(id);
      }
    } else if (currentQuestion!.type == 3.toString()) {
      if (answers[currentQuestion!.id.toString()] is Map) {
        answers[currentQuestion!.id.toString()][startOrEnd] = id;
      } else {
        answers[currentQuestion!.id.toString()] = {};
        answers[currentQuestion!.id.toString()]['start'] = null;
        answers[currentQuestion!.id.toString()]['end'] = null;
        answers[currentQuestion!.id.toString()][startOrEnd] = id;
      }
    } else {
      answers[currentQuestion!.id.toString()] = id.toString();
    }
    // } else {
    //   answers[currentQuestion!.id.toString()] = null;
    // }
    update();
  }

  void goToPreviousQuestion() {
    currentIndex.value--;
    currentQuestion = questions.elementAt(currentIndex.value);
    update();
  }

  Future<void> getQustions() async {
    isLoading.value = true;
    update();
    ResponseModel responseModel = await GetQuestionsOnMeApi().callAPI(user: {
      'user_id': userModel.id.toString(),
      'token': userModel.token!,
      'gender': userModel.gender!,
    });
    if (responseModel.code == 403 ||
        responseModel.code == 401 ||
        responseModel.code == 400) {
      Constant.getDialgBox(
        context: Get.context!,
        title: 'تنبيه',
        body: responseModel.message,
        actions: [
          MyButton(
            text: 'رجوع',
            action: () => Get.back(),
          )
        ],
      );
    } else if (responseModel.code == 0 || responseModel.code == 2) {
      Constant.getDialgBox(
        context: Get.context!,
        title: 'تنبيه',
        body: responseModel.message,
        actions: [
          MyButton(
            text: 'خروج',
            action: () {
              Constant.logOut();
              Get.offAll(() => const RegesterationScreen());
            },
          )
        ],
      );
    } else if (responseModel.code == 10 ||
        responseModel.code == 500 ||
        responseModel.code == 501) {
      Constant.getDialgBox(
        context: Get.context!,
        title: 'تنبيه',
        body: responseModel.message,
        actions: [
          MyButton(
            text: 'رجوع',
            action: () => Get.back(),
          ),
          MyButton(
            text: 'إعادة المحاولة',
            action: () {
              Get.back();
              onInit();
              // getQustions();
            },
          )
        ],
      );
    } else {
      // print(responseModel);
      questions = (responseModel.body as List).map((e) {
        QuestionModel questionModel = QuestionModel.fromMap(e);
        if (questionModel.image == null) {
          questionModel.image = Constant.getRanomAsset();
        }
        if (questionModel.skippable == 1.toString()) {
          questionModel.options!.add(OptionModel.noMatterOption());
        }
        if (questionModel.type == 2.toString()) {
          answers[questionModel.id.toString()] = [];
          questionModel.options?.forEach((element) {
            if (element.checked == 1) {
              answers[questionModel.id.toString()].add(element.id);
            }
          });
        } else {
          questionModel.options?.forEach((element) {
            if (element.checked == 1) {
              answers[questionModel.id.toString()] = element.id;
            }
          });
        }

        return questionModel;
      }).toList();

      // questions.forEach((element) {
      //   print(element);
      // });
    }
    isLoading.value = false;
    update();
  }

  void submitAnswer() async {
    isLoading(true);
    update();
    UserModel userModel =
        UserModel.fromMap(GetIt.instance.get<GetStorage>().read('userModel'));
    Map<String, dynamic> user = {
      'user_id': userModel.id!,
      'token': userModel.token!,
      'gender': userModel.gender,
    };
    user['answers'] = [];

    answers.forEach((key, value) {
      if (value is List) {
        (value).forEach((element) {
          user['answers'].add({'answer': element, 'question_id': key});
        });
      } else if (value is Map) {
        (value).forEach((innerKey, value) {
          user['answers'].add({'answer': value, 'question_id': key});
        });
      } else {
        user['answers'].add({'answer': value, 'question_id': key});
      }
    });

    ResponseModel responseModel =
        await SubmitAnswerOnMeApi().callAPI(user: user);
    if (responseModel.code == 403 || responseModel.code == 401) {
      Constant.getDialgBox(
        context: Get.context!,
        title: 'تنبيه',
        body: responseModel.message,
        actions: [
          MyButton(
            text: 'رجوع',
            action: () => Get.back(),
          )
        ],
      );
    } else if (responseModel.code == 0 ||
        responseModel.code == 2 ||
        responseModel.code == 400) {
      Constant.getDialgBox(
        context: Get.context!,
        title: 'تنبيه',
        body: responseModel.message,
        actions: [
          MyButton(
            text: 'خروج',
            action: () {
              Constant.logOut();
              Get.offAll(() => const RegesterationScreen());
            },
          )
        ],
      );
    } else if (responseModel.code == 10 ||
        responseModel.code == 500 ||
        responseModel.code == 501) {
      Constant.getDialgBox(
        context: Get.context!,
        title: 'تنبيه',
        body: responseModel.message,
        actions: [
          MyButton(
            text: 'رجوع',
            action: () => Get.back(),
          ),
          MyButton(
            text: 'إعادة المحاولة',
            action: () {
              Get.back();
              submitAnswer();
            },
          )
        ],
      );
    } else {
      Get.back();
      Get.to(() => const RequirementEndScreen());
      // Get.to(() => RequirementEndScreen());
    }
  }
}
