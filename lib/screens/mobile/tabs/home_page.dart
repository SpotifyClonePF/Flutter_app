import 'package:Sound2U/models/data.dart';
import 'package:Sound2U/styles/colors.dart';
import 'package:Sound2U/utils/MyAppBar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        appBar: MyAppBar(
          leadingIcon: Icons.menu_sharp,
          trailingIcon: Icons.account_circle,
          onLeadingIconPressed: () {},
          onProfileButtonPressed: () {
            Navigator.pushNamed(context, '/profileMobile');
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
                            onTap: () {},
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