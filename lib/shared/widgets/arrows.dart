import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagy_app/screens/app/0-main/cubit/main_states.dart';
import 'package:sizer/sizer.dart';
import '../../screens/app/0-main/cubit/main_cubit.dart';
import '../changes/colors.dart';
import '../core/animations/entrance_fader.dart';

class Arrow extends StatefulWidget {
  Arrow({
    required this.isAdd
});
  final bool isAdd ;

  @override
  ArrowState createState() => ArrowState();
}

class ArrowState extends State<Arrow> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    // final scrollProvider = Provider.of<ScrollProvider>(context);

    return EntranceFader(
      offset: const Offset(0, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BlocBuilder<mainCubit,mainStates>(
            builder: (context, state) {
              final cubit=mainCubit.get(context);
              return InkWell(
                borderRadius: BorderRadius.circular(8.0),
                onTap: () {
                  cubit.changeIndexFromArrow(widget.isAdd,isTab: true);
                }
                // scrollProvider.moveDT(0)
                , onHover: (isHovering) {
                if (isHovering) {
                  setState(() => isHover = true);
                } else {
                  setState(() => isHover = false);
                }
              },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: isHover ? buttonGradi : pinkpurple,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                    ),
                    boxShadow: isHover
                        ? [
                      const BoxShadow(
                        blurRadius: 12.0,
                        offset: Offset(2.0, 3.0),
                      )
                    ]
                        : null,
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: isHover ? blackColor : whiteColor,
                    size: 5.h,
                  ),
                ),
              );
            },

          ),
        ],
      ),
    );
  }
}



