import 'dart:ui';

// import 'package:bit_fly/welcome.dart';
import 'package:flash_chat_flutter/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';

// import 'package:introduction_screen/introduction_screen.dart';
import 'price_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TestScreen(),
    );
  }
}

class TestScreen extends StatelessWidget {
  final List<Introduction> list = [
    Introduction(
      title: 'View',
      subTitle: 'Browse the menu directly from the application',
      imageUrl: 'Image/bit.png',
    ),
    Introduction(
      title: 'View',
      subTitle: 'Browse the menu directly from the application',
      imageUrl: 'Image/bit.png',
    ),
    Introduction(
      title: 'View',
      subTitle: 'Browse the menu directly from the application',
      imageUrl: 'Image/bit.png',
    ),
    Introduction(
      title: 'View',
      subTitle: 'Browse the menu directly from the application',
      imageUrl: 'Image/bit.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      introductionList: list,
      onTapSkipButton: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WelcomeScreen(),
          ), //MaterialPageRoute
        );
      },
    );
  }
}

// // import 'package:courseapplandingpage/home.dart';
// // import 'package:courseapplandingpage/onboard/onboard_model.dart';
// // import 'package:flutter/material.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// //
// // // import '../constant.dart';
// //
// // class OnBoard extends StatefulWidget {
// //   @override
// //   _OnBoardState createState() => _OnBoardState();
// // }
// //
// // class _OnBoardState extends State<OnBoard> {
// //   int currentIndex = 0;
// //   Color kblue = Color(0xFF4756DF);
// //   Color kwhite = Color(0xFFFFFFFF);
// //   Color kblack = Color(0xFF000000);
// //   Color kbrown300 = Color(0xFF8D6E63);
// //   Color kbrown = Color(0xFF795548);
// //   Color kgrey = Color(0xFFC0C0C0);
// //
// //   PageController _pageController;
// //   List<OnboardModel> screens = <OnboardModel>[
// //     OnboardModel(
// //       img: 'assets/images/img-1.png',
// //       text: "Belajar Dengan Metode Learning by Doing",
// //       desc:
// //           "Sebuah metode belajar yang terbuktiampuh dalam meningkatkan produktifitas belajar, Learning by Doing",
// //       bg: Colors.white,
// //       button: Color(0xFF4756DF),
// //     ),
// //     OnboardModel(
// //       img: 'assets/images/img-2.png',
// //       text: "Dapatkan Kemudahan Akses Kapanpun dan Dimanapun",
// //       desc:
// //           "Tidak peduli dimanapun kamu, semua kursus yang telah kamu ikuti bias kamu akses sepenuhnya",
// //       bg: Color(0xFF4756DF),
// //       button: Colors.white,
// //     ),
// //     OnboardModel(
// //       img: 'assets/images/img-3.png',
// //       text: "Gunakan Fitur Kolaborasi Untuk Pengalaman Lebih",
// //       desc:
// //           "Tersedia fitur Kolaborasi dengan tujuan untuk mengasah skill lebih dalam karena bias belajar bersama",
// //       bg: Colors.white,
// //       button: Color(0xFF4756DF),
// //     ),
// //   ];
// //
// //   @override
// //   void initState() {
// //     _pageController = PageController(initialPage: 0);
// //     super.initState();
// //   }
// //
// //   @override
// //   void dispose() {
// //     _pageController.dispose();
// //     super.dispose();
// //   }
// //
// //   _storeOnboardInfo() async {
// //     print("Shared pref called");
// //     int isViewed = 0;
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     await prefs.setInt('onBoard', isViewed);
// //     print(prefs.getInt('onBoard'));
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: currentIndex % 2 == 0 ? kwhite : kblue,
// //       appBar: AppBar(
// //         backgroundColor: currentIndex % 2 == 0 ? kwhite : kblue,
// //         elevation: 0.0,
// //         actions: [
// //           TextButton(
// //             onPressed: () {
// //               _storeOnboardInfo();
// //               Navigator.pushReplacement(context,
// //                   MaterialPageRoute(builder: (context) => PriceScreen()));
// //             },
// //             child: Text(
// //               "Skip",
// //               style: TextStyle(
// //                 color: currentIndex % 2 == 0 ? kblack : kwhite,
// //               ),
// //             ),
// //           )
// //         ],
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.symmetric(horizontal: 20.0),
// //         child: PageView.builder(
// //             itemCount: screens.length,
// //             controller: _pageController,
// //             physics: NeverScrollableScrollPhysics(),
// //             onPageChanged: (int index) {
// //               setState(() {
// //                 currentIndex = index;
// //               });
// //             },
// //             itemBuilder: (_, index) {
// //               return Column(
// //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                 crossAxisAlignment: CrossAxisAlignment.center,
// //                 mainAxisSize: MainAxisSize.min,
// //                 children: [
// //                   Image.asset(screens[index].img),
// //                   Container(
// //                     height: 10.0,
// //                     child: ListView.builder(
// //                       itemCount: screens.length,
// //                       shrinkWrap: true,
// //                       scrollDirection: Axis.horizontal,
// //                       itemBuilder: (context, index) {
// //                         return Row(
// //                             mainAxisAlignment: MainAxisAlignment.center,
// //                             children: [
// //                               Container(
// //                                 margin: EdgeInsets.symmetric(horizontal: 3.0),
// //                                 width: currentIndex == index ? 25 : 8,
// //                                 height: 8,
// //                                 decoration: BoxDecoration(
// //                                   color: currentIndex == index
// //                                       ? kbrown
// //                                       : kbrown300,
// //                                   borderRadius: BorderRadius.circular(10.0),
// //                                 ),
// //                               ),
// //                             ]);
// //                       },
// //                     ),
// //                   ),
// //                   Text(
// //                     screens[index].text,
// //                     textAlign: TextAlign.center,
// //                     style: TextStyle(
// //                       fontSize: 27.0,
// //                       fontWeight: FontWeight.bold,
// //                       fontFamily: 'Poppins',
// //                       color: index % 2 == 0 ? kblack : kwhite,
// //                     ),
// //                   ),
// //                   Text(
// //                     screens[index].desc,
// //                     textAlign: TextAlign.center,
// //                     style: TextStyle(
// //                       fontSize: 14.0,
// //                       fontFamily: 'Montserrat',
// //                       color: index % 2 == 0 ? kblack : kwhite,
// //                     ),
// //                   ),
// //                   InkWell(
// //                     onTap: () async {
// //                       print(index);
// //                       if (index == screens.length - 1) {
// //                         await _storeOnboardInfo();
// //                         Navigator.pushReplacement(
// //                             context,
// //                             MaterialPageRoute(
// //                                 builder: (context) => PriceScreen()));
// //                       }
// //
// //                       _pageController.nextPage(
// //                         duration: Duration(milliseconds: 300),
// //                         curve: Curves.bounceIn,
// //                       );
// //                     },
// //                     child: Container(
// //                       padding:
// //                           EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
// //                       decoration: BoxDecoration(
// //                           color: index % 2 == 0 ? kblue : kwhite,
// //                           borderRadius: BorderRadius.circular(15.0)),
// //                       child: Row(mainAxisSize: MainAxisSize.min, children: [
// //                         Text(
// //                           "Next",
// //                           style: TextStyle(
// //                               fontSize: 16.0,
// //                               color: index % 2 == 0 ? kwhite : kblue),
// //                         ),
// //                         SizedBox(
// //                           width: 15.0,
// //                         ),
// //                         Icon(
// //                           Icons.arrow_forward_sharp,
// //                           color: index % 2 == 0 ? kwhite : kblue,
// //                         )
// //                       ]),
// //                     ),
// //                   )
// //                 ],
// //               );
// //             }),
// //       ),
// //     );
// //   }
// // }
// //
// // class OnboardModel {
// //   String img;
// //   String text;
// //   String desc;
// //   Color bg;
// //   Color button;
// //
// //   OnboardModel({
// //     this.img,
// //     this.text,
// //     this.desc,
// //     this.bg,
// //     this.button,
// //   });
// // }
