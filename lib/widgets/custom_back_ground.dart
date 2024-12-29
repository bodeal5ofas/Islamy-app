import 'package:flutter/material.dart';
import 'package:islamy/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class CustomBackGround extends StatelessWidget {
  const CustomBackGround({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Image.asset(
      provider.appTheme == ThemeMode.light
          ? 'assets/images/background_master.png'
          : 'assets/images/dark_bg.png',
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.fill,
    );
  }
}
