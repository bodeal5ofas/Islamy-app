import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:islamy/helper.dart';

class RadioBody extends StatefulWidget {
  const RadioBody({super.key});

  @override
  State<RadioBody> createState() => _RadioBodyState();
}

class _RadioBodyState extends State<RadioBody> {
  bool play = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Image.asset(
            'assets/images/radio_image.png',
            height: 200,
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            AppLocalizations.of(context)!.radio,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  //           Sounds.previous();
                  if (Sounds.recentPath != '') {
                    Sounds.player.stop();
                  }
                  Sounds.play('sounds/two.mp3');
                },
                icon: Icon(
                  Icons.skip_previous_sharp,
                  size: 50,
                  color: Theme.of(context).textTheme.titleMedium!.color,
                ),
              ),
              IconButton(
                onPressed: () {
                  // Sounds.play();
                  if (Sounds.recentPath != '') {
                    Sounds.player.stop();
                  }
                  Sounds.play('sounds/three.mp3');
                },
                icon: Icon(
                  Icons.play_arrow,
                  size: 50,
                  color: Theme.of(context).textTheme.titleMedium!.color,
                ),
              ),
              IconButton(
                onPressed: () {
                  //             Sounds.next();
                  if (Sounds.recentPath != '') {
                    Sounds.player.stop();
                  }
                  Sounds.play('sounds/four.mp3');
                },
                icon: Icon(
                  Icons.skip_next,
                  size: 50,
                  color: Theme.of(context).textTheme.titleMedium!.color,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
