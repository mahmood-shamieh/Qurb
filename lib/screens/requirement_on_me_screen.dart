import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qurb/components/my_buttons.dart';
import 'package:qurb/components/style_widget_2.dart';
import 'package:qurb/getxcontrollers/requirement_on_my_screen_getx_controller.dart';
import 'package:qurb/getxcontrollers/requirement_screen_getx_controller.dart';
import 'package:qurb/screens/home_screen.dart';

import '../components/action_button.dart';
import '../components/my_text_field_widget.dart';
import '../components/my_text_widget.dart';
import '../components/style_widget3.dart';
import '../constant.dart';

class RequirementOnMeScreen extends StatefulWidget {
  const RequirementOnMeScreen({super.key});

  @override
  State<RequirementOnMeScreen> createState() => _RequirementOnMeScreenState();
}

class _RequirementOnMeScreenState extends State<RequirementOnMeScreen> {
  @override
  Widget build(BuildContext context) {
    @override
    void dispose() {
      // print('disposed function called');
      Get.delete<RequrementOnMyScreenGetXController>();
      super.dispose();
    }

    return GetBuilder<RequrementOnMyScreenGetXController>(
        init: Get.put(RequrementOnMyScreenGetXController()),
        builder: (controller) {
          return StyleWidget3(
              image: controller.currentQuestion?.image,
              isloading: controller.isLoading.value,
              item: Container(
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: controller.isLoading.value
                    ? Container()
                    : controller.questions.isEmpty
                        ? Center(
                            child: MyTextWidget(
                              text: 'حدثت مشكلة',
                              color: Theme.of(context).primaryColor,
                            ),
                          )
                        : Stack(
                            children: [
                              SizedBox(
                                height:
                                    (MediaQuery.of(context).size.width / 1.5) -
                                        30,
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children:
                                        (controller.currentQuestion?.type!
                                                    .toString() ==
                                                3.toString()
                                            ? [
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      3,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          Get.defaultDialog(
                                                              title: "العمر",
                                                              titleStyle: Constant.getTextStyle(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  fontSize: 24,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                              content: SizedBox(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width -
                                                                    100,
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height /
                                                                    3,
                                                                child:
                                                                    SingleChildScrollView(
                                                                  child:
                                                                      ListBody(
                                                                    children: [
                                                                      18,
                                                                      19,
                                                                      20,
                                                                      21,
                                                                      22,
                                                                      23,
                                                                      24,
                                                                      25,
                                                                      26,
                                                                      27,
                                                                      28,
                                                                      29,
                                                                      30,
                                                                      31,
                                                                      32,
                                                                      33,
                                                                      34,
                                                                      35,
                                                                      36,
                                                                      37,
                                                                      38,
                                                                      39,
                                                                      40,
                                                                      41,
                                                                      42,
                                                                      43,
                                                                      44,
                                                                      45,
                                                                      46,
                                                                      47,
                                                                      48,
                                                                      49,
                                                                      50,
                                                                      51,
                                                                      52,
                                                                      53,
                                                                      54,
                                                                      55,
                                                                      56,
                                                                      57,
                                                                      58,
                                                                      59,
                                                                      60,
                                                                      61,
                                                                      62,
                                                                      63,
                                                                      64,
                                                                      65,
                                                                      66,
                                                                      67,
                                                                      68,
                                                                      69,
                                                                      70,
                                                                      71,
                                                                      72,
                                                                      73,
                                                                      74,
                                                                      75,
                                                                      76,
                                                                      77,
                                                                      78,
                                                                      79,
                                                                      80
                                                                    ]
                                                                        .map((e) =>
                                                                            InkWell(
                                                                              onTap: () {
                                                                                Get.back();
                                                                                controller.addAnswer(id: e.toString(), startOrEnd: 'start');
                                                                              },
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                  color: controller.answers[controller.currentQuestion!.id] != null ? ((controller.answers[controller.currentQuestion!.id]['start'] ?? '') == e.toString() ? Theme.of(context).primaryColor : Colors.transparent) : Colors.transparent,
                                                                                ),
                                                                                child: MyTextWidget(
                                                                                  text: e.toString(),
                                                                                  color: controller.answers[controller.currentQuestion!.id] != null ? ((controller.answers[controller.currentQuestion!.id]['start'] ?? '') == e.toString() ? null : Theme.of(context).primaryColor) : Theme.of(context).primaryColor,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                              ),
                                                                            ))
                                                                        .toList(),
                                                                  ),
                                                                ),
                                                              ));
                                                        },
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  2 -
                                                              20,
                                                          height: 110,
                                                          padding:
                                                              Constant.padding,
                                                          margin:
                                                              Constant.margin,
                                                          decoration: BoxDecoration(
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                          child: Column(
                                                            children: [
                                                              MyTextWidget(
                                                                text: "من",
                                                                color: Theme.of(
                                                                        context)
                                                                    .iconTheme
                                                                    .color,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                              Divider(
                                                                color: Theme.of(
                                                                        context)
                                                                    .iconTheme
                                                                    .color,
                                                              ),
                                                              MyTextWidget(
                                                                text: controller.answers[controller
                                                                            .currentQuestion!
                                                                            .id] !=
                                                                        null
                                                                    ? controller.answers[controller
                                                                            .currentQuestion!
                                                                            .id]['start'] ??
                                                                        'إضغط للإختيار'
                                                                    : 'إضغط للإختيار',
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          Get.defaultDialog(
                                                              title: "العمر",
                                                              titleStyle: Constant.getTextStyle(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  fontSize: 24,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                              content: SizedBox(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width -
                                                                    100,
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height /
                                                                    3,
                                                                child:
                                                                    SingleChildScrollView(
                                                                  child:
                                                                      ListBody(
                                                                    children: [
                                                                      18,
                                                                      19,
                                                                      20,
                                                                      21,
                                                                      22,
                                                                      23,
                                                                      24,
                                                                      25,
                                                                      26,
                                                                      27,
                                                                      28,
                                                                      29,
                                                                      30,
                                                                      31,
                                                                      32,
                                                                      33,
                                                                      34,
                                                                      35,
                                                                      36,
                                                                      37,
                                                                      38,
                                                                      39,
                                                                      40,
                                                                      41,
                                                                      42,
                                                                      43,
                                                                      44,
                                                                      45,
                                                                      46,
                                                                      47,
                                                                      48,
                                                                      49,
                                                                      50,
                                                                      51,
                                                                      52,
                                                                      53,
                                                                      54,
                                                                      55,
                                                                      56,
                                                                      57,
                                                                      58,
                                                                      59,
                                                                      60,
                                                                      61,
                                                                      62,
                                                                      63,
                                                                      64,
                                                                      65,
                                                                      66,
                                                                      67,
                                                                      68,
                                                                      69,
                                                                      70,
                                                                      71,
                                                                      72,
                                                                      73,
                                                                      74,
                                                                      75,
                                                                      76,
                                                                      77,
                                                                      78,
                                                                      79,
                                                                      80
                                                                    ]
                                                                        .map((e) => controller.answers[controller.currentQuestion!.id] !=
                                                                                null
                                                                            ? (e.toInt() > int.parse(controller.answers[controller.currentQuestion!.id]['start'])
                                                                                ? InkWell(
                                                                                    onTap: () {
                                                                                      Get.back();
                                                                                      controller.addAnswer(id: e.toString(), startOrEnd: 'end');
                                                                                    },
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(10),
                                                                                        color: controller.answers[controller.currentQuestion!.id] != null ? ((controller.answers[controller.currentQuestion!.id]['end'] ?? '') == e.toString() ? Theme.of(context).primaryColor : Colors.transparent) : Colors.transparent,
                                                                                      ),
                                                                                      child: MyTextWidget(
                                                                                        text: e.toString(),
                                                                                        color: controller.answers[controller.currentQuestion!.id] != null ? ((controller.answers[controller.currentQuestion!.id]['end'] ?? '') == e.toString() ? null : Theme.of(context).primaryColor) : Theme.of(context).primaryColor,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                    ),
                                                                                  )
                                                                                : Container())
                                                                            : Container())
                                                                        .toList(),
                                                                  ),
                                                                ),
                                                              ));
                                                        },
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  2 -
                                                              20,
                                                          height: 110,
                                                          padding:
                                                              Constant.padding,
                                                          margin:
                                                              Constant.margin,
                                                          decoration: BoxDecoration(
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                          child: Column(
                                                            children: [
                                                              MyTextWidget(
                                                                text: "الى",
                                                                color: Theme.of(
                                                                        context)
                                                                    .iconTheme
                                                                    .color,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                              Divider(
                                                                color: Theme.of(
                                                                        context)
                                                                    .iconTheme
                                                                    .color,
                                                              ),
                                                              MyTextWidget(
                                                                text: controller.answers[controller
                                                                            .currentQuestion!
                                                                            .id] !=
                                                                        null
                                                                    ? controller.answers[controller
                                                                            .currentQuestion!
                                                                            .id]['end'] ??
                                                                        'إضغط للإختيار'
                                                                    : 'إضغط للإختيار',
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ]
                                            : (controller.currentQuestion
                                                        ?.options ??
                                                    [])
                                                .map(
                                                  (e) => MyButton(
                                                    image: e.image,
                                                    descritopn: e.description,
                                                    text: e.choice!,
                                                    action: () {
                                                      controller.addAnswer(
                                                          id: e.id!);
                                                    },
                                                    color: (controller.currentQuestion!.type
                                                                .toString() ==
                                                            2.toString()
                                                        ? ((controller.answers[controller.currentQuestion!.id.toString()] ?? [])
                                                                .contains(e.id!
                                                                    .toString())
                                                            ? Theme.of(context)
                                                                .iconTheme
                                                                .color
                                                            : null)
                                                        : ((controller.answers[controller
                                                                    .currentQuestion!
                                                                    .id
                                                                    .toString()] ==
                                                                e.id)
                                                            ? Theme.of(context)
                                                                .iconTheme
                                                                .color
                                                            : null)),
                                                  ),
                                                )
                                                .toList()),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: (MediaQuery.of(context).size.height /
                                            2) -
                                        100),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Visibility(
                                      visible: controller.currentIndex.value ==
                                          controller.questions.length - 1,
                                      child: ActionButton(
                                        action: () {
                                          if ((controller.answers.containsKey(
                                              controller.currentQuestion!.id
                                                  .toString()))) {
                                            controller.submitAnswer();
                                          }
                                        },
                                        active: (controller.answers.containsKey(
                                            controller.currentQuestion?.id
                                                .toString())),
                                        text: 'إنهاء',
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    2 -
                                                20,
                                      ),
                                    ),
                                    Visibility(
                                      visible: controller.currentIndex.value !=
                                          controller.questions.length - 1,
                                      child: MyButton(
                                        width:
                                            (MediaQuery.of(context).size.width /
                                                    2) -
                                                20,
                                        // padding: EdgeInsets.all(0.0),
                                        action: () {
                                          if (controller.currentIndex.value !=
                                                  controller.questions.length -
                                                      1 &&
                                              (controller.currentQuestion!.type
                                                          .toString() ==
                                                      2.toString()
                                                  ? (controller.answers[controller
                                                                  .currentQuestion!
                                                                  .id
                                                                  .toString()] ??
                                                              [])
                                                          .length !=
                                                      0
                                                  : controller.answers[
                                                          controller
                                                              .currentQuestion!
                                                              .id
                                                              .toString()] !=
                                                      null)) {
                                            controller.goToNextQuestion();
                                          } else {}
                                        },
                                        color: controller.currentIndex.value ==
                                                    controller.questions.length -
                                                        1 ||
                                                (controller.currentQuestion
                                                            ?.type
                                                            .toString() ==
                                                        2.toString()
                                                    ? (controller.answers[controller
                                                                    .currentQuestion!
                                                                    .id
                                                                    .toString()] ??
                                                                [] as List)
                                                            .length ==
                                                        0
                                                    : controller.answers[
                                                            controller
                                                                .currentQuestion
                                                                ?.id
                                                                .toString()] ==
                                                        null)
                                            ? Colors.grey
                                            : null,
                                        text: 'التالي',
                                      ),
                                    ),
                                    MyButton(
                                      // padding: EdgeInsets.all(0.0),
                                      width:
                                          (MediaQuery.of(context).size.width /
                                                  2) -
                                              20,
                                      action: () {
                                        if (controller.currentIndex.value !=
                                            0) {
                                          controller.goToPreviousQuestion();
                                        } else {}
                                      },
                                      color: controller.currentIndex.value == 0
                                          ? Colors.grey
                                          : null,
                                      text: 'السابق',
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
              ),
              title: controller.isLoading.value
                  ? Container()
                  : Padding(
                      padding: EdgeInsets.only(
                          top: controller.currentQuestion?.type! == 2.toString()
                              ? 100
                              : 120),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            MyTextWidget(
                              text: (controller.userModel.gender == 0.toString()
                                      ? controller
                                              .currentQuestion!.f_question! ??
                                          ''
                                      : controller
                                              .currentQuestion?.m_question! ??
                                          '') +
                                  (controller.currentQuestion?.type! ==
                                          2.toString()
                                      ? '\n(اختيار من متعدد)'
                                      : ''),
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: controller.questions
                                    .asMap()
                                    .entries
                                    .map((e) => e.key ==
                                            controller.currentIndex.value
                                        ? Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: CircleAvatar(
                                              maxRadius: 6,
                                              backgroundColor: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: CircleAvatar(
                                              maxRadius: 4,
                                              backgroundColor: Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                            ),
                                          ))
                                    .toList(),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
              header: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 36),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.all(Constant.radius),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 30,
                          sigmaY: 30,
                        ),
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 4, bottom: 4, right: 24, left: 24),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.25),
                            borderRadius: BorderRadius.all(Constant.radius),
                          ),
                          child: MyTextWidget(
                            text: 'استبيان المواصفات',
                            size: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => Get.offAll(() => HomeScreen()),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Constant.radius),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 30,
                            sigmaY: 30,
                          ),
                          child: Container(
                            padding: const EdgeInsets.only(
                                top: 4, bottom: 4, right: 6, left: 4),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.25),
                              borderRadius: BorderRadius.all(Constant.radius),
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              userSecoundTitle: true);
        });
  }
}
