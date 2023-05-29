import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:qurb/components/my_text_widget.dart';
import 'package:qurb/constant.dart';

class MyTextFieldWidget extends StatefulWidget {
  String hint;
  IconData icon;
  bool? password;
  bool obscureText = true;
  TextEditingController controller;
  TextInputType? textInputType;
  Function(String)? onchange;
  MyTextFieldWidget(
      {super.key,
      required this.icon,
      required this.hint,
      this.password,
      required this.controller,
      this.textInputType,
      this.onchange});

  @override
  State<MyTextFieldWidget> createState() => _MyTextFieldWidgetState();
}

class _MyTextFieldWidgetState extends State<MyTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        // height: 90,
        // padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor,
                  spreadRadius: 0.1,
                  blurRadius: 3,
                  blurStyle: BlurStyle.outer,
                ),
              ],
              gradient: Constant.getGradient(context: context),
              borderRadius: BorderRadius.only(
                topLeft: Constant.radius,
                bottomLeft: Constant.radius,
                bottomRight: Constant.radius,
              ),
              color: Theme.of(context).primaryColor),
          child: widget.password == null
              ? TextField(
                  onChanged: widget.onchange,
                  maxLines: null,
                  controller: widget.controller,
                  keyboardType:
                      widget.textInputType ?? TextInputType.emailAddress,
                  // obscureText: widget.password == null ? false : widget.obscureText,
                  textDirection: TextDirection.rtl,
                  style: Constant.getTextStyle(),
                  decoration: InputDecoration(
                    prefixIcon: Container(
                      padding: Constant.padding,
                      child: Icon(
                        widget.icon,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),

                    suffixIcon: widget.password == null
                        ? const SizedBox()
                        : InkWell(
                            onTap: () {
                              setState(() {
                                widget.obscureText = !widget.obscureText;
                              });
                            },
                            child: Container(
                              padding: Constant.padding,
                              child: Icon(
                                Icons.lock_open_outlined,
                                color: Theme.of(context).iconTheme.color,
                              ),
                            ),
                          ),
                    hintText: widget.hint,
                    hintStyle: Constant.getTextStyle(),

                    // labelText: label,
                    // labelStyle: Constant.getTextStyle(),
                    // floatingLabelAlignment: FloatingLabelAlignment.start,
                    // alignLabelWithHint: true,
                    // hintTextDirection: TextDirection.rtl,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.only(
                        topLeft: Constant.radius,
                        bottomLeft: Constant.radius,
                        bottomRight: Constant.radius,
                      ),
                    ),
                  ),
                )
              : TextField(
                  onChanged: widget.onchange,
                  // maxLines: null,
                  controller: widget.controller,
                  keyboardType:
                      widget.textInputType ?? TextInputType.emailAddress,
                  obscureText:
                      widget.password == null ? false : widget.obscureText,
                  textDirection: TextDirection.rtl,
                  style: Constant.getTextStyle(),
                  decoration: InputDecoration(
                    prefixIcon: Container(
                      padding: Constant.padding,
                      child: Icon(
                        widget.icon,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),

                    suffixIcon: widget.password == null
                        ? const SizedBox()
                        : InkWell(
                            onTap: () {
                              setState(() {
                                widget.obscureText = !widget.obscureText;
                              });
                            },
                            child: Container(
                              padding: Constant.padding,
                              child: Icon(
                                Icons.lock_open_outlined,
                                color: Theme.of(context).iconTheme.color,
                              ),
                            ),
                          ),
                    hintText: widget.hint,
                    hintStyle: Constant.getTextStyle(),

                    // labelText: label,
                    // labelStyle: Constant.getTextStyle(),
                    // floatingLabelAlignment: FloatingLabelAlignment.start,
                    // alignLabelWithHint: true,
                    // hintTextDirection: TextDirection.rtl,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.only(
                        topLeft: Constant.radius,
                        bottomLeft: Constant.radius,
                        bottomRight: Constant.radius,
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
