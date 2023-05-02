import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../shared/components.dart';
import '../../background/background.dart';
import 'dart:html';
import 'dart:ui' as ui;

import '../0-main/main_section.dart';

class projectDetail extends StatefulWidget {
//   projectDetail({
//     required this.appName, required this.title, required this.image});
// final String appName,title,image;
  projectDetail();

  @override
  State<projectDetail> createState() => _projectDetailState();
}

class _projectDetailState extends State<projectDetail> {

  final IFrameElement _iFrameElement = IFrameElement();

  @override
  void initState() {
    _iFrameElement.style.height = '100%';
    _iFrameElement.style.width = '90%';
    _iFrameElement.src = 'https://visitevirtuelle.avoriaz.com/en/winter/village/overview';
    _iFrameElement.style.border = 'none';

// ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
          (int viewId) => _iFrameElement,
    );

    super.initState();
  }

  final Widget _iframeWidget = HtmlElementView(
    viewType: 'iframeElement',
    key: UniqueKey(),
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        BackGroundSc(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize:
             Size.fromHeight(7.h),
            child: AppBar(
              elevation: 0,
              leading: IconButton(onPressed: (){
                GoPage().popNavigation(context, path: MainPage());
              }, icon: Icon(Icons.arrow_back)),
              backgroundColor: Colors.transparent,
            ),),

          body:SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: _iframeWidget,
                )
              ],
            ),
          ),

        ),
      ],
    );
  }

}


// class projectDetail extends StatefulWidget {
//   projectDetail({
//     required this.appName, required this.title, required this.image});
// final String appName,title,image;
//
//   @override
//   State<projectDetail> createState() => _projectDetailState();
// }
//
// class _projectDetailState extends State<projectDetail> {
//   late VideoPlayerController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//    Timer(Duration(seconds: 1), () async{
//      await _controller.initialize();
//      _scrollController.animateTo(217, duration: const Duration(seconds: 1),
//          curve: Curves.easeInOutCubic);
//    });
//     // _scrollController.addListener(() {
//     //
//     //   print(_scrollController.offset);
//     // });
//     _controller = VideoPlayerController.network(
//         'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4')
//     // 'https://download1478.mediafire.com/3fhn9fsa3gygiRWDcYqXM7ghDJ5AU7dMoVLPSGZiG-1rLT2OUVCh0HSdTjnodEctSiYJ4_-qNVfyttynUJZ_DEeeSE9r-kg/60b29io3x6akqeu/intro.mp4'  )
//     ..addListener(() => setState(() {
//         videoPosition = _controller.value.position;
//       }))
//       ..initialize().then((_) => setState(() {
//         videoLength = _controller.value.duration;
//         _controller.pause();
//       }));
//   }
//
//   late Duration videoLength;
//   late Duration videoPosition;
//   double volume = 0.5;
//   ScrollController _scrollController=ScrollController();
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Stack(
//       children: [
//         BackGroundSc(),
//         Scaffold(
//           backgroundColor: Colors.transparent,
//           appBar: PreferredSize(
//             preferredSize:
//              Size.fromHeight(8.h),
//             child: AppBar(
//               elevation: 0,
//               leading: IconButton(onPressed: (){
//                 _controller.pause().then((value) {
//                   GoPage().popNavigation(context, path: MainPage());
//                 });
//               }, icon: Icon(Icons.arrow_back)),
//               backgroundColor: Colors.transparent,
//             ),),
//
//           body: SingleChildScrollView(
//             controller: _scrollController,
//             child: Column(
//               children: <Widget>[
//                 if (_controller.value.isInitialized)
//                   ...[
//                   Stack(
//                     children: [
//                       AspectRatio(
//                         aspectRatio: 16/9,
//                         child: _controller.value.isPlaying?VideoPlayer(_controller,
//                         ):
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             image: DecorationImage(
//                                 image: AssetImage(widget.image),
//                                 fit: BoxFit.cover),
//                           )
//                         ),
//                       ),
//                     ],
//                   ),
//                   VideoProgressIndicator(
//                     _controller,
//                     allowScrubbing: true,
//                     padding: EdgeInsets.all(10),
//                   ),
//                   Row(
//                     children: <Widget>[
//                       IconButton(
//                         icon: Icon(_controller.value.isPlaying
//                             ? Icons.pause
//                             : Icons.play_arrow),
//                         onPressed: () {
//                           setState(() async{
//                             _controller.value.isPlaying
//                                 ? await _controller.pause()
//                                 : await _controller.play();
//                           });
//                         },
//                       ),
//                       Text(
//                           '${convertToMinutesSeconds(videoPosition)} / ${convertToMinutesSeconds(videoLength)}'),
//                       SizedBox(width: 10),
//                       Icon(animatedVolumeIcon(volume)),
//                       Slider(
//                         value: volume,
//                         min: 0,
//                         max: 1,
//                         onChanged: (_volume) => setState(() async{
//                           volume = _volume;
//                           await _controller.setVolume(_volume);
//                         }),
//                       ),
//                       Spacer(),
//                       IconButton(
//                           icon: Icon(
//                             Icons.loop,
//                             color: _controller.value.isLooping
//                                 ? Colors.green
//                                 : Colors.black,
//                           ),
//                           onPressed: () {
//                             setState(() async{
//                             await  _controller
//                                   .setLooping(!_controller.value.isLooping);
//                             });
//                           }),
//                     ],
//                   )
//                 ] ,
//                 Row(
//                   children: [
//                     Text('Project Name'+' : ',
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,color: theme.textColor
//                     ),),
//                     Text(widget.appName,
//                     style: TextStyle(
//                       color: theme.textColor
//                     ),),
//
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Text('Description'+' : ',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,color: theme.textColor
//                     ),),
//                     Text(widget.title,
//                     style: TextStyle(
//                       color: theme.textColor
//                     ),),
//
//                   ],
//                 )
//
//               ],
//             ),
//           ),
//
//         ),
//       ],
//     );
//   }
//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
// }
//
// String convertToMinutesSeconds(Duration duration) {
//   final parsedMinutes = duration.inMinutes < 10
//       ? '0${duration.inMinutes}'
//       : duration.inMinutes.toString();
//
//   final seconds = duration.inSeconds % 60;
//
//   final parsedSeconds =
//   seconds < 10 ? '0${seconds % 60}' : (seconds % 60).toString();
//   return '$parsedMinutes:$parsedSeconds';
// }
//
// IconData animatedVolumeIcon(double volume) {
//   if (volume == 0)
//     return Icons.volume_mute;
//   else if (volume < 0.5)
//     return Icons.volume_down;
//   else
//     return Icons.volume_up;
// }


