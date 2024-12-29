import 'package:flutter/material.dart';
import 'package:islamy/providers/app_config_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SebhaBody extends StatefulWidget {
  const SebhaBody({super.key});

  @override
  State<SebhaBody> createState() => _SebhaBodyState();
}

class _SebhaBodyState extends State<SebhaBody> {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Center(
      child: Column(
        children: [
          provider.appTheme == ThemeMode.light
              ? Image.asset(
                  height: 80,
                  'assets/images/head_sebha_logo.png',
                )
              : Image.asset(
                  'assets/images/head_sebha_dark.png',
                  height: 80,
                ),
          provider.appTheme == ThemeMode.light
              ? Image.asset(
                  'assets/images/body_sebha_logo.png',
                  height: 150,
                )
              : Image.asset(
                  'assets/images/body_sebha_dark.png',
                  height: 150,
                ),
          const SizedBox(
            height: 20,
          ),
          Text(
            AppLocalizations.of(context)!.number,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomContainer(
            number: number.toString(),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomContainer(
            number: AppLocalizations.of(context)!.tasbeh,
            onTap: () {
              number++;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.number,
    this.onTap,
  });

  final String number;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 80,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(
          child: Text(
            number.toString(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
