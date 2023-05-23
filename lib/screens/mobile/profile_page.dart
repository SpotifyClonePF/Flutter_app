import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../../models/data.dart';
import '../../styles/colors.dart';
import 'package:Dyzr/services/firebase_service.dart' as firebaseservice;

class ProfileMobile extends StatefulWidget {
  const ProfileMobile({Key? key}) : super(key: key);

  @override
  State<ProfileMobile> createState() => _ProfileMobileState();
}

class _ProfileMobileState extends State<ProfileMobile> {
  File? image;
  String playlistName = '';
  String searchText = '';

  void goToWelcome() {
    Navigator.pushReplacementNamed(context, '/');
  }

  Future gotoPagina() async {
    await firebaseservice.deleteImage();
    await firebaseservice.insertImage(this.image);
    Navigator.of(context).pop();
    await Navigator.pushReplacementNamed(context, '/profileMobile');
  }

  Future _pickImageFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
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
                                      image:
                                          AssetImage('assets/icons/lofi.png'),
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

  Future<void> createPlaylistPage() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: AlertDialog(
              insetPadding: const EdgeInsets.all(0),
              backgroundColor: MyColors.darkGray.withOpacity(0.8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    image = null;
                    playlistName = '';
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              content: SingleChildScrollView(
                physics: const BouncingScrollPhysics(
                    decelerationRate: ScrollDecelerationRate.normal),
                child: ListBody(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _pickImageFromGallery();
                            });
                          },
                          child: image != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.file(
                                    image!,
                                    fit: BoxFit.cover,
                                    width: 90,
                                    height: 150,
                                  ),
                                )
                              : const Padding(
                                  padding: EdgeInsets.all(40),
                                  child: Icon(
                                    Icons.add_photo_alternate,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                ),
                        ),
                      ),
                    ),

                    /// Playlist name
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Playlist\'s name',
                            contentPadding: EdgeInsets.only(left: 20),
                            hintStyle: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          onChanged: (value) {
                            setState(() {
                              playlistName = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: double.infinity,
                    child: TextButton(
                      child: const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'Create Playlist',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  Future<void> showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: MyColors.darkGray,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Close button
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 30,
                ),
              ),

              /// Check button
              IconButton(
                onPressed: () async {
                  await gotoPagina();
                },
                icon: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
          content: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.normal),
            child: ListBody(
              children: <Widget>[
                /// Information text
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: MyColors.mainGreen,
                      width: 5,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white24,
                    child: Container(
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                        color: MyColors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                          image: image != null
                              ? Image.file(image!).image
                              : Image.network(firebaseservice.userimg).image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                /// Change image button
                Center(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: MyColors.mainGreen,
                        width: 2,
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _pickImageFromGallery();
                        });
                        Navigator.of(context).pop();
                        showMyDialog();
                      },
                      child: const Text(
                        'Change Image',
                        style: TextStyle(
                          color: MyColors.mainGreen,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                /// Name textfield
                TextField(
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Username',
                    suffixIcon: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    hintStyle: const TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// Change password button
                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MyColors.mainGreen,
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Change Password',
                      style: TextStyle(
                        color: MyColors.darkGray,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
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
                    onTap: () {},
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 80,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                alignment: Alignment.centerLeft,
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: MyColors.white,
                  size: 25,
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    showMyDialog();
                  },
                  child: const Icon(
                    Icons.edit,
                    color: MyColors.white,
                    size: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  /// Profile picture
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: MyColors.mainGreen,
                        width: 5,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white24,
                      child: Container(
                        height: 140,
                        width: 140,
                        decoration: BoxDecoration(
                          color: MyColors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                            image: NetworkImage(firebaseservice.userimg),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),

                  /// Username
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Text(
                          firebaseservice.nameUser,
                          style: const TextStyle(
                              color: MyColors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          firebaseservice.emailUser,
                          style: TextStyle(
                              color: MyColors.white.withOpacity(0.7),
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),

                  /// User info
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Column(
                            children: const [
                              Text(
                                '0',
                                style: TextStyle(
                                    color: MyColors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Upload songs',
                                style: TextStyle(
                                    color: MyColors.mainGreen,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: const [
                              Text(
                                '0',
                                style: TextStyle(
                                    color: MyColors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Followers',
                                style: TextStyle(
                                    color: MyColors.mainGreen,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: const [
                              Text(
                                '0',
                                style: TextStyle(
                                    color: MyColors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Following',
                                style: TextStyle(
                                    color: MyColors.mainGreen,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// Divider
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Divider(
                        height: 25,
                        color: MyColors.white.withOpacity(0.5),
                        thickness: 1),
                  ),

                  /// Search bar
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: MyColors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          const Icon(Icons.search,
                              color: MyColors.white, size: 25),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              style: const TextStyle(color: MyColors.white),
                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                    color: MyColors.white.withOpacity(0.7),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// Playlists
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Playlists',
                              style: TextStyle(
                                  color: MyColors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'See all',
                              style: TextStyle(
                                  color: MyColors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          SingleChildScrollView(
                            physics: const BouncingScrollPhysics(
                                decelerationRate: ScrollDecelerationRate.fast),
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      createPlaylistPage();
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
                                      child: SizedBox(
                                        width: 140,
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Colors
                                                    .grey, // Color del contenedor "Add Playlist"
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: const Icon(
                                                Icons
                                                    .add, // Ícono para "Add Playlist"
                                                size: 50,
                                                color: Colors
                                                    .white, // Color del ícono
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            const Text(
                                              'Add Playlist', // Texto debajo del contenedor "Add Playlist"
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              maxLines: 1,
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  ...List.generate(playlist.length, (index) {
                                    return GestureDetector(
                                      onTap: () {},
                                      child: SizedBox(
                                        width: 140,
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      playlist[index]
                                                          ['imageURL']),
                                                  fit: BoxFit.cover,
                                                ),
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              playlist[index]['name'],
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
                                                playlist[index]['artist'],
                                                maxLines: 1,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  color: MyColors.mainGreen,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  /// Your songs
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Your songs',
                              style: TextStyle(
                                  color: MyColors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'See all',
                              style: TextStyle(
                                  color: MyColors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Table(
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
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
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Text(
                                        songs[index]['title'],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        optionSongs();
                                      },
                                      icon: const Icon(
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
                            )),
                      ),
                    ],
                  ),

                  /// Logout
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 30),
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: MyColors.darkGray,
                              title: const Text(
                                'Cerrar sesión',
                                style: TextStyle(color: Colors.white),
                              ),
                              content: const Text(
                                '¿Está seguro que desea cerrar la sesión?',
                                style: TextStyle(color: Colors.white),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Cancelar'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    goToWelcome();
                                  },
                                  child: const Text('Cerrar sesión'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: MyColors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            'Log out',
                            style: TextStyle(
                                color: MyColors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
