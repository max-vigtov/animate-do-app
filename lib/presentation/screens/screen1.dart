
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Screen1 extends StatelessWidget {
  const Screen1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Animate_do'),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const FaIcon( FontAwesomeIcons.twitter, color: Colors.white )
          ),
          IconButton(
            onPressed: () {}, 
            icon: const Icon( Icons.navigate_next, color: Colors.white )
          ),          
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: const FaIcon( FontAwesomeIcons.play, color: Colors.white ),
      ),
    );
  }
}

