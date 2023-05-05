import 'package:Sound2U/styles/colors.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconData leadingIcon, trailingIcon;
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
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: MyColors.mainGreen,
                  width: 3,
                ),
              ),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white24,
                child: Icon(
                  trailingIcon,
                  color: Colors.white,
                  size: 40,
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
