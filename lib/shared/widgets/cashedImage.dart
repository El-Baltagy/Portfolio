import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:messagy_app/shared/changes/colors.dart';

class cashedImage extends StatelessWidget {
   cashedImage({
    required this.width, required this.imageName, required this.height,this.isProject=false,
  });
   final String imageName;
   final double height,width;
   final bool isProject;


  @override
  Widget build(BuildContext context) {
    return ImageNetwork(
      image: imageName,
      height: height,
        width: width,
      duration: 1500,
      fullScreen: false,
      curve: Curves.fastOutSlowIn,
      fitAndroidIos: BoxFit.cover,
      fitWeb: BoxFitWeb.cover,
      borderRadius:   BorderRadius.only(
    topLeft: Radius.circular(isProject?20:0),topRight: Radius.circular(isProject?20:0)
    ),
      onLoading: const CircularProgressIndicator(
        color: primaryColor,
      ),
      onError: const Icon(
        Icons.error,
        color: Colors.red,
      )
    );
  }
}