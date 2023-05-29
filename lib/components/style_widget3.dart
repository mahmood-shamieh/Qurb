import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:qurb/constant.dart';

import 'action_button.dart';
import 'my_text_field_widget.dart';
import 'my_text_widget.dart';

class StyleWidget3 extends StatelessWidget {
  Widget header;
  Widget title;
  Widget item;
  String? image;
  bool? isloading = false;

  bool userSecoundTitle = false;
  StyleWidget3(
      {super.key,
      required this.item,
      required this.title,
      required this.header,
      this.isloading,
      required this.userSecoundTitle,
      this.image});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Theme.of(context).iconTheme.color,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2 + 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: isloading ?? true
                          ? const AssetImage(
                              'assets/images/Leonardo_Diffusion_Happily_married_Saudi_Muslims_couple_realis_2 (1).jpg')
                          : (!image!.contains('assets')
                              ? (NetworkImage(
                                  Constant.mediaPath + 'questions/' + image!,
                                ) as ImageProvider)
                              : AssetImage(
                                  image!,
                                )),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 2 - 100),
                  height: MediaQuery.of(context).size.height / 2 + 100,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.25),
                      // gradient: LinearGradient(
                      //   begin: Alignment.topCenter,
                      //   end: Alignment.bottomCenter,
                      //   colors: [
                      //     Theme.of(context).iconTheme.color!,
                      //     Theme.of(context)
                      //         .iconTheme
                      //         .color!
                      //         .withOpacity(0.7),
                      //     Theme.of(context)
                      //         .iconTheme
                      //         .color!
                      //         .withOpacity(0.5),
                      //   ],
                      // ),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25)),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).shadowColor,
                          offset: const Offset(0, -5),
                          spreadRadius: 0.1,
                          blurRadius: 20,
                        ),
                      ]),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    child: Stack(
                      children: [
                        BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 30,
                            sigmaY: 30,
                          ),
                          child: SizedBox(
                            height:
                                MediaQuery.of(context).size.height / 2 + 100,
                          ),
                        ),
                        userSecoundTitle ? Container() : title,
                        Container(
                          margin: const EdgeInsets.only(top: 100),
                          decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25))),
                          child: isloading ?? false
                              ? Center(
                                  child: LoadingAnimationWidget.inkDrop(
                                    color: Theme.of(context).primaryColor,
                                    size: 50,
                                  ),
                                )
                              : item,
                        ),
                      ],
                    ),
                  ),
                ),
                header,
                userSecoundTitle
                    ? Padding(
                        padding: EdgeInsets.only(
                            top:
                                (MediaQuery.of(context).size.height / 2) - 200),
                        child: title,
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
