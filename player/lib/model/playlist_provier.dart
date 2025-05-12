import 'package:flutter/material.dart';
import 'package:player/model/song.dart';
import 'package:audioplayers/audioplayers.dart';

class PlaylistProvider with ChangeNotifier {
  final List<Song> _playlist = [
    Song(
        songName: "HeavenKnowImMiserableNow",
        artistName: "The Smiths",
        imagePath: "assets/image/TheSmiths-HeavenKnowImMiserableNow.jpg",
        audioPath: "audio/TheSmiths-HeavenKnowImMiserableNow.mp3"),
    Song(
        songName: "ThereIsALightThatNeverGoesOut",
        artistName: "The Smiths",
        imagePath: "assets/image/TheSmiths-ThereIsALightThatNeverGoesOut.jpg",
        audioPath: "audio/TheSmiths-ThereIsALightThatNeverGoesOut.mp3"),
  ];

  int? _currentSongIndex;

  //audio player

  final AudioPlayer _audioPlayer = AudioPlayer();

  //duration
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  //constructor

  PlaylistProvider() {
    listenduration();
  }

  //initially not playing
  bool _isPlaying = false;

  //playthe song

  void play() async {
    final String path = _playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
    _isPlaying = true;
    notifyListeners();
  }

  //pause the song

  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  //resume the song
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  //pause the resume

  void pauseResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  //seek to a specific position of the song

  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  //play next song

  void playNextSong() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length - 1) {
        _currentSongIndex = _currentSongIndex! + 1;
        play();
      } else {
        _currentSongIndex = 0;
        play();
      }
    }
  }

  //play previous song

  void playPreviousSong() async {
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero);
    } else {
      if (_currentSongIndex != null) {
        if (_currentSongIndex! > 0) {
          _currentSongIndex = _currentSongIndex! - 1;
        } else {
          _currentSongIndex = _playlist.length - 1;
        }
      }
    }
  }

  //listen to duration
  void listenduration() {
    _audioPlayer.onDurationChanged.listen((newduration) {
      _totalDuration = newduration;
      notifyListeners();
    });

    _audioPlayer.onPositionChanged.listen((newposition) {
      _currentDuration = newposition;
      notifyListeners();
    });

    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }

  //dispose the player

  //Getters
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;

  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  //Setters
  set currentSongIndex(int? newindex) {
    _currentSongIndex = newindex;

    if (newindex != null) {
      play();
    }
    notifyListeners();
  }
}
