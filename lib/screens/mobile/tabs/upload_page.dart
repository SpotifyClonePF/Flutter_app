import 'package:Sound2U/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {

  Future<void> _dialogFuture() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: MyColors.darkGray,
          title: const Text('Coming soon', style: TextStyle(color: Colors.white),),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This feature is coming soon.', style: TextStyle(color: Colors.white),),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(0),
          backgroundColor: MyColors.darkGray,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.close,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          content: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.normal),
            child: ListBody(
              children: <Widget>[
                /// Upload icon
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          _dialogFuture();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(40),
                            child: Icon(
                              Icons.add_photo_alternate,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text("Cover image",
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                ),

                /// Upload song button
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: InkWell(
                    onTap: () {
                      _dialogFuture();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(7),
                        child: Icon(
                          Icons.add_box_outlined,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ),

                /// Song name
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Song\'s name',
                        contentPadding: EdgeInsets.only(left: 20),
                        hintStyle: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),

                /// Artist name
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Artist\'s name',
                        contentPadding: EdgeInsets.only(left: 20),
                        hintStyle: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: double.infinity,
                child: TextButton(
                  child: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      'Upload',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  onPressed: () {
                    _dialogFuture();
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
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
              'Upload',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Upload file button
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: DottedBorder(
                    color: Colors.white,
                    borderType: BorderType.Circle,
                    dashPattern: const [15, 25],
                    strokeCap: StrokeCap.round,
                    strokeWidth: 3,
                    child: GestureDetector(
                      onTap: () {
                        _showMyDialog();
                      },
                      child: const CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.transparent,
                        child: Icon(
                          Icons.file_upload_outlined,
                          color: Colors.white,
                          size: 80,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              /// Recent uploads
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Recent uploaded',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    /// Table songs recent
                    Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Center(
                        child: Text(
                          'No recent uploads',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
