import 'package:Dyzr/models/data.dart';
import 'package:Dyzr/models/play_mobile.dart';
import 'package:Dyzr/screens/mobile/tabs/search_page.dart';
import 'package:Dyzr/styles/colors.dart';
import 'package:flutter/material.dart';
import 'tabs/home_page.dart';
import 'tabs/your_space_page.dart';
import 'tabs/upload_page.dart';

class HomeMobilePage extends StatefulWidget {
  const HomeMobilePage({super.key});

  @override
  State<HomeMobilePage> createState() => _HomeMobilePageState();
}

class _HomeMobilePageState extends State<HomeMobilePage> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const Home(),
    const Search(),
    const YourSpace(),
    const Upload(),
  ];

  final List<IconData> icons = [
    Icons.home,
    Icons.search,
    Icons.filter_list,
    Icons.upload,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.black,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Stack(
          children: [
            IndexedStack(
              index: selectedIndex,
              children: pages,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: MusicWidget(
                      imageUrl: "assets/icons/lofi.png",
                      song: lofihiphopMusic[0],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 5),
                    decoration: BoxDecoration(
                      color: MyColors.lightBlack.withAlpha(505),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ...List.generate(
                          icons.length,
                          (index) => GestureDetector(
                            onTap: () {
                              if (index != selectedIndex) {
                                setState(() {
                                  selectedIndex = index;
                                });
                              }
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AnimatedBar(
                                  isActive: index == selectedIndex,
                                ),
                                Flexible(
                                  child: SizedBox(
                                    height: 36,
                                    width: 50,
                                    child: Icon(
                                      icons[index],
                                      size: 30,
                                      color: index == selectedIndex
                                          ? MyColors.white
                                          : Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(bottom: 2),
      height: 4,
      width: isActive ? 20 : 0,
      decoration: const BoxDecoration(
        color: MyColors.mainGreen,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}