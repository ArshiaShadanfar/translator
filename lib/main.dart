import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:translator/gen/assets.gen.dart';
import 'package:translator/vars.dart';
import 'package:translator/view/PricingView.dart';
import 'package:translator/view/aboutView.dart';
import 'package:translator/view/homeView.dart';
import 'package:translator/view/translateView.dart';
import 'package:translator/widgets/buttons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'مترجم',
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
                primary: Color(0xff4A55A2),
                onPrimary: Color(0xffFAFAFA),
                secondary: Color(0xff7FC7D9),
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
                      GoogleFonts.vazirmatn(textStyle: TextStyle(fontSize: 22)),
                  bodySmall:
                      GoogleFonts.vazirmatn(textStyle: TextStyle(fontSize: 20)),
                )),
        home: const MainScreen());
  }
}

const int homeIndex = 0;
const int translateIndex = 1;
const int pricingIndex = 2;
const int aboutIndex = 3;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned.fill(
              child: IndexedStack(
                index: selectedIndex,
                children: const [
                  HomeView(),
                  TranslateView(),
                  PricingView(),
                  AboutView()
                ],
              ),
            ),
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Header(
                  selectedIndex: selectedIndex,
                  onTap: (int index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ))
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  final Function(int tabIndex) onTap;
  final int selectedIndex;

  const Header({super.key, required this.onTap, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        //  boxShadow: [
        //   BoxShadow(blurRadius: 32, color: Colors.grey.withOpacity(0.1))
        // ]
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(32, 16, 32, 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
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
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HeaderItem(
                    isActive: selectedIndex == homeIndex ? true : false,
                    onTap: () {
                      onTap(homeIndex);
                    },
                    activeIconImage: Assets.icons.homeActive.svg(),
                    iconImage: Assets.icons.home.svg(),
                    title: 'خــــــانه',
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  HeaderItem(
                    isActive: selectedIndex == translateIndex ? true : false,
                    onTap: () {
                      onTap(translateIndex);
                    },
                    activeIconImage: Assets.icons.translateActive.svg(),
                    iconImage: Assets.icons.translate.svg(),
                    title: 'ترجــــمه',
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  HeaderItem(
                    isActive: selectedIndex == pricingIndex ? true : false,
                    onTap: () {
                      onTap(pricingIndex);
                    },
                    activeIconImage: Assets.icons.pricingActive.svg(),
                    iconImage: Assets.icons.pricing.svg(),
                    title: 'تعرفه ها',
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  HeaderItem(
                    isActive: selectedIndex == aboutIndex ? true : false,
                    onTap: () {
                      onTap(aboutIndex);
                    },
                    activeIconImage: Assets.icons.aboutActive.svg(),
                    iconImage: Assets.icons.about.svg(),
                    title: 'دربــــاره',
                  ),
                ]),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyBorderedButton(
                    title: 'ورود', icon: null, onTap: () {}, onHover: (b) {}),
                const SizedBox(
                  width: 16,
                ),
                MyPrimaryButton(
                    title: 'ثبت نام',
                    icon: null,
                    onTap: () {},
                    onHover: (b) {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class HeaderItem extends StatelessWidget {
  final iconImage;
  final activeIconImage;
  final title;
  final bool isActive;
  final Function() onTap;

  const HeaderItem(
      {super.key,
      required this.title,
      required this.iconImage,
      required this.onTap,
      required this.isActive,
      this.activeIconImage});
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  // iconImage,
                  // const SizedBox(
                  //   width: 8,
                  // ),
                  Text(title,
                      style: isActive
                          ? themeData.textTheme.bodyMedium!
                              .apply(color: themeData.colorScheme.primary)
                          : themeData.textTheme.bodyMedium),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              isActive
                  ? Container(
                      padding: EdgeInsets.only(top: 8),
                      width: 80,
                      height: 2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(borderRadiusOut),
                          gradient: LinearGradient(colors: [
                            themeData.colorScheme.secondary,
                            themeData.colorScheme.primary,
                          ]),
                          // color: themeData.colorScheme.primary,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 16,
                                color: themeData.colorScheme.primary
                                    .withAlpha(150))
                          ]),
                    )
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}

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
//     return InkWell(
//       onTap: onTap,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(borderRadiusOut),
//                 color: isActive ? themeData.primaryColor : Colors.transparent),
//             child: Row(
//               children: [
//                 isActive ? activeIconImage : iconImage,
//                 const SizedBox(
//                   width: 8,
//                 ),
//                 Text(
//                   title,
//                   style: isActive
//                       ? themeData.textTheme.bodySmall!
//                           .apply(color: Colors.white)
//                       : themeData.textTheme.bodySmall,
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  color: Colors.red,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  'ترنسلیتور',
                  style: themeData.textTheme.bodyMedium,
                ),
              ],
            ),
            Row(
              children: [
                MyTextButton(
                    title: 'خانه',
                    icon: Assets.icons.home.svg(),
                    onTap: () {},
                    onHover: (b) {}),
                MyTextButton(
                    title: 'ترجمه',
                    icon: Assets.icons.translate.svg(),
                    onTap: () {},
                    onHover: (b) {}),
                MyTextButton(
                    title: 'تعرفه ها',
                    icon: Assets.icons.pricing.svg(),
                    onTap: () {},
                    onHover: (b) {}),
                MyTextButton(
                    title: 'درباره ما',
                    icon: Assets.icons.about.svg(),
                    onTap: () {},
                    onHover: (b) {}),
              ],
            ),
            Row(
              children: [
                MyPrimaryButton(
                    title: 'ثبت نام',
                    icon: Assets.icons.home.svg(),
                    onTap: () {},
                    onHover: (b) {}),
                MyBorderedButton(
                    title: 'ورود',
                    icon: Assets.icons.home.svg(),
                    onTap: () {},
                    onHover: (b) {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
