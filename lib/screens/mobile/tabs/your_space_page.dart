import 'package:Sound2U/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class YourSpace extends StatefulWidget {
  const YourSpace({Key? key}) : super(key: key);

  @override
  State<YourSpace> createState() => _YourSpaceState();
}

class _YourSpaceState extends State<YourSpace> {
  final ScrollController _scrollController = ScrollController();

  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    super.dispose();
  }

  void _handleScroll() {
    if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
      setState(() {
        _isVisible = false;
      });
    } else {
      setState(() {
        _isVisible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: double.infinity,
        toolbarHeight: 100,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              'Your space',
              style: TextStyle(
                color: MyColors.white,
                fontSize: 30,
              ),
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: Icon(
              Icons.add,
              color: MyColors.white,
              size: 36,
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              /// LIKED SONGS
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: _isVisible ? 70 : 0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: MyColors.white.withOpacity(0.9),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Liked songs ♥',
                    style: TextStyle(
                      color: MyColors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(height: _isVisible ? 20 : 0),

              /// SEARCH PLAYLISTS
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: const TextStyle(color: Colors.white),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      fillColor: Colors.white.withOpacity(0.2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    textAlignVertical: TextAlignVertical.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),

              /// PLAYLISTS
              Expanded(
                child: GridView.builder(
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(
                      decelerationRate: ScrollDecelerationRate.normal),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 20,
                    childAspectRatio: 1,
                    mainAxisExtent: 175,
                  ),
                  itemCount: 12 + 1,
                  itemBuilder: (context, index) {
                    if (index == 12){
                      return const SizedBox(height: 0); // 70 sin el player y 160 si esta el player
                    }
                    return Column(
                      children: [
                        Container(
                          height: 140,
                          width: 140,
                          decoration: BoxDecoration(
                            color: MyColors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              image: AssetImage('assets/icons/lofi.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Playlist ${index + 1}',
                          style: const TextStyle(
                            color: MyColors.white,
                            fontSize: 20,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
