import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:unit_test/controller/stepper.dart';
import '../components/style.dart';
import '../controller/text_editing_controller.dart';

class ConfirmProfilePage extends StatefulWidget {
  const ConfirmProfilePage({super.key});

  @override
  State<ConfirmProfilePage> createState() => _ConfirmProfilePageState();
}

class _ConfirmProfilePageState extends State<ConfirmProfilePage> {
  @override
  Widget build(BuildContext context) {
    final stepperController = Provider.of<StepperController>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        child: Column(
          children: [
            textFieldReadOnly(ctrlText.nameController.text),
            boxSize20,
            textFieldReadOnly(ctrlText.birthdayController.text),
            boxSize20,
            textFieldReadOnly(ctrlText.emailController.text),
            boxSize20,
            textFieldReadOnly(ctrlText.phoneNumberController.text),
            boxSize20,
            textFieldReadOnly(ctrlText.provinceController.text),
            boxSize20,
            textFieldReadOnly(ctrlText.districtController.text),
            boxSize20,
            textFieldReadOnly(ctrlText.wardController.text),
            boxSize20,
            textFieldReadOnly(ctrlText.addresscontroller.text),
            boxSize20,
            Row(
              children: [
                rectangularButton('Trở lại', () {
                  stepperController.previousStep();
                }),
                boxSize20,
                rectangularButton('Xác nhận', () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
