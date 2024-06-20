import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:translator/gen/assets.gen.dart';
import 'package:translator/vars.dart';
import 'package:translator/view/loginView.dart';
import 'package:translator/view/translateView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Translator',
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('fa'),
        ],
        locale: const Locale('fa'),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: const ColorScheme.light(
                // primary: Color(0xff4A55A2),
                primary: Color(0xff1A2130),
                onPrimary: Color(0xffFAFAFA),
                // secondary: Color(0xff7FC7D9),
                secondary: Color(0xff83B4FF),
                onSecondary: Color(0xff0C0C0C),
                surface: Color(0xffF4F4F5),
                onSurface: Color(0xff0C0C0C)),
            // scaffoldBackgroundColor: bgColor,
            useMaterial3: true,
            textTheme: GoogleFonts.vazirmatnTextTheme(
                    Theme.of(context).textTheme)
                .apply(
                  bodyColor: Colors.white,
                )
                .copyWith(
                  displayLarge: GoogleFonts.vazirmatn(
                      textStyle:
                          TextStyle(fontSize: 38, fontWeight: FontWeight.bold)),
                  displayMedium: GoogleFonts.vazirmatn(
                      textStyle:
                          TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
                  displaySmall: GoogleFonts.vazirmatn(
                      textStyle:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  bodyLarge: GoogleFonts.vazirmatn(
                      textStyle:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  bodyMedium:
                      GoogleFonts.vazirmatn(textStyle: TextStyle(fontSize: 20)),
                  bodySmall:
                      GoogleFonts.vazirmatn(textStyle: TextStyle(fontSize: 18)),
                )),
        home: const LoginView());
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();

  @override
  void initState() {
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.fromLTRB(32, 32, 32, 32),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadiusOut),
                color: Colors.white,
                boxShadow: [BoxShadow(blurRadius: 32, color: Colors.black12)]),
            child: SideMenu(
              title: Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Assets.icons.translate.svg(),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'ترنسلیتور',
                        style: themeData.textTheme.bodyLarge,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                ],
              ),
              controller: sideMenu,
              style: SideMenuStyle(
                // showTooltip: false,
                displayMode: SideMenuDisplayMode.auto,
                showHamburger: true,
                hoverColor: themeData.colorScheme.secondary.withAlpha(20),
                // selectedHoverColor: themeData.colorScheme.surface,
                selectedColor: themeData.colorScheme.secondary,
                selectedTitleTextStyle: themeData.textTheme.bodyMedium!
                    .apply(color: themeData.colorScheme.onPrimary),
                selectedIconColor: themeData.colorScheme.onPrimary,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadiusOut),
                ),
                // backgroundColor: Colors.white,
                iconSize: 20,
                itemBorderRadius: const BorderRadius.all(
                  Radius.circular(borderRadiusIn),
                ),
                showTooltip: true,
                itemHeight: 50,
                itemInnerSpacing: 8.0,
                itemOuterPadding: const EdgeInsets.symmetric(vertical: 5),
              ),
              // title: Column(
              //   children: [
              //     ConstrainedBox(
              //       constraints: const BoxConstraints(
              //         maxHeight: 150,
              //         maxWidth: 150,
              //       ),
              //       child: Row(
              //         children: [
              //           Assets.icons.translate.svg(),
              //           const SizedBox(width: 8,),
              //           Text('ترنسلیتور', style: themeData.textTheme.bodyLarge,)
              //         ],
              //       )
              //     ),
              //     Divider(
              //       color: themeData.colorScheme.onSurface.withAlpha(100),
              //       indent: 8.0,
              //       endIndent: 8.0,
              //     ),
              //   ],
              // ),
              // footer: Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Container(
              //     decoration: BoxDecoration(
              //         color: Colors.lightBlue[50],
              //         borderRadius: BorderRadius.circular(12)),
              //     child: Padding(
              //       padding:
              //           const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              //       child: Text(
              //         'mohada',
              //         style: TextStyle(fontSize: 15, color: Colors.grey[800]),
              //       ),
              //     ),
              //   ),
              // ),
              items: [
                SideMenuItem(
                  title: '',
                  onTap: (index, _) {
                    sideMenu.changePage(index);
                  },
                  iconWidget: Row(
                    children: [
                      Icon(Icons.space_dashboard_rounded),
                      const SizedBox(
                        width: 16,
                      ),
                      Text('داشبورد')
                    ],
                  ),
                  tooltipContent: "داشبورد",
                ),
                SideMenuItem(
                  title: ' ',
                  onTap: (index, _) {
                    sideMenu.changePage(index);
                  },
                  iconWidget: Row(
                    children: [
                      Icon(Icons.file_copy),
                      const SizedBox(
                        width: 16,
                      ),
                      Text('فایل ها')
                    ],
                  ),
                  tooltipContent: "فایل ها",
                ),
                SideMenuItem(
                  builder: (context, displayMode) {
                    return Divider(
                      thickness: 2,
                      color: themeData.colorScheme.onSurface.withAlpha(15),
                      endIndent: 8,
                      indent: 8,
                    );
                  },
                ),
                SideMenuItem(
                  title: '   ',
                  onTap: (index, _) {
                    sideMenu.changePage(index);
                  },
                  iconWidget: Row(
                    children: [
                      Icon(Icons.person),
                      const SizedBox(
                        width: 16,
                      ),
                      Text('حساب کاربری')
                    ],
                  ),
                  tooltipContent: "حساب کاربری",
                ),
                SideMenuItem(
                  title: '    ',
                  onTap: (index, _) {
                    sideMenu.changePage(index);
                  },
                  iconWidget: Row(
                    children: [
                      Icon(Icons.settings),
                      const SizedBox(
                        width: 16,
                      ),
                      Text('تنظیمات')
                    ],
                  ),
                  tooltipContent: "تنظیمات",
                ),
                SideMenuItem(
                  title: '     ',
                  onTap: (index, _) {
                    Get.off(const LoginView());
                  },
                  iconWidget: Row(
                    children: [
                      Icon(Icons.exit_to_app_rounded,
                          color: Colors.red.shade300),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        'خروج',
                        style: themeData.textTheme.bodyMedium!
                            .apply(color: Colors.red.shade300),
                      )
                    ],
                  ),
                  tooltipContent: "خروج",
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          // VerticalDivider(
          //   thickness: 2,
          //   color: themeData.colorScheme.onSurface.withAlpha(40),
          //   width: 0,
          // ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(32),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadiusOut),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(blurRadius: 32, color: Colors.black12)
                  ]),
              child: PageView(
                controller: pageController,
                children: [
                  TranslateView(),
                  Container(
                    color: Colors.white,
                    child: const Center(
                      child: Text(
                        'فایل ها',
                        style: TextStyle(fontSize: 35),
                      ),
                    ),
                  ),
                  const SizedBox.shrink(),
                  Container(
                    color: Colors.white,
                    child: const Center(
                      child: Text(
                        'حساب کاربری',
                        style: TextStyle(fontSize: 35),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: const Center(
                      child: Text(
                        'تنظیمات',
                        style: TextStyle(fontSize: 35),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}













// import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:translator/gen/assets.gen.dart';
// import 'package:translator/vars.dart';
// import 'package:translator/view/PricingView.dart';
// import 'package:translator/view/aboutView.dart';
// import 'package:translator/view/homeView.dart';
// import 'package:translator/view/translateView.dart';
// import 'package:translator/widgets/buttons.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'مترجم',
//         localizationsDelegates: const [
//           GlobalMaterialLocalizations.delegate,
//           GlobalWidgetsLocalizations.delegate,
//           GlobalCupertinoLocalizations.delegate,
//         ],
//         supportedLocales: const [
//           Locale('fa'),
//         ],
//         locale: const Locale('fa'),
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//             colorScheme: const ColorScheme.light(
//                 primary: Color(0xff4A55A2),
//                 onPrimary: Color(0xffFAFAFA),
//                 secondary: Color(0xff7FC7D9),
//                 onSecondary: Color(0xff0C0C0C),
//                 surface: Color(0xffF4F4F5),
//                 onSurface: Color(0xff0C0C0C)),
//             // scaffoldBackgroundColor: bgColor,
//             useMaterial3: true,
//             textTheme: GoogleFonts.vazirmatnTextTheme(
//                     Theme.of(context).textTheme)
//                 .apply(
//                   bodyColor: Colors.white,
//                 )
//                 .copyWith(
//                   displayLarge: GoogleFonts.vazirmatn(
//                       textStyle:
//                           TextStyle(fontSize: 38, fontWeight: FontWeight.bold)),
//                   displayMedium: GoogleFonts.vazirmatn(
//                       textStyle:
//                           TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
//                   displaySmall: GoogleFonts.vazirmatn(
//                       textStyle:
//                           TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
//                   bodyLarge: GoogleFonts.vazirmatn(
//                       textStyle:
//                           TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//                   bodyMedium:
//                       GoogleFonts.vazirmatn(textStyle: TextStyle(fontSize: 22)),
//                   bodySmall:
//                       GoogleFonts.vazirmatn(textStyle: TextStyle(fontSize: 20)),
//                 )),
//         home: const MainScreen());
//   }
// }

// const int homeIndex = 0;
// const int translateIndex = 1;
// const int pricingIndex = 2;
// const int aboutIndex = 3;

// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Stack(
//           children: [
//             Positioned.fill(
//               child: IndexedStack(
//                 index: selectedIndex,
//                 children: const [
//                   HomeView(),
//                   TranslateView(),
//                   PricingView(),
//                   AboutView()
//                 ],
//               ),
//             ),
//             Positioned(
//                 top: 0,
//                 left: 0,
//                 right: 0,
//                 child: Header(
//                   selectedIndex: selectedIndex,
//                   onTap: (int index) {
//                     setState(() {
//                       selectedIndex = index;
//                     });
//                   },
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Header extends StatelessWidget {
//   final Function(int tabIndex) onTap;
//   final int selectedIndex;

//   const Header({super.key, required this.onTap, required this.selectedIndex});

//   @override
//   Widget build(BuildContext context) {
//     ThemeData themeData = Theme.of(context);
//     return Container(
//       height: 90,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         //  boxShadow: [
//         //   BoxShadow(blurRadius: 32, color: Colors.grey.withOpacity(0.1))
//         // ]
//       ),
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(32, 16, 32, 8),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Assets.icons.translate.svg(),
//                 const SizedBox(
//                   width: 8,
//                 ),
//                 Text(
//                   'ترنسلیتور',
//                   style: themeData.textTheme.bodyLarge,
//                 )
//               ],
//             ),
//             Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   HeaderItem(
//                     isActive: selectedIndex == homeIndex ? true : false,
//                     onTap: () {
//                       onTap(homeIndex);
//                     },
//                     activeIconImage: Assets.icons.homeActive.svg(),
//                     iconImage: Assets.icons.home.svg(),
//                     title: 'خــــــانه',
//                   ),
//                   const SizedBox(
//                     width: 24,
//                   ),
//                   HeaderItem(
//                     isActive: selectedIndex == translateIndex ? true : false,
//                     onTap: () {
//                       onTap(translateIndex);
//                     },
//                     activeIconImage: Assets.icons.translateActive.svg(),
//                     iconImage: Assets.icons.translate.svg(),
//                     title: 'ترجــــمه',
//                   ),
//                   const SizedBox(
//                     width: 24,
//                   ),
//                   HeaderItem(
//                     isActive: selectedIndex == pricingIndex ? true : false,
//                     onTap: () {
//                       onTap(pricingIndex);
//                     },
//                     activeIconImage: Assets.icons.pricingActive.svg(),
//                     iconImage: Assets.icons.pricing.svg(),
//                     title: 'تعرفه ها',
//                   ),
//                   const SizedBox(
//                     width: 24,
//                   ),
//                   HeaderItem(
//                     isActive: selectedIndex == aboutIndex ? true : false,
//                     onTap: () {
//                       onTap(aboutIndex);
//                     },
//                     activeIconImage: Assets.icons.aboutActive.svg(),
//                     iconImage: Assets.icons.about.svg(),
//                     title: 'دربــــاره',
//                   ),
//                 ]),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 MyBorderedButton(
//                     title: 'ورود', icon: null, onTap: () {}, onHover: (b) {}),
//                 const SizedBox(
//                   width: 16,
//                 ),
//                 MyPrimaryButton(
//                     title: 'ثبت نام',
//                     icon: null,
//                     onTap: () {},
//                     onHover: (b) {}),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class HeaderItem extends StatelessWidget {
//   final iconImage;
//   final activeIconImage;
//   final title;
//   final bool isActive;
//   final Function() onTap;

//   const HeaderItem(
//       {super.key,
//       required this.title,
//       required this.iconImage,
//       required this.onTap,
//       required this.isActive,
//       this.activeIconImage});
//   @override
//   Widget build(BuildContext context) {
//     ThemeData themeData = Theme.of(context);
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
//       child: InkWell(
//         onTap: onTap,
//         child: SizedBox(
//           width: 80,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Row(
//                 children: [
//                   // iconImage,
//                   // const SizedBox(
//                   //   width: 8,
//                   // ),
//                   Text(title,
//                       style: isActive
//                           ? themeData.textTheme.bodyMedium!
//                               .apply(color: themeData.colorScheme.primary)
//                           : themeData.textTheme.bodyMedium),
//                 ],
//               ),
//               const SizedBox(
//                 height: 8,
//               ),
//               isActive
//                   ? Container(
//                       padding: EdgeInsets.only(top: 8),
//                       width: 80,
//                       height: 2,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(borderRadiusOut),
//                           gradient: LinearGradient(colors: [
//                             themeData.colorScheme.secondary,
//                             themeData.colorScheme.primary,
//                           ]),
//                           // color: themeData.colorScheme.primary,
//                           boxShadow: [
//                             BoxShadow(
//                                 blurRadius: 16,
//                                 color: themeData.colorScheme.primary
//                                     .withAlpha(150))
//                           ]),
//                     )
//                   : SizedBox()
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final ThemeData themeData = Theme.of(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Row(
//               children: [
//                 Container(
//                   width: 20,
//                   height: 20,
//                   color: Colors.red,
//                 ),
//                 const SizedBox(
//                   width: 16,
//                 ),
//                 Text(
//                   'ترنسلیتور',
//                   style: themeData.textTheme.bodyMedium,
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 MyTextButton(
//                     title: 'خانه',
//                     icon: Assets.icons.home.svg(),
//                     onTap: () {},
//                     onHover: (b) {}),
//                 MyTextButton(
//                     title: 'ترجمه',
//                     icon: Assets.icons.translate.svg(),
//                     onTap: () {},
//                     onHover: (b) {}),
//                 MyTextButton(
//                     title: 'تعرفه ها',
//                     icon: Assets.icons.pricing.svg(),
//                     onTap: () {},
//                     onHover: (b) {}),
//                 MyTextButton(
//                     title: 'درباره ما',
//                     icon: Assets.icons.about.svg(),
//                     onTap: () {},
//                     onHover: (b) {}),
//               ],
//             ),
//             Row(
//               children: [
//                 MyPrimaryButton(
//                     title: 'ثبت نام',
//                     onTap: () {},
//                     onHover: (b) {}),
//                 MyBorderedButton(
//                     title: 'ورود',
//                     onTap: () {},
//                     onHover: (b) {}),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
