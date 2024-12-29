import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/my_theme.dart';
import 'package:islamy/providers/app_config_provider.dart';
import 'package:islamy/widgets/custom_back_ground.dart';
import 'package:islamy/widgets/quran_body.dart';
import 'package:provider/provider.dart';

class SuraDetailsView extends StatefulWidget {
  const SuraDetailsView({super.key});
  static String id = 'sura Screen';

  @override
  State<SuraDetailsView> createState() => _SuraDetailsViewState();
}

class _SuraDetailsViewState extends State<SuraDetailsView> {
  @override
  List<String> verses = [];
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    SuraModel suraModel =
        ModalRoute.of(context)?.settings.arguments as SuraModel;
    loadFiles(suraModel.index);
    return Stack(
      children: [
        CustomBackGround(),
        Scaffold(
          appBar: AppBar(
            title: Text(
              suraModel.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: verses.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .05,
                    vertical: MediaQuery.of(context).size.height * .05,
                  ),
                  decoration: BoxDecoration(
                      color: MyTheme.whiteColor,
                      borderRadius: BorderRadius.circular(24)),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      color: Theme.of(context).primaryColor,
                      thickness: 2,
                    ),
                    itemCount: verses.length,
                    itemBuilder: (context, index) => Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          '${verses[index]} ($index)',
                          style: provider.appTheme == ThemeMode.light
                              ? Theme.of(context).textTheme.titleLarge
                              : Theme.of(context).textTheme.titleMedium,
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }

  void loadFiles(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    verses = lines;
    setState(() {});
  }
}
