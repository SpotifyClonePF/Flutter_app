import 'package:Sound2U/screens/mobile/tabs/search_page.dart';
import 'package:Sound2U/styles/colors.dart';
//import 'package:Sound2U/utils/rive_utils.dart';
import 'package:flutter/material.dart';
import 'tabs/home_page.dart';
import 'tabs/page3_page.dart';
import 'tabs/page4_page.dart';

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
    const Page3(),
    const Page4(),
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
              child: Container(
                padding: const EdgeInsets.all(12),
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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

/*
class RiveAsset {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;

  RiveAsset(this.src,
      {required this.artboard,
      required this.stateMachineName,
      required this.title,
      this.input});

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottomNavs = [
  RiveAsset("assets/icons/rive.riv",
      artboard: "CHAT", stateMachineName: "CHAT_Interactivity", title: "Chat"),
  RiveAsset("assets/icons/rive.riv",
      artboard: "SEARCH",
      stateMachineName: "SEARCH_Interactivity",
      title: "Search"),
  RiveAsset("assets/icons/rive.riv",
      artboard: "TIMER",
      stateMachineName: "TIMER_Interactivity",
      title: "Timer"),
  RiveAsset("assets/icons/rive.riv",
      artboard: "USER", stateMachineName: "USER_Interactivity", title: "Bell"),
];*/

/*
class _HomeMobilePageState extends State<HomeMobilePage> {
  RiveAsset selectedBottomNav = bottomNavs.first;

  final List<Widget> pages = [
    const Home(),
    const Page2(),
    const Page3(),
    const Page4(),
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
              index: bottomNavs.indexOf(selectedBottomNav),
              children: pages,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(12),
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: MyColors.lightBlack.withAlpha(505),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...List.generate(
                      bottomNavs.length,
                      (index) => GestureDetector(
                        onTap: () {
                          bottomNavs[index].input!.change(true);
                          if (bottomNavs[index] != selectedBottomNav) {
                            setState(() {
                              selectedBottomNav = bottomNavs[index];
                            });
                          }
                          Future.delayed(const Duration(seconds: 1), () {
                            bottomNavs[index].input!.change(false);
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimatedBar(
                                isActive:
                                    bottomNavs[index] == selectedBottomNav),
                            Flexible(
                              child: SizedBox(
                                height: 36,
                                width: 50,
                                child: Opacity(
                                  opacity:
                                      bottomNavs[index] == selectedBottomNav
                                          ? 1
                                          : 0.5,
                                  child: RiveAnimation.asset(
                                    'assets/icons/rive.riv',
                                    artboard: bottomNavs[index].artboard,
                                    onInit: (artboard) {
                                      StateMachineController controller =
                                          RiveUtils.getRiveController(artboard,
                                              stateMachineName:
                                                  bottomNavs[index]
                                                      .stateMachineName);
                                      bottomNavs[index].input = controller
                                          .findSMI("active") as SMIBool;
                                    },
                                  ),
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
            ),
          ],
        ),
      ),
    );
  }
}
*/