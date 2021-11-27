import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:daburiyyastory/screens/participantsPhotos.dart';
import 'package:daburiyyastory/screens/toolsPictures.dart';
import 'dart:math' as math;

import 'package:daburiyyastory/screens/videos.dart';

import 'flutter_pdfviewer.dart';

const double degrees2Radians = math.pi / 180.0;

class Library extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(Videos.routeName);
              },
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .07),
                height: MediaQuery.of(context).size.height * .2,
                width: MediaQuery.of(context).size.width * .4,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(246, 186, 7, 1),
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  'الفيديوهات',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(ToolsPictures.routeName);
              },
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .07),
                height: MediaQuery.of(context).size.height * .2,
                width: MediaQuery.of(context).size.width * .4,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(217, 18, 47, 1),
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  'صور الأدوات',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Theme.of(context).primaryColor),
                ),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(ParticipantsPhotos.routeName);
              },
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .07),
                height: MediaQuery.of(context).size.height * .2,
                width: MediaQuery.of(context).size.width * .4,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(4, 120, 13, 1),
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  'صور المشاركين',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                // Navigator.of(context).pushNamed(FullPdfViewerScreen.routeName);
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            new FlutterPDFViewer()));
              },
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .07),
                height: MediaQuery.of(context).size.height * .2,
                width: MediaQuery.of(context).size.width * .4,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(230, 245, 253, 1),
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  'الكتاب',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Theme.of(context).primaryColor),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
