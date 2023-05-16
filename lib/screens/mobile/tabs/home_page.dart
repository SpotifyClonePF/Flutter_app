import 'dart:ui';

import 'package:Sound2U/models/data.dart';
import 'package:Sound2U/styles/colors.dart';
import 'package:Sound2U/utils/MyAppBar.dart';
import 'package:flutter/material.dart';
import 'package:Sound2U/services/firebase_service.dart' as firebaseservice;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool _showIcons = true;

  Future<void> showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(0),
          backgroundColor: MyColors.darkGray,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.normal),
            child: ListBody(
              children: <Widget>[
                /// Information text
                const Center(
                  child: Text(
                    'Information',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                /// Logo
                const Image(
                  image: AssetImage('assets/icons/logo_no_fondo.png'),
                  width: 110,
                  height: 110,
                ),
                /// Version
                Center(
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(text: 'Version '),
                        TextSpan(
                          text: '1.0.0',
                          style: TextStyle(
                            color: MyColors.mainGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                /// Terms and Conditions
                const SizedBox(height: 40),
                const Center(
                  child: Text(
                    'Terms and Conditions',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                /// Privacy Policy
                const Center(
                  child: Text(
                    'Privacy Policy',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _dialogFuture() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: MyColors.darkGray,
          title: const Text('Coming soon', style: TextStyle(color: Colors.white),),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This feature is coming soon.', style: TextStyle(color: Colors.white),),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> optionSongs() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: AlertDialog(
            insetPadding: const EdgeInsets.all(0),
            backgroundColor: MyColors.darkGray.withOpacity(0.9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  decelerationRate: ScrollDecelerationRate.normal),
              child: ListBody(
                children: <Widget>[
                  Stack(
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                          image: DecorationImage(
                            image: AssetImage('assets/images/img_1.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 40,
                        right: 25,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ),
                          child: const Text(
                            'Battle Cry',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 5,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ),
                          child: const Text(
                            'IMAGINE DRAGONS',
                            style: TextStyle(
                              color: MyColors.mainGreen,
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  /// Songs Name
                  const SizedBox(height: 30),

                  /// Add to playlist
                  InkWell(
                    onTap: () {
                      addSongToPlaylist();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.add, color: Colors.white, size: 30),
                        SizedBox(width: 5),
                        Text(
                          'Add to playlist',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),

                  /// Add to liked songs
                  InkWell(
                    onTap: () {
/*Navigator.push(
context,

MaterialPageRoute(
builder: (context) => const ProfileMobile(),
),
);*/
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.favorite_border,
                            color: Colors.white, size: 25),
                        SizedBox(width: 5),
                        Text(
                          'Add to liked songs',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  /// View album
                  InkWell(
                    onTap: () {
/*Navigator.push(
context,

MaterialPageRoute(
builder: (context) => const ProfileMobile(),
),
);*/
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.library_music_rounded,
                            color: Colors.white, size: 25),
                        SizedBox(width: 5),
                        Text(
                          'View album',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),

                  /// View album
                  InkWell(
                    onTap: () {
/*Navigator.push(
context,

MaterialPageRoute(
builder: (context) => const ProfileMobile(),
),
);*/
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.cloud_download_sharp,
                            color: Colors.white, size: 25),
                        SizedBox(width: 5),
                        Text(
                          'Download song',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Close',
                        style: TextStyle(
                          color: Colors.white38,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> addSongToPlaylist() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: AlertDialog(
            insetPadding: const EdgeInsets.all(0),
            backgroundColor: MyColors.darkGray.withOpacity(0.9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  decelerationRate: ScrollDecelerationRate.normal),
              child: ListBody(
                children: <Widget>[
                  /// Title Playlist
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'Playlists',
                        style: TextStyle(
                          color: MyColors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  /// Playlists
                  SizedBox(
                    height: 350,
                    width: 300,
                    child: Expanded(
                      child: GridView.builder(
                        physics: const BouncingScrollPhysics(
                            decelerationRate: ScrollDecelerationRate.normal),
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1,
                          mainAxisExtent: 175,
                        ),
                        itemCount: 12 + 1,
                        itemBuilder: (context, index) {
                          if (index == 12) {
                            return const SizedBox(
                                height:
                                0); // 70 sin el player y 160 si esta el player
                          }
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
//Añadir a la playlist
                                  print("Playlist ${index + 1}");
                                },
                                child: Container(
                                  height: 130,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    color: MyColors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(20),
                                    image: const DecorationImage(
                                      image: AssetImage('assets/icons/lofi.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Playlist ${index + 1}',
                                style: const TextStyle(
                                  color: MyColors.white,
                                  fontSize: 20,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        appBar: MyAppBar(
          leadingIcon: Icons.menu_sharp,
          trailingIcon: firebaseservice.userimg,
          onLeadingIconPressed: () {
            setState(() {
              _showIcons = !_showIcons;
            });
          },
          onProfileButtonPressed: () {
            Navigator.pushNamed(context, '/profileMobile');
          },
          showExtraIcons: _showIcons,
          onThemeButtonPressed: () {
            Navigator.pushNamed(context, '/appearance');
          },
          onInfoButtonPressed: () {
            showMyDialog();
          },
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.fast),
          child: Column(
            children: [
              /// Las mas reproducidas esta semana
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Las más reproducidas \nesta semana',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    child: Table(
                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                      columnWidths: const {
                        0: FixedColumnWidth(45),
                        1: FlexColumnWidth(),
                        2: FixedColumnWidth(60),
                        3: FixedColumnWidth(32),
                      },
                      children: List.generate(
                        5,
                        (index) {
                          return TableRow(
                            children: [
                              Text(
                                '0${index + 1}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      songs[index]['title'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      songs[index]['artist'],
                                      style: const TextStyle(
                                        color: MyColors.mainGreen,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  optionSongs();
                                },
                                child: const Icon(
                                  Icons.more_vert,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                songs[index]['duration'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          );
                        },
                      )
                    ),
                  ),
                ],
              ),

              /// ULTIMAS CANCIONES AÑADIDAS
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 10, left: 15),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Últimas canciones \nañadidas',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: List.generate(songs.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              _dialogFuture();
                            },
                            child: SizedBox(
                              width: 170,
                              child: Column(
                                children: [
                                  Container(
                                    width: 140,
                                    height: 140,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(songs[index]['img']),
                                        fit: BoxFit.cover,
                                      ),
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    songs[index]['title'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 5),
                                  SizedBox(
                                    width: 180,
                                    child: Text(
                                      songs[index]['artist'],
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: MyColors.mainGreen,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 180),
            ],
          ),
        ),
      ),
    );
  }
}