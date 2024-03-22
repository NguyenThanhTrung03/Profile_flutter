import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:unit_test/controller/stepper.dart';
import '../components/style.dart';
import '../controller/text_editing_controller.dart';

final _key = GlobalKey<FormState>();

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  @override
  Widget build(BuildContext context) {
    final stepperController = Provider.of<StepperController>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FormField(
        key: _key,
        autovalidateMode: AutovalidateMode.always,
        builder: (FormFieldState state) {
          return Column(
            children: [
              textField(
                  'Họ và Tên', ctrlText.nameController, TextInputType.text),
              boxSize20,
              textField('Ngày Sinh', ctrlText.birthdayController,
                  TextInputType.datetime),
              boxSize20,
              textField('Email', ctrlText.emailController,
                  TextInputType.emailAddress),
              boxSize20,
              textField('Số Điện Thoại', ctrlText.phoneNumberController,
                  TextInputType.phone),
              boxSize20,
              Row(
                children: [
                  rectangularButton('Thoát', () {}),
                  boxSize20,
                  rectangularButton('Tiếp', () {
                    stepperController.nextStep();
                    _key.currentState!.validate();
                  }),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
