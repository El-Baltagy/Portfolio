//
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
// import '../../../../shared/core/providers/scroll_provider.dart';
// import '../../../../shared/utils/utils.dart';
//
// class BodyDT extends StatelessWidget
// {
//   BodyDT();
//   @override
//   Widget build(BuildContext context) {
//     final scrollProvider = Provider.of<ScrollProvider>(context);
//
//     return ScrollablePositionedList.builder(
//       physics: const BouncingScrollPhysics(),
//       padding: EdgeInsets.zero,
//       itemCount: BodyUtils.views.length,
//       itemBuilder: (context, index) => BodyUtils.views[index],
//       itemScrollController: scrollProvider.itemScrollController,
//
//     );
//   }
// }
// class Body_mob extends StatelessWidget {
//   const Body_mob({Key? key}) : super(key: key);
//   List<Widget> viewsMob = [
//     HomeMobile(),
//     EducationDesktop(),
//     ServiceMobile(),
//     PortfolioMobileTab(),
//     ContactMobileTab(),
//     Footer(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//
//     return BlocProvider(
//       create: (BuildContext context) =>NavCubit(),
//       child: BlocConsumer<NavCubit,NavStates>(
//           listener:(context, state) => (){} ,
//
//           builder: (context, state) {
//             var cubit = NavCubit.get(context);
//             return Scaffold(
//               backgroundColor: Colors.transparent,
//                 bottomNavigationBar: const BottomNavBar(),
//                 body:BodyUtils().viewsMob[cubit.SelectedIndex]
//             );
//           }
//       ),
//     );
//
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/changes/utils.dart';
import '../cubit/main_cubit.dart';
import '../cubit/main_states.dart';
import 'build_list_view.dart';

class BodyDT extends StatelessWidget {
  BodyDT();


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<mainCubit,mainStates>(

      builder: (context, state) {
        final cubit=mainCubit.get(context);

        return
          cubit.isVerticalView? build_list_view():

        PageView.builder(
          controller: cubit.pageController,
          itemBuilder:(context, index) => SingleChildScrollView(
              child: BodyUtils.viewsVT[index]) ,
          itemCount: BodyUtils.viewsVT.length,
          scrollDirection: Axis.horizontal,
        );
      },

    );
  }
}
