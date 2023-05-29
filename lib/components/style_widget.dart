import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class StyleWidget extends StatelessWidget {
  Widget items;
  bool? isLoading = false;
  StyleWidget({super.key, required this.items, this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).iconTheme.color,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2 + 50,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/Leonardo_Diffusion_Happily_married_Saudi_Muslims_couple_realis_2 (1).jpg',
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 2 - 80),
              height: MediaQuery.of(context).size.height / 2 + 80,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.25),
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
                borderRadius: BorderRadius.circular(25),
                child: Stack(
                  children: [
                    BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 30,
                        sigmaY: 30,
                      ),
                      child: Opacity(
                        opacity: 0.2,
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                              Colors.white.withOpacity(0.25),
                              BlendMode.overlay),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: Color(0xffF47C7C),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: isLoading ?? false
                          ? LoadingAnimationWidget.inkDrop(
                              color: Theme.of(context).primaryColor,
                              size: 50,
                            )
                          : items,
                    ),
                    Positioned(
                      top: -100,
                      left: -100,
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: Image.asset(
                          'assets/images/Pattern (1).png',
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -100,
                      right: -100,
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: Image.asset(
                          'assets/images/Pattern (1).png',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
