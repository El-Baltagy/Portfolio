import 'package:bloc/bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagy_app/shared/core/res/responsive.dart';
import '../../screens/app/portfolio/widgets/project_card.dart';
import '../../screens/app/services/widgets/services_card.dart';
import '../changes/utils.dart';

class carousalBloc1 extends StatelessWidget {
  const carousalBloc1({
    super.key,
    required this.cubit,
  });

  final CarousalCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarousalCubit,CarousalState>(
        buildWhen: (previous, current) => previous!=current&&current==cahngeIndc2,
        builder: (context, state) => buildCarouselSlider(
          count: servicesUtils.length,
          isService: true,
          onPageChanged: ( int value,carousalChange) {
            cubit.cahngeIndicator1(value);
          },
          itemBuilder:(BuildContext context, int itemIndex, int i) =>  Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child:ServiceCard(service: servicesUtils[itemIndex]),
          ),
        )
    );
  }
}

class carousalBloc2 extends StatelessWidget {
  const carousalBloc2({
    super.key,
    required this.cubit,
  });

  final CarousalCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarousalCubit,CarousalState>(
        buildWhen: (previous, current) => previous!=current&&current==cahngeIndc2,
        builder: (context, state) => buildCarouselSlider(
          count: projectUtils.length,
          isService: false,
          onPageChanged: ( int value,carousalChange) {
            cubit.cahngeIndicator2(value);
          },
          itemBuilder:(BuildContext context, int itemIndex, int i) =>  Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: ProjectCard(project: projectUtils[itemIndex]),
          ),
        )
    );
  }
}

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
  emit(cahngeIndc1(index));
  }
 cahngeIndicator2(int index){
    currentIndicator2=index;
  emit(cahngeIndc2(index));
  }


}
abstract class CarousalState{}
 class initiallState extends CarousalState{}
 class cahngeIndc1 extends CarousalState{
  final int index;
  cahngeIndc1(this.index);
 }
 class cahngeIndc2 extends CarousalState{
   final int index;
   cahngeIndc2(this.index);
 }