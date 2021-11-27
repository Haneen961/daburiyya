import 'package:daburiyyastory/screens/courses.dart';
import 'package:daburiyyastory/screens/library.dart';
import 'package:daburiyyastory/screens/participantsPhotos.dart';
import 'package:daburiyyastory/screens/toolsPictures.dart';
import 'package:daburiyyastory/screens/veHandNew.dart';
import 'package:daburiyyastory/screens/videos.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLogin = false;
  @override
  void initState() {
    super.initState();
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        isLogin = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(30, 62, 135, 1),
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: isLogin ? MyHomePage() : LoginScreen(),
      routes: {
        MyHomePage.route: (context) => MyHomePage(),
        Videos.routeName: (context) => Videos(),
        LoginScreen.routeName: (context) => LoginScreen(),
        ParticipantsPhotos.routeName: (context) => ParticipantsPhotos(),
        ToolsPictures.routeName: (context) => ToolsPictures()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  static String route = 'home_page';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List pages = [Library(), VeHandNew(), Courses()];
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: pages[_currentIndex]),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: kBottomNavigationBarHeight,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: BottomNavigationBar(
                currentIndex: _currentIndex,
                backgroundColor: Color.fromRGBO(230, 245, 253, 1),
                selectedItemColor: Color.fromRGBO(30, 62, 135, 1),
                unselectedItemColor: Colors.black,
                selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      size: 0,
                    ),
                    label: ' مكتبة حكايتنا',
                  ),
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.settings_outlined,
                        size: 0,
                      ),
                      label: 'دورات مركز دبورية')
                ]),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: _currentIndex == 1
              ? Theme.of(context).primaryColor
              : Colors.blueGrey,
          child: Icon(
            Icons.home,
            color: Colors.black,
          ),
          onPressed: () => setState(() {
            _currentIndex = 1;
          }),
        ),
      ),
    );
  }
}
