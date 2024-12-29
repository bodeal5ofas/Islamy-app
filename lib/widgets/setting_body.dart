import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/providers/app_config_provider.dart';
import 'package:islamy/widgets/setting_chose_iteam.dart';
import 'package:provider/provider.dart';

class SettingBody extends StatelessWidget {
  const SettingBody({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 25,
          ),
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          SettingChooseIteam(
            value1: 'en',
            value2: 'ar',
            choose1: AppLocalizations.of(context)!.english,
            choose2: AppLocalizations.of(context)!.arabic,
            title: provider.appLanguage == 'en'
                ? AppLocalizations.of(context)!.english
                : AppLocalizations.of(context)!.arabic,
            onTap1: () {
              provider.changeLanguage('en');
              Navigator.pop(context);
            },
            onTap2: () {
              provider.changeLanguage('ar');
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          SettingChooseIteam(
            value1: 'light',
            value2: 'dark',
            choose1: AppLocalizations.of(context)!.light,
            choose2: AppLocalizations.of(context)!.dark,
            title: provider.appTheme == ThemeMode.dark
                ? AppLocalizations.of(context)!.dark
                : AppLocalizations.of(context)!.light,
            onTap1: () {
              provider.changeTheme('light');
              Navigator.pop(context);
            },
            onTap2: () {
              provider.changeTheme('dark');
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
