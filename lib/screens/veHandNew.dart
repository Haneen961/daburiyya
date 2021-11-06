import 'package:flutter/material.dart';

class VeHandNew extends StatefulWidget {
  const VeHandNew({Key? key}) : super(key: key);

  @override
  _VeHandNewState createState() => _VeHandNewState();
}

class _VeHandNewState extends State<VeHandNew> {
  List<Color> colors = [
    Color.fromRGBO(230, 245, 253, 1), //b
    Color.fromRGBO(246, 186, 7, 1), //y
    Color.fromRGBO(217, 18, 47, 1), //r
    Color.fromRGBO(4, 120, 13, 1), //g
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return con(colors[(index % 3) + 1], colors[index % 3]);
        },
      ),
    );
  }

  Widget con(Color color1, Color color2) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 3.62,
          color: color1,
        ),
        Container(
          height: MediaQuery.of(context).size.height / 3.62,
          decoration: BoxDecoration(
            color: color2,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100.0)),
          ),
        ),
      ],
    );
  }
}
