import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/views/hadeth_details_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadethBody extends StatefulWidget {
  const HadethBody({super.key});

  @override
  State<HadethBody> createState() => _HadethBodyState();
}

class _HadethBodyState extends State<HadethBody> {
  List<AhadethModel> ahadethList = [];
  @override
  Widget build(BuildContext context) {
    if (ahadethList.isEmpty) {
      loadHadethFile(ahadethList);
    }
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Image.asset('assets/images/hadeth_logo.png'),
          // const SizedBox(
          //   height: 0,
          // ),
          Divider(
            color: Theme.of(context).primaryColor,
            thickness: 3,
          ),
          Text(
            AppLocalizations.of(context)!.hadeth_name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Divider(
            color: Theme.of(context).primaryColor,
            thickness: 3,
          ),
          ahadethList.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      color: Theme.of(context).primaryColor,
                      thickness: 2,
                    ),
                    itemBuilder: (context, index) => Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            HadethDetailsView.id,
                            arguments: ahadethList[index],
                          );
                        },
                        child: Text(
                          ahadethList[index].title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ),
                    itemCount: ahadethList.length,
                  ),
                )
        ],
      ),
    );
  }

  void loadHadethFile(List<AhadethModel> ahadethList) async {
    String ahadeth = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> ahadethAyat = ahadeth.split('#\r\n');
    for (int i = 0; i < ahadethAyat.length; i++) {
      List<String> ahadethLines = ahadethAyat[i].split('\n');
      String title = ahadethLines[0];
      ahadethLines.removeAt(0);
      ahadethList.add(
        AhadethModel(title: title, content: ahadethLines),
      );
    }
    setState(() {});
  }
}

class AhadethModel {
  final String title;
  final List<String> content;

  AhadethModel({required this.title, required this.content});
}
