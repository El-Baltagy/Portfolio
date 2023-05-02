import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagy_app/shared/core/configs/configs.dart';
import 'package:sizer/sizer.dart';
import '../../../../shared/changes/strings.dart';
import '../../../../shared/components.dart';
import '../../../../shared/core/configs/others/space.dart';
import '../../../../shared/core/theme/cubit/theme_cubit.dart';
import '../../../../shared/core/theme/cubit/theme_state.dart';
import '../../../../shared/changes/utils.dart';
import '../../../../shared/widgets/navbar_logo.dart';
import '../../home/widgets/texts.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final scrollProvider = Provider.of<ScrollProvider>(context);
    // theme
    var theme = Theme.of(context);
    return Drawer(

      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          final cubit=ThemeCubit.get(context);
          return Material(
            elevation: 10,
            color: theme.scaffoldBackgroundColor,
            child: Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 const SizedBox(height: 30),
                  const Center(child: NavBarLogo(height: 40,width: 40)),
                  const Divider(),
                  ListTile(
                    leading: Icon(
                      !cubit.isLightTheme
                          ? Icons.dark_mode_outlined
                          : Icons.light_mode,color: Colors.purple,
                      // color: theme.textColor,
                    ),
                    title:
                        Text(cubit.isLightTheme ? "Light Mode" : "Dark Mode"),
                    trailing: Switch(
                      value: cubit.isLightTheme,
                      activeColor: theme.primaryColor,
                      inactiveTrackColor: Colors.grey,
                      onChanged: (newValue) {
                        cubit.updateTheme(context);
                      },
                    ),
                  ),
                  const Divider(),
                  ...NavBarUtils.names.asMap().entries.map(
                        (e) => SettingItem(
                            title: e.value,
                            leadingIcon: NavBarUtils.icons[e.key],
                            leadingIconColor: theme.primaryColor,
                            onTap: () {
                              // scrollProvider.moveDT(e.key);
                              //         Navigator.pop(context);
                            }),
                      ),
                  // ...NavBarUtils.names.asMap().entries.map(
                  //       (e) => Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: MaterialButton(
                  //       hoverColor: theme.primaryColor.withAlpha(70),
                  //       onPressed: () {
                  //         // scrollProvider.scrollMobile(e.key);
                  //         scrollProvider.jumpTo(e.key);
                  //         Navigator.pop(context);
                  //       },
                  //       child: ListTile(
                  //         leading: Icon(
                  //           NavBarUtils.icons[e.key],
                  //           // color: theme.primaryColor,
                  //         ),
                  //         title: Text(
                  //           e.value,
                  //           // style: AppText.l1,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Space.y(10.w)!,
                   Button1( text: 'Resume', reverse: true,
                     function: () { openURL(resume); },)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  final IconData? leadingIcon;
  final Color? leadingIconColor;
  final String title;
  final GestureTapCallback? onTap;
  const SettingItem(
      {Key? key,
        required this.title,
        this.onTap,
        this.leadingIcon,
        this.leadingIconColor })
      : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
              color: Theme.of(context).navBarColor,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: leadingIcon != null
                    ? [
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).shadowColor.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Icon(
                      leadingIcon,
                      size: 24,
                      color: Theme.of(context).textColor,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.purple,
                    size: 14,
                  )
                ]
                    : [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).navBarColor,
                    size: 14,
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}

