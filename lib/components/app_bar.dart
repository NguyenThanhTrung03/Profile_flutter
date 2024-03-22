import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_test/components/style.dart';
import 'package:unit_test/controller/stepper.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const _AppBar();
  }
}

class _AppBar extends StatefulWidget {
  const _AppBar();

  @override
  State<_AppBar> createState() => __AppBarState();
}

class __AppBarState extends State<_AppBar> {
  bool isActive1 = false;
  bool isActive2 = false;
  bool isActive3 = false;
  @override
  Widget build(BuildContext context) {
    final stepperController = Provider.of<StepperController>(context);
    switch (stepperController.step) {
      case 0:
        isActive1 = true;
        isActive2 = false;
        isActive3 = false;
        break;
      case 1:
        isActive1 = false;
        isActive2 = true;
        isActive3 = false;
        break;
      case 2:
        isActive1 = false;
        isActive2 = false;
        isActive3 = true;
        break;
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        appBarButton('Cơ Bản', isActive1, () {
          stepperController.step = 0;
        }),
        boxSize20,
        boxSize20,
        appBarButton('Quê Quán', isActive2, () {
          stepperController.step = 1;
        }),
        boxSize20,
        boxSize20,
        appBarButton('Xác Nhận', isActive3, () {
          stepperController.step = 2;
        })
      ],
    );
  }
}
