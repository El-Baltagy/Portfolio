import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../../screens/app/0-main/cubit/main_cubit.dart';
import '../../screens/app/contact/contact.dart';
import '../../screens/app/home/home.dart';
import '../../screens/app/home/widgets/texts.dart';
import '../../screens/app/portfolio/portfolio.dart';
import '../../screens/app/services/services.dart';
import 'constants.dart';
import 'strings.dart';

class BodyUtils {

  static  List<Widget> viewsVT = [

    HomePage(key: homeKey),
    // Education(),
    Services(key: serviceKey),
    Portfolio(key:portfolioKey ),
    Contact(key: contactKey),
    // Container(key: contactKey),

  ];
}
class NavBarUtils {
  static const List<String> names = [
    'HOME',
    'SERVICE',
    // 'SERVICES',
    'WORKS',
    'CONTACT',
  ];

  static const List<IconData> icons = [
    Icons.home,
    Icons.person,
    // Icons.build,
    Icons.work,
    // Icons.settings,
    Icons.contact_page,
  ];
}

List<AnimatedText> deskTopList() {
  return List<AnimatedText>.generate(
      AnimatiobText().animationtxt.length,
          (index) => flickerAnimatedText(fontSize:20 ,text:AnimatiobText().animationtxt[index] )
  );
}
List<AnimatedText> contactList() {
  return List<AnimatedText>.generate(
      AnimatiobText().animyContactTxt.length,
          (index) => RotatedAnimatedText(text:AnimatiobText().animyContactTxt[index] )
  );
}


class ServicesUtils {
  final String name;
  final String icon;
  final bool isSvg;
  final List<String> tool;

  ServicesUtils(
      {required this.name,
        required this.icon,
        required this.tool,
        required this.isSvg,
      });
}
List<ServicesUtils> servicesUtils = [
  ServicesUtils(
      name: 'VFX Editor',
      icon: StaticImage.graphics,

      tool: ['PhotoShop', 'Illustrator', 'After Effects'],
      isSvg: true
  ),

  ServicesUtils(
      name: 'Flutter Development',
      icon:  StaticImage.flutter ,

      tool: ['Android', 'IOS', 'Web'],
      isSvg: false
  ),
  ServicesUtils(
      name: 'Native Android Development',
      icon: StaticImage.android,
      tool: [],
      isSvg: true
  ),

  ServicesUtils(
      name: 'Back End Development',
      icon: StaticImage.laravel ,
      tool: [],
      isSvg: true
  ),


];

class ProjectUtils {
  final String banners;
  final String titles;
  final String description;
  final String links;
  ProjectUtils({
    required this.banners,
    required this.titles,
    required this.description,
    required this.links,
  });
}
List<ProjectUtils> projectUtils = [

  ProjectUtils(
    banners: StaticImage.portfolio,
    titles: 'Personal Portfolio',
    description:
    'A personal Portfolio shows my recent projects, it comes with a modern ui/ux, Responsive interface for all devices and beautiful Animation built with Lottie & aftereffects',
    links: 'https://github.com/El-Baltagy/Portfolio',
  ),
  ProjectUtils(
    banners: StaticImage.realStateWeb,
    titles: 'Real State Website',
    description:
    'A Website for building and real estate Company, It comes with a Responsive interface for mobile, tablet & Desktop Experience.',
    links: 'https://github.com/El-Baltagy/Real-State-Website',
  ),
  ProjectUtils(
    banners: StaticImage.messagey,
    titles: 'Messagey App',
    description:
    'A simple group chat app built with firebase as Backend, has a modern up/ux and Google & email sign in method.',
    links: 'https://github.com/El-Baltagy/Messagey-App',
  ),
  ProjectUtils(
    banners: StaticImage.foodyApp,
    titles: 'Foody App',
    description:
    'A food app with a modern ui/ux that provides the newest food meals, comes with loading Skelton, share application through social media apps and react with each meal to save them in local data base as Favorites.',
    links: 'https://github.com/El-Baltagy/Foody-App',
  ),
  ProjectUtils(
    banners: StaticImage.newsApp,
    titles: 'Newslly App',
    description:
    'A news app that tells you the news of... Health, sports, Business, Entertainment, crypto…..etc. for more than 52 countries around world. In addition to live content for worldwide news channels Like BBC and a localization for 3 languages Arabic, English and French.',
    links: 'https://github.com/El-Baltagy/Newslly-App',
  ),
  ProjectUtils(
    banners: StaticImage.taskApp,
    titles: 'Tasky App',
    description:
    'A simple app to manage your daily tasks....including add, edit or remove task, with a local storage database As SQLite.',
    links: 'https://github.com/El-Baltagy/Tasky-app',
  ),

];

class ContactUtils {
  final String url;
  final String icon;


  ContactUtils({required this.url, required this.icon});
}
List<ContactUtils> contactUtils = [

  // ContactUtils(
  //     url: fiverr,
  //     icon: "https://img.icons8.com/ios-filled/50/000000/fiverr.png"),
  // ContactUtils(
  //     url: upwork,
  //     icon: "https://img.icons8.com/ios-filled/50/000000/upwork.png"),
  // ContactUtils(
  //     url: instagram,
  //     icon: "https://img.icons8.com/glyph-neue/64/000000/instagram-new.png"),
  // ContactUtils(
  //     url: twitter,
  //     icon: "https://img.icons8.com/fluency/48/000000/twitter.png"),
  ContactUtils(
      url: facebook,
      icon: "https://img.icons8.com/ios-filled/50/000000/facebook-new.png"),

  ContactUtils(
      url: whatsapp,
      icon: "https://img.icons8.com/material-outlined/48/000000/whatsapp.png",
  ),

  // ContactUtils(
  //     url: youtube,
  //     icon: "https://img.icons8.com/ios-filled/50/000000/youtube-play.png"),
  ContactUtils(
      url: linkedin,
      icon: "https://img.icons8.com/ios-filled/50/000000/linkedin.png"),
  ContactUtils(
      url: gitHub,
      icon: "https://img.icons8.com/ios-glyphs/60/000000/github.png"),

];
