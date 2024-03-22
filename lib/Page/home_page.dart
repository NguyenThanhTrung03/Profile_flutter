import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:unit_test/Page/address_info_page.dart';
import 'package:unit_test/Page/confirm_profile_page.dart';
import 'package:unit_test/Page/user_info_page.dart';
import 'package:unit_test/components/style.dart';
import 'package:unit_test/controller/stepper.dart';
import '../components/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HomePageState();
  }
}

class _HomePageState extends StatefulWidget {
  const _HomePageState();

  @override
  State<_HomePageState> createState() => _HomePageStateState();
}

class _HomePageStateState extends State<_HomePageState> {
  @override
  Widget build(BuildContext context) {
    Widget page = const UserInfoPage();
    switch (context.watch<StepperController>().step) {
      case 0:
        page = const UserInfoPage();
        break;
      case 1:
        page = const AddressInfoPage();
        break;
      case 2:
        page = const ConfirmProfilePage();
        break;
    }
    return CupertinoApp(
        debugShowCheckedModeBanner: false,
        home: CupertinoPageScaffold(
          backgroundColor: backgroundColor,
          navigationBar: const CupertinoNavigationBar(
            middle: AppBarWidget(),
          ),
          child: Center(
            child: ListView(
              children: <Widget>[
                boxSize20,
                page,
              ],
            ),
          ),
        ));
  }
}
