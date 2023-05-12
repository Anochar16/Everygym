import 'package:flutter/material.dart';

class myStyle {
  SafeArea myBackground({required double screenW, required double screenH}) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
              child: Image.asset(
            'images/bg.jpg',
            width: screenW,
            height: screenH,
            fit: BoxFit.cover,
          )),
          Container(
            width: screenW,
            height: screenH,
            decoration: BoxDecoration(color: Color.fromARGB(247, 8, 6, 37)),
          )
        ],
      ),
    );
  }
}

class textStyle {
  textheightlight({required double fontSize}) {
    return TextStyle(
        color: Colors.white, fontSize: fontSize, fontWeight: FontWeight.bold);
  }
}

class divider extends StatelessWidget {
  const divider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1,
      indent: 20,
      endIndent: 20,
      color: Color.fromARGB(255, 208, 208, 208),
    );
  }
}
