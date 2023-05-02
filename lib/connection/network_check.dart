import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:messagy_app/shared/core/res/responsive.dart';
import 'package:sizer/sizer.dart';
import '../screens/app/0-main/main_section.dart';
import '../screens/app/services/services_mobile.dart';
import '../screens/background/background.dart';
import '../shared/changes/strings.dart';
import '../shared/components.dart';
import 'bloc/connected_bloc.dart';

class NChecking extends StatelessWidget {
  const NChecking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConnectedBloc, ConnectedState>(
      listener: (context, state) {
        // if (state is ConnectedSucessState) {
        //   showSnackBar(
        //     context,
        //       'Internet Connected',
        //       backgroundColor: Colors.green,
        //   );
        // } else
          if (state is ConnectedFailureState) {
          showSnackBar(
            context,
            'Internet Lost',
            backgroundColor: Colors.red
        );
        }
      },
      builder: (context, state) {
        if (state is ConnectedSucessState) {
          return const MainPage();
        }
        else
          if (state is ConnectedFailureState) {
          return const NoConnectionErorr();
        }
        else {
          return const MainPage();
        }
      },
    );
  }
}

class NoConnectionErorr extends StatelessWidget {
  const NoConnectionErorr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          BackGroundSc(),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                // LoadingAnimationWidget.staggeredDotsWave(
                //     color: primaryColor, size: 50.0),
                // SizedBox(height: 30.h),
                Lottie.asset(StaticImage.mainJson,
                    frameRate: FrameRate(60),
                    width: Responsive.isMobile(context)?size.width*0.7:35.w,
                    height:  Responsive.isMobile(context)?size.height*0.7:75.h,
                    filterQuality: FilterQuality.high),
                // SizedBox(height: 3.h),
                 buildStartSection(context,"Connection failed...!"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

