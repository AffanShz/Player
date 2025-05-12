import 'package:flutter/material.dart';
import 'package:player/components/drawer.dart';
import 'package:player/components/navbar.dart';
import 'package:player/model/playlist_provier.dart';
import 'package:player/model/song.dart';
import 'package:provider/provider.dart';
import 'package:player/pages/song_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final dynamic playlistprovidewr;

  @override
  void initState() {
    super.initState();
    playlistprovidewr = Provider.of<PlaylistProvider>(context, listen: false);
  }

  void goToSong(int songindex) {
    playlistprovidewr.currentSongIndex = songindex;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SongScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Playlist'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      bottomNavigationBar: NavBar(
        onItemTapped: (index) {
          // Handle navigation item tap
        },
        selectedIndex: 0, // Set the selected index based on your logic
      ),
      drawer: const MyDrawer(),
      body: Consumer<PlaylistProvider>(builder: (contxt, value, child) {
        final List<Song> playlist = value.playlist;

        return ListView.builder(
          itemCount: playlist.length,
          itemBuilder: (context, index) {
            final Song song = playlist[index];

            return ListTile(
              title: Text(
                song.songName,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: Text(
                song.artistName,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              leading: SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(song.imagePath),
              ),
              onTap: () => goToSong(index),
            );
          },
        );
      }),
    );
  }
}
