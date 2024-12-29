//import 'package:assets_audio_player/assets_audio_player.dart';

import 'package:audioplayers/audioplayers.dart';

class Sounds {
// ...
  static String recentPath = '';
  
  static AudioPlayer player = AudioPlayer();
  static void play(String path) {
    player.play(AssetSource(path));
    recentPath = path;
  }
  // static AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  // static void play() async {
  //   assetsAudioPlayer.pause();
  //   initSound();
  //   await assetsAudioPlayer.playlistPlayAtIndex(1);
  // }

  // static void initSound() async {
  //   assetsAudioPlayer.open(
  //     Playlist(audios: [
  //       Audio("assets/sounds/one.mp3"),
  //       Audio("assets/sounds/two.mp3"),
  //       Audio("assets/sounds/three.mp3"),
  //       Audio("assets/sounds/four.mp3"),
  //     ]),
  //     //loopMode: LoopMode.playlist //loop the full playlist
  //   );
  // }

  // static void next() async {
  //   assetsAudioPlayer.pause();
  //   initSound();
  //   await assetsAudioPlayer.next();
  // }

  // static void previous() async {
  //   assetsAudioPlayer.pause();
  //   initSound();
  //   await assetsAudioPlayer.previous();
  // }
}
