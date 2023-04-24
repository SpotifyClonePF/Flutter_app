import 'package:flutter/material.dart';
import '../../models/data.dart';
import '../../styles/colors.dart';

class ProfileMobile extends StatelessWidget {
  const ProfileMobile({Key? key}) : super(key: key);

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
                child: const Icon(
                  Icons.edit,
                  color: MyColors.white,
                  size: 25,
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
                          image: const DecorationImage(
                            image: AssetImage('assets/icons/lofi.png'),
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
                        const Text(
                          'DyzrAdmin',
                          style: TextStyle(
                              color: MyColors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'DyzrAdmin@gmail.com',
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
                                children: List.generate(songs.length, (index) {
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
                                                image: AssetImage(
                                                    songs[index]['img']),
                                                fit: BoxFit.cover,
                                              ),
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(15),
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
                                    const Icon(
                                      Icons.more_vert,
                                      color: Colors.white,
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
