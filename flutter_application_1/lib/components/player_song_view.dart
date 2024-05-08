import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utilities/color_utils.dart';

class PlaySongView extends StatelessWidget {
  const PlaySongView({super.key, Key? childKey});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          decoration: BoxDecoration(
            color: ColorUtils.appGrey,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SongImage(),
                      SizedBox(width: 16),
                      SongInfo(),
                      SizedBox(width: 16),
                      Expanded(
                        child: MusicControls(),
                      ),
                      SizedBox(width: 16)
                    ],
                  ),
                ],
              ),
        ));
  }
}

class SongImage extends StatelessWidget {
  const SongImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 129,
      height: 96,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/song_image.jpeg'), // Placeholder image
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class SongInfo extends StatelessWidget {
  const SongInfo({super.key, Key? childKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Song Title',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: ColorUtils.appWhite,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Artist Name',
          style: TextStyle(fontSize: 16, color: ColorUtils.appWhite),
        ),
      ],
    );
  }
}

class MusicControls extends StatelessWidget {
  const MusicControls({super.key, Key? childKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.skip_previous),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.fast_rewind),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.play_arrow),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.fast_forward),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.skip_next),
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('0.0'), // Start time mark
                  Text('2.20'), // End time mark
                ],
              ),
            ),
            LinearProgressIndicator(
              value: 0.6, // Example value, change as needed
            ),
          ],
        ),
      ],
    );
  }
}
