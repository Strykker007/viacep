import 'package:cep_aberto_app/app/modules/home/ui/desktop_web/home_desktop_page.dart';
import 'package:cep_aberto_app/app/modules/home/ui/mobile/home_mobile_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, this.title = 'Home'});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.isDesktop) {
          return const HomeDesktopPage();
        }
        if (sizingInformation.isMobile) {
          return const HomeMobilePage();
        }
        return const HomeDesktopPage();
      },
    );
  }
}
