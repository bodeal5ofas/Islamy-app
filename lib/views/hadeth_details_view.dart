import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:islamy/my_theme.dart';
import 'package:islamy/providers/app_config_provider.dart';
import 'package:islamy/widgets/custom_back_ground.dart';
import 'package:islamy/widgets/hadeth_body.dart';
import 'package:provider/provider.dart';
//import 'package:islamy/widgets/quran_body.dart';

class HadethDetailsView extends StatefulWidget {
  const HadethDetailsView({super.key});
  static String id = 'Hadeth Screen';

  @override
  State<HadethDetailsView> createState() => _HadethDetailsViewState();
}

class _HadethDetailsViewState extends State<HadethDetailsView> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    AhadethModel ahadethModel =
        ModalRoute.of(context)?.settings.arguments as AhadethModel;
    return Stack(
      children: [
        const CustomBackGround(),
        Scaffold(
          appBar: AppBar(
            title: Text(
              ahadethModel.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .05,
              vertical: MediaQuery.of(context).size.height * .05,
            ),
            decoration: BoxDecoration(
                color: MyTheme.whiteColor,
                borderRadius: BorderRadius.circular(24)),
            child: ListView.builder(
              // separatorBuilder: (context, index) => Divider(
              //   color: Theme.of(context).primaryColor,
              //   thickness: 2,
              // ),
              itemCount: ahadethModel.content.length,
              itemBuilder: (context, index) => Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    ahadethModel.content[index],
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
}
