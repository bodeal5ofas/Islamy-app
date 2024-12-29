import 'package:flutter/material.dart';
import 'package:islamy/my_theme.dart';
import 'package:islamy/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class SettingChooseIteam extends StatelessWidget {
  const SettingChooseIteam({
    super.key,
    required this.title,
    required this.choose1,
    required this.choose2,
    this.onTap1,
    this.onTap2,
    required this.value1,
    required this.value2,
  });
  final String title;
  final String choose1, choose2;
  final void Function()? onTap1;
  final void Function()? onTap2;
  final String value1, value2;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return GestureDetector(
      onTap: () => showModalBottomSheet(
        backgroundColor: provider.appTheme == ThemeMode.dark
            ? MyTheme.primaryDark
            : MyTheme.whiteColor,
        context: context,
        builder: (context) => Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: onTap1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      choose1,
                      style: (provider.appLanguage == value1)
                          ? Theme.of(context).textTheme.titleMedium
                          : Theme.of(context).textTheme.titleLarge,
                    ),
                    provider.appLanguage == value1
                        ? Icon(Icons.check,
                            color: Theme.of(context).primaryColor)
                        : const Text(''),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: onTap2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      choose2,
                      style: provider.appLanguage == value2
                          ? Theme.of(context).textTheme.titleMedium
                          : Theme.of(context).textTheme.titleLarge,
                    ),
                    provider.appLanguage == value2
                        ? Icon(Icons.check,
                            color: Theme.of(context).primaryColor)
                        : const Text(''),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
