import 'package:flutter/material.dart';
import 'package:islamy/widgets/custom_back_ground.dart';
import 'package:islamy/widgets/custom_bottom_navigation_iteam.dart';
import 'package:islamy/widgets/hadeth_body.dart';
import 'package:islamy/widgets/quran_body.dart';
import 'package:islamy/widgets/radio_body.dart';
import 'package:islamy/widgets/sebha_body.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/widgets/setting_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static String id = 'Home view';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int index = 0;
  List<Widget> bodyContents = const [
    QuranBody(),
    HadethBody(),
    SebhaBody(),
    RadioBody(),
    SettingBody(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomBackGround(),
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.app_tittle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: bodyContents[index],
          bottomNavigationBar: CustomBottomNavigationIteam(
            currentIndex: index,
            onTap: (value) {
              index = value;
              setState(() {});
            },
          ),
        ),
      ],
    );
  }
}
