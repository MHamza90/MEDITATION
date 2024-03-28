// import 'package:audioplayers/audioplayers.dart';
// import 'package:get/get.dart';

// class AudioPlayerService extends GetxController{
//   AudioPlayer _audioPlayer = AudioPlayer();
//   List<String> playlist = [
//     // Add your audio file URLs here
//     'assets/audio/Kalimba.mp3',
//     'assets/audio/testing.mp3',
//     // Add more audio files if needed
//   ];
//   int currentIndex = 0;
//   final player = AudioPlayer();

//   Future<void> play() async {
//     await player.play(UrlSource(playlist[currentIndex]));
//   }

//   Future<void> pause() async {
//     await _audioPlayer.pause();
//   }

//   Future<void> next() async {
//     if (currentIndex < playlist.length - 1) {
//       currentIndex++;
//     } else {
//       currentIndex = 0;
//     }
//     await play();
//   }

//   void seek(double seconds) {
//     _audioPlayer.seek(Duration(seconds: seconds.toInt()));
//   }

//   AudioPlayer get audioPlayer => _audioPlayer;
// }
