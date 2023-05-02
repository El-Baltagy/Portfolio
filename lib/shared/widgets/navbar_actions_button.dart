import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:messagy_app/screens/app/0-main/cubit/main_states.dart';
import 'package:messagy_app/shared/changes/colors.dart';
import 'package:messagy_app/shared/core/res/responsive.dart';
import '../../screens/app/0-main/cubit/main_cubit.dart';
import '../changes/utils.dart';


class NavBarActionButton extends StatelessWidget {
  const NavBarActionButton( this.padding);
  final double padding;

  @override
  Widget build(BuildContext context) {

    return  BlocBuilder<mainCubit,mainStates>(
      builder: (context, state) {
        final cubit = mainCubit.get(context);

        return GNav(
          // tab button icon size
          // tabBackgroundColor: Colors.purple.withOpacity(0.1), // selected tab background color
          // tabMargin:EdgeInsets.symmetric(horizontal: 10) ,
          // rippleColor: Colors.red, // tab button ripple color when pressed
          // hoverColor: Colors.yellow, // tab button hover color
          // tab button border
          // tabBorder: Border.all(color: Colors.black, width: 1), // tab button border
          // tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)], // tab button shadow
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            haptic: true, // haptic feedback
            tabBorderRadius: 15,
            tabActiveBorder: Border.all(color: Colors.purple, width: 1),
            curve: Curves.fastOutSlowIn, // tab animation curves
            duration: const Duration(milliseconds: 600), // tab animation duration
            gap: 20, // the tab button gap between icon and text
            color: Colors.white30, // unselected icon color
            activeColor: primaryColor, // selected icon and text color
            iconSize: 24,
            style:Responsive.isTablet(context)? GnavStyle.tabMode:GnavStyle.google,
            padding:  EdgeInsets.symmetric(horizontal: padding, vertical: 5),
            hoverColor: Colors.transparent, // navigation bar padding
            selectedIndex:cubit.SelectedIndex ,
            isTablete: Responsive.isTablet(context)?true:false,
            onTabChange:(index){
              cubit.changeIndex(index,isTab: true);
            } ,
            tabs: buildList(context: context)
        );
      }
    );
  }
}

  List<GButton> buildList({
  required context
}) {
    return List<GButton>.generate(
              NavBarUtils.names.length,
                  (index) => GButton(icon:NavBarUtils.icons[index] ,text:NavBarUtils.names[index],)
          );
  }




