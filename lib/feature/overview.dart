import 'package:beraca_plus_optique/feature/home/presentatioln/page/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          title: "Église Vivante",
          debugShowCheckedModeBanner: false,
          // navigatorKey: navigatorKey,
          theme: ThemeData.light().copyWith(
            primaryColor: Colors.black,
            textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
            extensions: <ThemeExtension<dynamic>>[],
          ),
          home: const HomePage(),
        );
      },
    );
  }
}
