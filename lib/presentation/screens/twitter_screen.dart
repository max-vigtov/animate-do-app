import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterScreen extends StatefulWidget {
  const TwitterScreen({super.key});

  @override
  State<TwitterScreen> createState() => _TwitterScreenState();
}

class _TwitterScreenState extends State<TwitterScreen> {

  late bool activated = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1da1f2),
      body: Center(
        child: ZoomOut(
          animate: activated,
          from: 30,
          duration: const Duration(milliseconds: 1000),
          child: const FaIcon( FontAwesomeIcons.twitter, color: Colors.white, size: 40 )
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              activated = !activated;
            });
          },
          backgroundColor: Colors.pink,
          child: const FaIcon( FontAwesomeIcons.play, color: Colors.white ),
      )
    );
  }
}