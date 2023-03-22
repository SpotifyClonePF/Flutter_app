import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(top: 0.9),
        child: Icon(
          icon,
          color: Colors.white54,
          size: 30,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
            color: Colors.white54,
            fontSize: 18,
            overflow: TextOverflow.ellipsis),
      ),
      onTap: onTap,
    );
  }
}
