import 'dart:ui';
import 'package:messagy_app/screens/app/0-main/widgets/_mobile_drawer.dart';
import 'package:messagy_app/screens/app/0-main/widgets/_navbar_desktop.dart';
import 'package:messagy_app/screens/app/0-main/widgets/bottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:messagy_app/screens/app/0-main/widgets/mobileAppBar.dart';
import 'package:messagy_app/screens/app/0-main/widgets/stack.dart';
import '../../../shared/core/res/responsive.dart';
import '../../background/background.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    // App.init(context);
    // SizeConfig().init(context);
    final scafoldKey = GlobalKey<ScaffoldState>();
    return Stack(
      children: [
        BackGroundSc(),
        Scaffold(
          key:scafoldKey ,
          backgroundColor: Colors.transparent,
          appBar:  PreferredSize(
          preferredSize: Size.fromHeight(
              Responsive.isDesktop(context)?100:Responsive.isTablet(context)?70:60),
             child: !Responsive.isMobile(context)? const NavbarDesktop():mobileAppBar(scafoldKey: scafoldKey)),
          // drawer: !Responsive.isDesktop(context) ? const MobileDrawer() : null,
          bottomNavigationBar:Responsive.isMobile(context)?const BottomNavBar():null ,
          body: buildStack(scafoldKey: scafoldKey)

        ),
      ],
    );
  }
}








