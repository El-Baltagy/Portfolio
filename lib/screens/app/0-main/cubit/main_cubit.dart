import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../../shared/changes/constants.dart';
import 'main_states.dart';

class mainCubit extends Cubit<mainStates>{
  mainCubit():super(initialmainStates());
  static mainCubit get(context) => BlocProvider.of(context);

  PageController pageController=PageController();
  ScrollController sc=ScrollController();
  int SelectedIndex=0;
  double offcet = 0;
  bool isVerticalView=true;
  bool isScroll=true;






  updateView(){
    isVerticalView=!isVerticalView;
    emit(changView(isVerticalView));
  }

  changeIndexFromArrow(bool isForward,{isTab=false}){

    if (isForward) {
      SelectedIndex++;
    }  else{
      SelectedIndex--;
    }
    emit(initialmainStates());
    if (!isVerticalView) {
      pageController.animateToPage(SelectedIndex, duration: Duration(
          seconds: 1,
          milliseconds: 200
      ), curve: Curves.fastOutSlowIn);
    }else{
      if (isTab) {
        isScroll=false;
        emit(AppBarIndexChanged(SelectedIndex));
        Timer(Duration(milliseconds: 10), () {
          isScroll=true;
        });
      }
    }
    emit(changIFromArrow());

  }


  changeIndex(index,{isTab=false}){

    SelectedIndex=index;
    if (!isVerticalView) {
      pageController.animateToPage(index, duration: duration, curve: curve);
    } else{
      if (isTab) {
        isScroll=false;
        emit(AppBarIndexChanged(index));
        Timer(Duration(milliseconds: 200), () {
          isScroll=true;
          emit(initialmainStates());
        });
      }

    }
    emit(initialmainStates());

  }


  getPosition(){

    sc.addListener(() {
     if (isScroll) {
       double introHeight =homeKey.currentContext!.size!.height;
       double serviceHeight = serviceKey.currentContext!.size!.height;
       double portfolioHeight = portfolioKey.currentContext!.size!.height;
       double controllerHeight = sc.offset*1.2;
       // print('11111111$introHeight');
       // print('22222222$serviceHeight');
       // print('33333333$portfolioHeight');
       // print('........$controllerHeight');
       if (sc.position.extentAfter == 0.0) {
         changeIndex(3);;
       }else
       if (controllerHeight < introHeight) {
         if (SelectedIndex!=0) {
           changeIndex(0);
         }
       } else if (controllerHeight < (introHeight + serviceHeight)) {
         if (SelectedIndex!=1) {
           changeIndex(1);
         }
       } else if (controllerHeight <
           (introHeight + serviceHeight + portfolioHeight)) {
         if (SelectedIndex!=2) {
           changeIndex(2);
         }
       } else {
         changeIndex(3);
       }
     }
    });
    emit(initialmainStates());
  }

  // getPosition(){
  //
  //   sc.addListener(() {
  //     double introHeight =homeKey.currentContext!.size!.height;
  //     double serviceHeight = serviceKey.currentContext!.size!.height;
  //     double portfolioHeight = portfolioKey.currentContext!.size!.height;
  //     double controllerHeight = sc.offset;
  //     print('11111111$introHeight');
  //     print('22222222$serviceHeight');
  //     print('33333333$portfolioHeight');
  //     print('........$controllerHeight');
  //     if (sc.position.extentAfter == 0.0) {
  //       changeIndex(3);;
  //     }else
  //     if (controllerHeight < introHeight) {
  //       if (SelectedIndex!=0) {
  //         changeIndex(0);
  //       }
  //     } else if (controllerHeight < (introHeight + serviceHeight)) {
  //       if (SelectedIndex!=1) {
  //         changeIndex(1);
  //       }
  //     } else if (controllerHeight <
  //         (introHeight + serviceHeight + portfolioHeight)) {
  //       if (SelectedIndex!=2) {
  //         changeIndex(2);
  //       }
  //     } else {
  //       changeIndex(3);
  //     }
  //   });
  //   emit(initialmainStates());
  // }

}

