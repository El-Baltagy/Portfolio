

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

final homeKey = new GlobalKey();
final portfolioKey =new GlobalKey();
final serviceKey = new GlobalKey();
final contactKey =new  GlobalKey();

final duration =Duration(
    seconds: 1,
    milliseconds: 200
);
final curve =Curves.fastOutSlowIn;

final Duration delayEntrance= Duration(milliseconds: 500);
final Duration noDelayEntrance= Duration(milliseconds: 0);


final Duration durationEntrance=Duration(seconds: 1);
final Duration noDurationEntrance=Duration(seconds: 0);


final Offset offsetEntrance=Offset(-40.w,0);
final Offset noOffsetEntrance=Offset(0,0);