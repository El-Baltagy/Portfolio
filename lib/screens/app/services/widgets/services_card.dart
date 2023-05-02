import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:messagy_app/shared/core/configs/configs.dart';
import 'package:sizer/sizer.dart';
import '../../../../shared/changes/colors.dart';
import '../../../../shared/core/res/responsive.dart';
import '../../../../shared/changes/utils.dart';
import '../../../../shared/widgets/cashedImage.dart';

class ServiceCard extends StatefulWidget {
  final ServicesUtils service;

  const ServiceCard({Key? key, required this.service,}) : super(key: key);

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      width: Responsive.isDesktop(context) ? 14.w : 40.w,
      height: Responsive.isDesktop(context) ?38.h:20.h,

      padding:  EdgeInsets.symmetric(vertical:Responsive.isDesktop(context) ? 20:10, horizontal: 20.0),
      decoration: BoxDecoration(
        gradient: theme.card,
        borderRadius: BorderRadius.circular(15),
        boxShadow:  [blackColorShadow],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [

          if (widget.service.tool.length==0)   Spacer(),
          // widget.service.isSvg?
          // SvgPicture.network(
          //     widget.service.icon,
          //     height: 60,
          //   ):Image.network(widget.service.icon,height: 60,),
      cashedImage(
      height: 8.h,
      width:60 ,
      imageName:widget.service.icon ,
       ),
          if (widget.service.tool.length==0) Spacer(),
          Space.y(2.w)!,
          Text(widget.service.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                color:  theme.textColor,
              )),
      if (widget.service.tool!=[])
      ...[

        Space.y(3.w)!,
        if (Responsive.isDesktop(context))
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.service.tool
                  .map((e) => Row(
                children: [
                  const Text('🛠   '),
                  Text(e,
                      style: TextStyle(
                        color:
                         theme.textColor,
                      )),
                ],
              ))
                  .toList()),
        if (!Responsive.isDesktop(context))
          Expanded(
            child: ListView(
                // padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: widget.service.tool
                    .map((e) => Row(
                  children: [
                    const Text('🛠   '),
                    Text(e,
                        style: TextStyle(
                          color:
                              theme.textColor,
                        )),
                  ],
                ))
                    .toList()),
          )
      ]
        ],
      ),
    );
  }
}
// Text(servicesUtils.elementAt(index).tool[index] ),