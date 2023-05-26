import 'package:Dyzr/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Appearance extends StatefulWidget {
  const Appearance({Key? key}) : super(key: key);

  @override
  State<Appearance> createState() => _AppearanceState();
}

class _AppearanceState extends State<Appearance> {
  bool _primerBotonHundido = false;
  bool _segundoBotonHundido = false;
  bool _darkMode = true;
  int _selectedIndex = 0;

  late SharedPreferences _preferences;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }
  Future<void> _loadPreferences() async {
    _preferences = await SharedPreferences.getInstance();
    setState(() {
      _selectedIndex = _preferences.getInt('selectedColorIndex') ?? 0;
    });
  }

  Future<void> _saveSelectedColor() async {
    await _preferences.setInt('selectedColorIndex', _selectedIndex);
  }
  List<Map<String, dynamic>> colorList = [
    {'name': 'Dyzr', 'color': MyColors.mainGreen},
    {'name': 'Amber', 'color': const Color(0xFFEDAB00)},
    {'name': 'Sapphire', 'color': const Color(0xFF0053F1)},
    {'name': 'Emerald', 'color': const Color(0xFF008000)},
    {'name': 'Scarlet', 'color': const Color(0xFFDA2424)},
    {'name': 'Amethyst', 'color': const Color(0xFFAB4AE7)},
    {'name': 'Citric', 'color': const Color(0xFFFFFF00)},
    {'name': 'Fuchsia', 'color': const Color(0xFFED09BB)},
    {'name': 'Jade', 'color': const Color(0xFF00FF85)},
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> colorContainers = colorList
        .map(
          (color) => GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = colorList.indexOf(color);
              });
              _saveSelectedColor();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: color['color'],
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: _selectedIndex == colorList.indexOf(color)
                        ? Border.all(
                            color: _darkMode ? MyColors.white : MyColors.black,
                            width: 2,
                          )
                        : null,
                  ),
                  child: _selectedIndex == colorList.indexOf(color)
                      ? Align(
                          alignment: Alignment.bottomRight,
                        child: Icon(
                            Icons.check_circle_outline,
                            color: _darkMode ? Colors.white : Colors.black,
                          ),
                      )
                      : null,
                ),
                const SizedBox(height: 10), // Espacio entre el color y el nombre
                Text(
                  color['name'],
                  style: TextStyle(
                    fontSize: 16,
                    color: _darkMode ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        )
        .toList();

    return Scaffold(
      backgroundColor: _darkMode ? Colors.transparent : MyColors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: _darkMode ? MyColors.white : MyColors.black,
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            'Appearance',
            style: TextStyle(
              fontSize: 25,
              color: _darkMode ? MyColors.white : MyColors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            /// Botones de la parte superior
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
              child: Row(
                children: [
                  /// Light mode
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _primerBotonHundido = true;
                          _segundoBotonHundido = false;
                          _darkMode = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        elevation: _primerBotonHundido ? 0 : 1,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(10),
                          ),
                        ),
                      ),
                      child: const Icon(
                        Icons.wb_sunny_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  /// Dark modem
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _primerBotonHundido = false;
                          _segundoBotonHundido = true;
                          _darkMode = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorList[_selectedIndex]['color'],
                        elevation: _segundoBotonHundido ? 0 : 1,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(10)),
                        ),
                      ),
                      child: const Icon(
                        Icons.nightlight_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            /// Theme colors
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Theme colors",
                      style: TextStyle(
                        fontSize: 20,
                        color: _darkMode ? MyColors.white : MyColors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                padding: const EdgeInsets.all(25),
                children: colorContainers,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
