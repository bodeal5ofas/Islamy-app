import 'package:flutter/material.dart';
//import 'package:islamy/views/home_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomBottomNavigationIteam extends StatelessWidget {
  const CustomBottomNavigationIteam({
    super.key,
    this.onTap,
    required this.currentIndex,
  });
  final Function(int)? onTap;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Theme.of(context).primaryColor,
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
            //backgroundColor: Colors.brown,
            icon: const ImageIcon(
              AssetImage(
                'assets/images/icon_quran.png',
              ),
            ),
            label: AppLocalizations.of(context)!.quran,
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(
              AssetImage(
                'assets/images/icon_hadeth.png',
              ),
            ),
            label: AppLocalizations.of(context)!.hadeth,
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(
              AssetImage(
                'assets/images/icon_sebha.png',
              ),
            ),
            label: AppLocalizations.of(context)!.sebha,
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(
              AssetImage(
                'assets/images/icon_radio.png',
              ),
            ),
            label: AppLocalizations.of(context)!.radio,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: AppLocalizations.of(context)!.setting,
          ),
        ],
      ),
    );
  }
}
