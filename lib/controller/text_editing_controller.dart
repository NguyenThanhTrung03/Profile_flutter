import 'package:flutter/cupertino.dart';

class TextFiledController extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController provinceController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController wardController = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
}

TextFiledController ctrlText = TextFiledController();
