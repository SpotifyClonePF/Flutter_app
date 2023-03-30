import 'package:Sound2U/models/data.dart';
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
        appBar: MyAppBar(
          leadingIcon: Icons.menu,
          trailingIcon: Icons.account_circle,
          onLeadingIconPressed: () {},
          onProfileButtonPressed: () {},
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(top: 20,left: 15),
            child: Row(
              children: List.generate(songs.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        Container(
                          width: 180,
                          height: 180,
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
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          width: 180,
                          child: Text(
                            songs[index]['artist'],
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.grey,
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
      ),
    );
  }
}
