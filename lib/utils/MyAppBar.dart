import 'package:Sound2U/styles/colors.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconData leadingIcon, trailingIcon;
  final VoidCallback onLeadingIconPressed;
  final VoidCallback onProfileButtonPressed;

  const MyAppBar({
    Key? key,
    required this.leadingIcon,
    required this.trailingIcon,
    required this.onLeadingIconPressed,
    required this.onProfileButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0);
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: padding,
        child: IconButton(
          icon: Icon(
            leadingIcon,
            size: 36,
          ),
          onPressed: onLeadingIconPressed,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
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
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
