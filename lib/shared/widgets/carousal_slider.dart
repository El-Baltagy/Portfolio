import 'package:bloc/bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagy_app/shared/core/res/responsive.dart';

class buildCarouselSlider extends StatelessWidget {
  buildCarouselSlider({
    required this.itemBuilder,required this.onPageChanged, required this.count, this.isService=true,
  }) ;
  final ExtendedIndexedWidgetBuilder? itemBuilder;
  final Function(int index, CarouselPageChangedReason reason)? onPageChanged;
  final int count;
  final bool isService;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double ratio = MediaQuery.of(context).size.aspectRatio;

    return CarouselSlider.builder(
      itemCount: count ,
      itemBuilder:itemBuilder ,
      options: CarouselOptions(
        onPageChanged: onPageChanged,
        viewportFraction: 0.6,
        // height: isService?height*ratio*0.3:null,
        pauseAutoPlayOnManualNavigate: true,
        aspectRatio: isService? Responsive.isTablet(context)?2.5*ratio:3.8*ratio:Responsive.isTablet(context)?1.49*ratio:2*ratio,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        enlargeCenterPage: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        enableInfiniteScroll: false,
      ),
    );
  }
}

class CarousalCubit extends Cubit<CarousalState> {
  CarousalCubit() : super(initiallState());

  static CarousalCubit get(context) => BlocProvider.of(context);

  int currentIndicator1 = 0;
  int currentIndicator2 = 0;

  cahngeIndicator1(int index){
    currentIndicator1=index;
  emit(initiallState());
  }
 cahngeIndicator2(int index){
    currentIndicator2=index;
  emit(initiallState());
  }


}
abstract class CarousalState{}
 class initiallState extends CarousalState{}