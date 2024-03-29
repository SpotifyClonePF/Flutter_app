import 'package:Dyzr/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:Dyzr/services/firebase_service.dart' as firebaseservice;

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconData leadingIcon;
  final String trailingIcon;
  final VoidCallback onLeadingIconPressed;
  final VoidCallback onProfileButtonPressed;
  final VoidCallback onThemeButtonPressed;
  final VoidCallback onInfoButtonPressed;
  final bool showExtraIcons;

  const MyAppBar({
    Key? key,
    required this.leadingIcon,
    required this.trailingIcon,
    required this.onLeadingIconPressed,
    required this.onProfileButtonPressed,
    required this.showExtraIcons,
    required this.onThemeButtonPressed,
    required this.onInfoButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0);
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          if (!showExtraIcons) ...[
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    onThemeButtonPressed();
                  },
                  child: const Icon(
                    Icons.water_drop_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    onInfoButtonPressed();
                  },
                  child: const Icon(
                    Icons.info_outline_rounded,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ]
        ],
      ),
      leading: Padding(
        padding: padding,
        child: IconButton(
          icon: Icon(
            showExtraIcons ? leadingIcon : Icons.menu_open,
            size: 34,
          ),
          onPressed: onLeadingIconPressed,
          splashRadius: 1,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: InkWell(
            onTap: onProfileButtonPressed,
            child: Container(
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: MyColors.mainGreen,
                  width: 4,
                ),
              ),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: MyColors.mainGreen,
                child: Container(
                  height: 40,
                  width: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: NetworkImage(trailingIcon),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
