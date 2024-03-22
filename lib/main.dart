import 'package:flutter/widgets.dart';
import 'package:unit_test/Models/read_local_data.dart';
import 'package:unit_test/controller/stepper.dart';
import 'package:provider/provider.dart';

import 'Page/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  readLocationData.loadLocationData();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => stepperController),
    ],
    child: const HomePage(),
  ));
}
