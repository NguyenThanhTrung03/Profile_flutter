import 'package:flutter/cupertino.dart';
// import '../Models/read_local_data.dart' as localData;
import 'package:unit_test/main.dart';

import '../Models/read_local_data.dart';

// Colors
const Color primaryColor = Color.fromARGB(255, 0, 123, 255);
const Color secondaryColor = Color.fromARGB(255, 255, 255, 255);
const Color shadowColor = Color.fromARGB(255, 22, 64, 108);
const Color textColor = Color.fromARGB(255, 0, 0, 0);
const Color backgroundColor = Color.fromRGBO(248, 249, 252, 1);

// Text Styles
const TextStyle titleTextStyle = TextStyle(
  color: textColor,
  fontSize: 24,
  fontWeight: FontWeight.bold,
);
const TextStyle subtitleTextStyle = TextStyle(
  color: textColor,
  fontSize: 18,
  fontWeight: FontWeight.bold,
);
const TextStyle bodyTextStyle = TextStyle(
  color: textColor,
  fontSize: 16,
  fontWeight: FontWeight.normal,
);
const TextStyle buttonTextStyle = TextStyle(
  color: secondaryColor,
  fontSize: 16,
  fontWeight: FontWeight.w900,
);

TextStyle placeholderStyle = TextStyle(
  color: textColor.withOpacity(0.8),
  fontSize: 16,
  fontWeight: FontWeight.normal,
);

//BoxSize
SizedBox boxSize(double height, double width) {
  return SizedBox(
    height: height,
    width: width,
  );
}

const boxSize10 = SizedBox(
  height: 10,
  width: 10,
);
const boxSize20 = SizedBox(
  height: 20,
  width: 20,
);

TextStyle isActiveTextStyle(bool active) => TextStyle(
      color: active ? secondaryColor : primaryColor,
      fontSize: 10,
      fontWeight: FontWeight.bold,
    );

// Text Fields
CupertinoTextField textField(String placeholder,
    TextEditingController textEditingController, TextInputType keyboardType) {
  final textEditingController_0 = TextEditingController();
  if (textEditingController.text.isNotEmpty) {
    textEditingController_0.text = textEditingController.text;
  }
  String? _errorMessage;
  void validate() {
    if (textEditingController.text.isEmpty) {
      _errorMessage = 'This field is required.';
    } else {
      _errorMessage = null;
    }
  }

  readLocationData.loadLocationData();
  return CupertinoTextField(
    controller: textEditingController_0,
    style: bodyTextStyle,
    keyboardType: keyboardType,
    placeholder: _errorMessage == null ? placeholder : _errorMessage,
    placeholderStyle: placeholderStyle,
    padding: const EdgeInsets.all(20),
    onChanged: (text) {
      validate();
      textEditingController.value = textEditingController_0.value;
    },
    decoration: BoxDecoration(
      color: secondaryColor,
      border: Border.all(
        color: primaryColor.withOpacity(0.2),
        width: 2,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
  );
}

CupertinoTextField textFieldReadOnly(String placeholder) {
  return CupertinoTextField(
    style: bodyTextStyle,
    placeholder: placeholder,
    placeholderStyle: placeholderStyle.copyWith(
      color: textColor.withOpacity(0.5),
    ),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: primaryColor.withOpacity(0.2),
      border: Border.all(
        color: primaryColor.withOpacity(0.2),
        width: 2,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    readOnly: true,
  );
}

//Button
CupertinoButton button(String text, VoidCallback? onPressed) {
  return CupertinoButton(
      color: primaryColor,
      onPressed: onPressed ?? () {},
      borderRadius: const BorderRadius.all(
        Radius.circular(30),
      ),
      child: Text(
        text,
        style: buttonTextStyle,
      ));
}

Container rectangularButton(String text, VoidCallback? onPressed) => Container(
      width: 120,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.6),
            spreadRadius: 0,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: CupertinoButton(
        pressedOpacity: 0.7,
        onPressed: onPressed,
        child: Text(text, style: buttonTextStyle),
      ),
    );

Container appBarButton(String text, bool active, VoidCallback? onPressed) =>
    Container(
      width: 70,
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(
          color: primaryColor,
          width: 2,
        ),
        color: active ? primaryColor : secondaryColor,
        borderRadius: BorderRadius.circular(60),
      ),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        pressedOpacity: 0.7,
        onPressed: onPressed,
        child: Text(
          text,
          style: isActiveTextStyle(active),
        ),
      ),
    );

class _CupertinoPickerExampleState extends State {
  int _selectedFruit = 0;

  // This shows a CupertinoModalPopup with a reasonable fixed height which hosts CupertinoPicker.
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const double _kItemExtent = 32.0;
    const List<String> _fruitNames = <String>[
      'Apple',
      'Mango',
      'Banana',
      'Orange',
      'Pineapple',
      'Strawberry',
    ];
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('CupertinoPicker Sample'),
      ),
      child: DefaultTextStyle(
        style: TextStyle(
          color: CupertinoColors.label.resolveFrom(context),
          fontSize: 22.0,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Selected fruit: '),
              CupertinoButton(
                padding: EdgeInsets.zero,
                // Display a CupertinoPicker with list of fruits.
                onPressed: () => _showDialog(
                  CupertinoPicker(
                    magnification: 1.22,
                    squeeze: 1.2,
                    useMagnifier: true,
                    itemExtent: _kItemExtent,
                    // This sets the initial item.
                    scrollController: FixedExtentScrollController(
                      initialItem: _selectedFruit,
                    ),
                    // This is called when selected item is changed.
                    onSelectedItemChanged: (int selectedItem) {
                      setState(() {
                        _selectedFruit = selectedItem;
                      });
                    },
                    children:
                        List<Widget>.generate(_fruitNames.length, (int index) {
                      return Center(child: Text(_fruitNames[index]));
                    }),
                  ),
                ),
                // This displays the selected fruit name.
                child: Text(
                  _fruitNames[_selectedFruit],
                  style: const TextStyle(
                    fontSize: 22.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
