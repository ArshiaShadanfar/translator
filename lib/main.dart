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
                    Get.off(() => const LoginView());
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

