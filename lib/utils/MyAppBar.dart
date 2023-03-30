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
      toolbarHeight: 70,
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
          padding: padding,
          child: IconButton(
            icon: const Icon(
              Icons.account_circle,
              size: 36,
            ),
            onPressed: onProfileButtonPressed,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
