import 'package:flutter/material.dart';
import 'package:player/components/neu_box.dart';
import 'package:player/model/playlist_provier.dart';
import 'package:provider/provider.dart';

class SongScreen extends StatelessWidget {
  const SongScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) {
        //get the playlist provider
        final playlist = value.playlist;
        // Get the current song index from the provider
        final currentSong = playlist[value.currentSongIndex ?? 0];
        // return UI
        return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, top: 16.0, bottom: 32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //appbar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(Icons.arrow_back,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary)),
                        const Text("A U D I O"),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.menu,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary)),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    //album art
                    NeuBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              currentSong.imagePath,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      currentSong.songName,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Text(currentSong.artistName,
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .inversePrimary
                                                .withOpacity(0.5))),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    //song name
                    const SizedBox(
                      height: 16,
                    ),

                    //song duration
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${value.currentDuration.inMinutes}:${value.currentDuration.inSeconds % 60}",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary
                                        .withOpacity(0.5)),
                              ),
                              Icon(Icons.shuffle,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary),
                              Icon(Icons.repeat,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary),
                              Text(
                                "${value.totalDuration.inMinutes}:${value.totalDuration.inSeconds % 60}",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary
                                        .withOpacity(0.5)),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 3,
                              ),
                            ),
                            child: Slider(
                              min: 0,
                              max: value.totalDuration.inSeconds.toDouble(),
                              value: value.currentDuration.inSeconds.toDouble(),
                              onChanged: (double double) {
                                //when the user drags the slider
                              },
                              onChangeEnd: (double double) {
                                //when the user stops dragging the slider
                                value.seek(Duration(seconds: double.toInt()));
                              },
                              activeColor: Colors.blue,
                              inactiveColor:
                                  Colors.blue.withOpacity(0.3).withOpacity(0.3),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //playback controls
                    Row(
                      children: [
                        Expanded(
                            child: GestureDetector(
                          onTap: value.playPreviousSong,
                          child: const NeuBox(
                            child: Icon(Icons.skip_previous,
                                size: 32, color: Colors.blue),
                          ),
                        )),
                        const SizedBox(
                          width: 32,
                        ),
                        Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: value.pauseResume,
                              child: NeuBox(
                                child: Icon(
                                    value.isPlaying
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                    size: 32,
                                    color: Colors.blue),
                              ),
                            )),
                        const SizedBox(
                          width: 32,
                        ),
                        Expanded(
                            child: GestureDetector(
                          onTap: value.playNextSong,
                          child: const NeuBox(
                            child: Icon(Icons.skip_next,
                                size: 32, color: Colors.blue),
                          ),
                        )),
                      ],
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}
