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
  final String id;
  final String name;
  final String imageURL;
  final String description;
  final String creator;
  final String duration;
  final String followers;
  final List<Song> songs;

  const Playlist({
    required this.id,
    required this.name,
    required this.imageURL,
    required this.description,
    required this.creator,
    required this.duration,
    required this.followers,
    required this.songs,
  });
}

const lofihiphopPlaylist = Playlist(
  id: '5-playlist',
  name: 'lofi hip hop music - beats to relax/study to',
  imageURL: 'assets/icons/lofi.png',
  description:
  'A daily selection of chill beats - perfect to help you relax & study 📚',
  creator: 'Lofi Girl',
  duration: '28 min',
  followers: '5,351,685',
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
  },
  {
    "img": "assets/images/img_5.jpg",
    "artist": "Charlie Puth",
    "title": "Peaceful Piano",
    "description": "Relax and indulge with beautiful piano pieces",
    "duration": "3:00",
    "song_count": "324 songs",
    "date": "about 14 hr",
    "color": Color(0xFF64849c),
    "song_url": "songs/2.mp3",
    "songs": [
      {"title": "Kaleidoscope", "duration": "2:01"},
      {"title": "Larks", "duration": "2:54"},
      {"title": "Homeland", "duration": "2:22"},
      {"title": "Une Danse", "duration": "3:03"},
      {"title": "Almonte", "duration": "2:31"},
      {"title": "Days Like These", "duration": "4:09"},
      {"title": "In questo momento", "duration": "2:40"},
    ]
  },
  {
    "img": "assets/images/img_7.jpg",
    "artist": "Artista 3",
    "title": "Deep Focus",
    "description": "Keep calm and focus with ambient and post-rock music.",
    "duration": "4:03",
    "song_count": "195 songs",
    "date": "about 10 hr",
    "color": Color(0xFF58546c),
    "song_url": "songs/1.mp3",
    "songs": [
      {"title": "Escaping Time", "duration": "3:20"},
      {"title": "Just Look at You", "duration": "3:07"},
      {"title": "Flowing", "duration": "2:11"},
      {"title": "With Resolve", "duration": "2:09"},
      {"title": "Infinite Sustain", "duration": "2:29"},
      {"title": "Ingénue", "duration": "2:38"},
      {"title": "Hidden Chambers", "duration": "2:49"},
    ]
  },
  {
    "img": "assets/images/img_4.jpg",
    "artist": "Artista 4",
    "title": "Lo-Fi Beats",
    "description": "Beats to relax, study and focus.",
    "duration": "3:46",
    "song_count": "599 songs",
    "date": "about 21 hr",
    "color": Color(0xFFbad6ec),
    "song_url": "songs/2.mp3",
    "songs": [
      {"title": "Imagination", "duration": "1:21"},
      {"title": "Home_", "duration": "2:17"},
      {"title": "Do I Wanna Know?", "duration": "1:31"},
      {"title": "Whiskey Sour", "duration": "1:42"},
      {"title": "Decisions", "duration": "1:29"},
      {"title": "Trees", "duration": "1:51"},
      {"title": "Earth", "duration": "1:39"},
    ]
  },
  {
    "img": "assets/images/img_2.jpg",
    "artist": "Artista 5",
    "title": "Chill Lofi Study Beats",
    "description": "The perfect study beats, twenty four seven.",
    "duration": "3:57",
    "song_count": "317 songs",
    "date": "about 11 hr",
    "color": Color(0xFF93689a),
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
  },
  {
    "img": "assets/images/img_6.jpg",
    "artist": "Artista 6",
    "title": "Chill Hits",
    "description": "Kick back to the best new and recent chill tunes.",
    "song_count": "130 songs",
    "date": "about 7 hr",
    "color": Color(0xFFa4c4d3),
    "song_url": "songs/2.mp3",
    "songs": [
      {"title": "Imagination", "duration": "1:21"},
      {"title": "Home_", "duration": "2:17"},
      {"title": "Do I Wanna Know?", "duration": "1:31"},
      {"title": "Whiskey Sour", "duration": "1:42"},
      {"title": "Decisions", "duration": "1:29"},
      {"title": "Trees", "duration": "1:51"},
      {"title": "Earth", "duration": "1:39"},
    ]
  },
  {
    "img": "assets/images/img_1.jpg",
    "artist": "Artista 7",
    "title": "Dark & Stormy",
    "description": "Beautifully dark, dramatic tracks.",
    "song_count": "50 songs",
    "date": "about 17 hr",
    "color": Color(0xFF5e4f78),
    "song_url": "songs/1.mp3",
    "songs": [
      {"title": "Kaleidoscope", "duration": "2:01"},
      {"title": "Larks", "duration": "2:54"},
      {"title": "Homeland", "duration": "2:22"},
      {"title": "Une Danse", "duration": "3:03"},
      {"title": "Almonte", "duration": "2:31"},
      {"title": "Days Like These", "duration": "4:09"},
      {"title": "In questo momento", "duration": "2:40"},
    ]
  },
  {
    "img": "assets/images/img_8.jpg",
    "artist": "Artista 8",
    "title": "Feel Good Piano",
    "description": "Positive piano music",
    "song_count": "69 songs",
    "date": "2 hr 14 min",
    "color": Color(0xFFa4c1ad),
    "song_url": "songs/2.mp3",
    "songs": [
      {"title": "Escaping Time", "duration": "3:20"},
      {"title": "Just Look at You", "duration": "3:07"},
      {"title": "Flowing", "duration": "2:11"},
      {"title": "With Resolve", "duration": "2:09"},
      {"title": "Infinite Sustain", "duration": "2:29"},
      {"title": "Ingénue", "duration": "2:38"},
      {"title": "Hidden Chambers", "duration": "2:49"},
    ]
  },
  {
    "img": "assets/images/img_9.jpg",
    "artist": "Artista 9",
    "title": "Sad Songs",
    "description": "Beautiful songs to break your heart...",
    "song_count": "60 songs",
    "date": "3 hr 25 min",
    "color": Color(0xFFd9e3ec),
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
  },
  {
    "img": "assets/images/img_10.jpg",
    "artist": "Artista 10",
    "title": "Mood Booster",
    "description": "Get happy with today's dose of feel-good songs",
    "song_count": "75 songs",
    "date": "3 hr 56 min",
    "color": Color(0xFF4e6171),
    "song_url": "songs/2.mp3",
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

class Playlists {
  final String name;
  final String imageURL;
  final String artist;

  const Playlists({
    required this.name,
    required this.imageURL,
    required this.artist,
  });
}

List playlist = [
  {
    'name': 'playlist',
    'imageURL':
    'https://firebasestorage.googleapis.com/v0/b/dyzr-proyect.appspot.com/o/haojie20011116%40gmail.com%2Fplaylist1.jpg?alt=media&token=2d528494-816f-4e90-9eb0-b30e2bc2aed4',
    'artist': 'aa',
  },
  {
    'name': 'playlist',
    'imageURL':
    'https://firebasestorage.googleapis.com/v0/b/dyzr-proyect.appspot.com/o/haojie20011116%40gmail.com%2Fplaylist1.jpg?alt=media&token=2d528494-816f-4e90-9eb0-b30e2bc2aed4',
    'artist': 'aa',
  },
  {
    'name': 'playlist',
    'imageURL':
    'https://firebasestorage.googleapis.com/v0/b/dyzr-proyect.appspot.com/o/haojie20011116%40gmail.com%2Fplaylist1.jpg?alt=media&token=2d528494-816f-4e90-9eb0-b30e2bc2aed4',
    'artist': 'aa',
  },
  {
    'name': 'playlist',
    'imageURL':
    'https://firebasestorage.googleapis.com/v0/b/dyzr-proyect.appspot.com/o/haojie20011116%40gmail.com%2Fplaylist1.jpg?alt=media&token=2d528494-816f-4e90-9eb0-b30e2bc2aed4',
    'artist': 'aa',
  },
  {
    'name': 'playlist',
    'imageURL':
    'https://firebasestorage.googleapis.com/v0/b/dyzr-proyect.appspot.com/o/haojie20011116%40gmail.com%2Fplaylist1.jpg?alt=media&token=2d528494-816f-4e90-9eb0-b30e2bc2aed4',
    'artist': 'aa',
  },
];