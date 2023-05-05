import 'dart:ui';

const yourLibrary = [
  'Made for you',
  'Recently played',
  'Liked songs',
  'Albums',
  'Artists',
  'Podcasts',
];

const playlists = [
  'Today\'s Top Hits',
  'Rock Classics',
  'Workout',
  'Chill',
  'RapCaviar',
  'Mood Booster',
  'New Music Friday',
  'Indie',
  'Pop',
  'R&B',
  'Hip-Hop',
  'Latin',
  'Country',
  'Rock',
  'Dance',
  'Electronic',
  'Focus',
  'Decades',
  'Throwbacks',
  'Mood',
  'Happy',
  'Sad',
  'Chill',
];

class Song {
  final String id;
  final String title;
  final String imageURL;
  final String artist;
  final String album;
  final String duration;

  const Song({
    required this.id,
    required this.title,
    required this.imageURL,
    required this.artist,
    required this.album,
    required this.duration,
  });
}

List<Song> exx = [];

const lofihiphopMusic = [
  Song(
    id: '0',
    title: 'Snowman',
    imageURL: "sss",
    artist: 'WYS',
    album: '1 Am. Study Session',
    duration: '3:15',
  ),
  Song(
    id: '1',
    title: 'Healthy Distraction',
    imageURL: "sss",
    artist: 'less.people',
    album: 'One Day It\'s Over',
    duration: '2:18',
  ),
  Song(
    id: '2',
    title: 'Far Away',
    imageURL: "sss",
    artist: 'Mila Coolness',
    album: 'Silent River',
    duration: '2:39',
  ),
  Song(
    id: '3',
    title: 'Call You Soon',
    imageURL: "sss",
    artist: 'Louk, Glimlip',
    album: 'Can We Talk',
    duration: '2:35',
  ),
  Song(
    id: '4',
    title: 'Winter Sun',
    imageURL: "sss",
    artist: 'Bcalm, Banks',
    album: 'Feelings',
    duration: '2:15',
  ),
  Song(
    id: '5',
    title: 'Hope',
    imageURL: "sss",
    artist: 'No Spirit',
    album: 'Memories We Made',
    duration: '1:57',
  ),
  Song(
    id: '6',
    title: 'A Better Place',
    imageURL: "sss",
    artist: 'Project AER, cxit.',
    album: 'Growth Patterns',
    duration: '2:00',
  ),
  Song(
    id: '7',
    title: 'Misty Dawn',
    imageURL: "sss",
    artist: 'BluntOne',
    album: 'Autumn in Budapest',
    duration: '2:34',
  ),
  Song(
    id: '8',
    title: 'Hourglass',
    imageURL: "sss",
    artist: 'Thaehan',
    album: 'Hourglass',
    duration: '1:43',
  ),
  Song(
    id: '9',
    title: 'After Sunset',
    imageURL: "sss",
    artist: 'Project AER, WYS',
    album: '3 Am. Study Session',
    duration: '2:41',
  ),
  Song(
    id: '10',
    title: 'Child',
    imageURL: "sss",
    artist: 'Ambulo',
    album: 'Polar',
    duration: '2:12',
  ),
  Song(
    id: '11',
    title: 'Arizona Zero',
    imageURL: "sss",
    artist: 'WYS, Sweet Medicine',
    album: 'Evermore',
    duration: '2:31',
  )
];

class Playlist {
  final String name;
  final String imageURL;
  final List<Song> songs;

  const Playlist({
    required this.name,
    required this.imageURL,
    required this.songs,
  });
}

const lofihiphopPlaylist = Playlist(
  name: 'lofi hip hop music - beats to relax/study to',
  imageURL: 'assets/icons/lofi.png',
  songs: lofihiphopMusic,
);

const List songs = [
  {
    "img": "assets/images/img_3.jpg",
    "artist": "Ariana Grande",
    "title": "Feelin' Good",
    "description": "Feel good with this positively timeless playlist!",
    "duration": "3:21",
    "song_count": "100 songs",
    "date": "about 19 hr",
    "color": Color(0xFFf69129),
    "song_url": "songs/1.mp3",
    "songs": [
      {"title": "Imagination", "duration": "1:21"},
      {"title": "Home_", "duration": "2:17"},
      {"title": "Do I Wanna Know?", "duration": "1:31"},
      {"title": "Whiskey Sour", "duration": "1:42"},
      {"title": "Decisions", "duration": "1:29"},
      {"title": "Trees", "duration": "1:51"},
      {"title": "Earth", "duration": "1:39"},
    ]
  }
];
