import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:qurb/components/my_text_widget.dart';
import 'package:qurb/constant.dart';

class MyButton extends StatelessWidget {
  String text;
  double? width, height;
  Function()? action;
  Color? color;
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? margin;
  String? image;
  String? descritopn;

  MyButton(
      {super.key,
      required this.text,
      this.width,
      this.action,
      this.height,
      this.color,
      this.margin,
      this.padding,
      this.image,
      this.descritopn});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? Constant.padding,
      margin: margin ?? Constant.margin,
      width: width ?? MediaQuery.of(context).size.width,
      height: image == null && descritopn == null ? height ?? 65 : null,
      child: InkWell(
        onTap: action,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Constant.radius),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor,
                spreadRadius: 0.1,
                blurRadius: 3,
                blurStyle: BlurStyle.outer,
                // offset: const Offset(2, 6),
              ),
            ],
            color: color,
            gradient:
                color == null ? Constant.getGradient(context: context) : null,
          ),
          child: image != null && descritopn != null
              ? SizedBox(
                  // color: Colors.amber ,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    Constant.mediaPath + 'choices/' + image!)),
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            MyTextWidget(
                              text: text,
                              fontWeight: FontWeight.bold,
                            ),
                            MyTextWidget(
                              text: descritopn!,
                              fontWeight: FontWeight.w100,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : (image != null
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(Constant.mediaPath +
                                        'choices/' +
                                        image!)),
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            // color: Colors.blue,
                            width: MediaQuery.of(context).size.width - 200,
                            child: MyTextWidget(
                              text: text,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  : (descritopn != null
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              MyTextWidget(
                                text: text,
                                fontWeight: FontWeight.bold,
                              ),
                              MyTextWidget(
                                text: descritopn!,
                                fontWeight: FontWeight.w100,
                              )
                            ],
                          ),
                        )
                      : Center(
                          child: MyTextWidget(
                            text: text,
                          ),
                        ))),
        ),
      ),
    );
  }
}
