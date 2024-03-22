import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_test/Models/province.dart';
import 'package:unit_test/Models/read_local_data.dart';
import 'package:unit_test/controller/stepper.dart';
import '../components/style.dart';
import '../controller/text_editing_controller.dart';

class AddressInfoPage extends StatefulWidget {
  const AddressInfoPage({super.key});

  @override
  State<AddressInfoPage> createState() => _AddressInfoPageState();
}

class _AddressInfoPageState extends State<AddressInfoPage> {
  @override
  Widget build(BuildContext context) {
    final stepperController = Provider.of<StepperController>(context);
    readLocationData.loadLocationData();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            // Autocomplete<Province>(
            //   optionsBuilder: (TextEditingValue textEditingValue) {
            //     if (textEditingValue.text == '') {
            //       return const Iterable<Province>.empty();
            //     }
            //     return readLocationData.provincelist.where((dynamic item) {
            //       return item.contains(textEditingValue.text.toLowerCase());
            //     });
            //   },
            //   onSelected: (Province item) {
            //     print('The $item was selected');
            //   },
            // ),
            textField('Tỉnh/Thành Phố', ctrlText.provinceController,
                TextInputType.text),
            boxSize20,
            textField(
                'Quận/Huyện', ctrlText.districtController, TextInputType.text),
            boxSize20,
            textField('Phường/Xã/Thị Trấn', ctrlText.wardController,
                TextInputType.text),
            boxSize20,
            textField(
                'Địa Chỉ', ctrlText.addresscontroller, TextInputType.text),
            boxSize20,
            Row(
              children: [
                rectangularButton('Trở lại', () {
                  stepperController.previousStep();
                }),
                boxSize20,
                rectangularButton('Tiếp', () {
                  stepperController.nextStep();
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
