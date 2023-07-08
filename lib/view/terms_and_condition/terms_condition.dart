import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:j_wallet/view/component/custom_appbar.dart';
import 'package:j_wallet/view/terms_and_condition/termscondition_bottom.dart';
import 'package:j_wallet/view/terms_and_condition/termscondition_header.dart';

class TermCondition extends StatefulWidget {
  const TermCondition({super.key});

  @override
  State<TermCondition> createState() => _TermConditionState();
}

class _TermConditionState extends State<TermCondition> {
  late ConfettiController controller;
  @override
  void initState() {
    super.initState();
    controller = ConfettiController(duration: const Duration(seconds: 5));
    controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'J-Wallet'),
      body: Container(
        width: double.infinity.w,
        height: double.infinity.h,
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: ConfettiWidget(
                    blastDirectionality: BlastDirectionality.directional,
                    confettiController: controller,
                    blastDirection: pi / 2, // radial value - LEFT
                    emissionFrequency: 0.6,
                    minimumSize: const Size(20,
                        5), // set the minimum potential size for the confetti (width, height)
                    maximumSize: const Size(20,
                        20), // set the maximum potential size for the confetti (width, height)
                    numberOfParticles: 1,
                    gravity: 0.1,
                    shouldLoop: true),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: ConfettiWidget(
                    confettiController: controller,
                    blastDirection: pi / 2,
                    blastDirectionality:
                        BlastDirectionality.directional, // radial value - LEFT
                    emissionFrequency: 0.6,
                    minimumSize: const Size(20,
                        5), // set the minimum potential size for the confetti (width, height)
                    maximumSize: const Size(20,
                        20), // set the maximum potential size for the confetti (width, height)
                    numberOfParticles: 1,
                    gravity: 0.1,
                    shouldLoop: true),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: ConfettiWidget(
                    confettiController: controller,
                    blastDirection: pi / 2,
                    blastDirectionality:
                        BlastDirectionality.directional, // radial value - LEFT
                    emissionFrequency: 0.6,
                    minimumSize: const Size(20,
                        5), // set the minimum potential size for the confetti (width, height)
                    maximumSize: const Size(20,
                        20), // set the maximum potential size for the confetti (width, height)
                    numberOfParticles: 1,
                    gravity: 0.1,
                    shouldLoop: true),
              ),
              ListView(
                children: [
                  SizedBox(
                    height: 100.h,
                  ),
                  const TermConditionHeader(),
                  SizedBox(
                    height: 100.h,
                  ),
                  const TermConditionBottom()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
