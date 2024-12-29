import 'package:flutter/material.dart';
import 'package:islamy/my_theme.dart';
import 'package:islamy/providers/app_config_provider.dart';
import 'package:islamy/views/sura_details_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class QuranBody extends StatelessWidget {
  const QuranBody({super.key});
  final List<String> titles = const [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
  ];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Image.asset('assets/images/qur2an_screen_logo.png'),
          const SizedBox(
            height: 20,
          ),
          Divider(
            color: provider.appTheme == ThemeMode.light
                ? Theme.of(context).primaryColor
                : MyTheme.yellowColor,
            thickness: 3,
          ),
          Text(
            AppLocalizations.of(context)!.sura_name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Divider(
            color: provider.appTheme == ThemeMode.light
                ? Theme.of(context).primaryColor
                : MyTheme.yellowColor,
            thickness: 3,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            SuraDetailsView.id,
                            arguments:
                                SuraModel(title: titles[index], index: index),
                          );
                        },
                        child: Text(
                          titles[index],
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => Divider(
                      color: provider.appTheme == ThemeMode.light
                          ? Theme.of(context).primaryColor
                          : MyTheme.yellowColor,
                      thickness: 3,
                    ),
                itemCount: titles.length),
          )
        ],
      ),
    );
  }
}

class SuraModel {
  final String title;
  final int index;

  SuraModel({required this.title, required this.index});
}
