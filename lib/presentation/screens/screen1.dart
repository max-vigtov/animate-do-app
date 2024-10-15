import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
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
          SlideInLeft(
            from: 100,
            child: IconButton(
              onPressed: () {
                Navigator.push(context, 
                  CupertinoPageRoute(
                    builder: (context) => const Screen1()
                  ));
              }, 
              icon: const Icon( Icons.navigate_next, color: Colors.white )
            ),
          ),          
        ],
      ),
      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blue,
          child: const FaIcon( FontAwesomeIcons.play, color: Colors.white ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElasticIn(
              delay: const Duration( milliseconds: 1100),
              child: const Icon( Icons.new_releases, color: Colors.blue, size: 40 )
            ),

            FadeInDown(
              delay: const Duration(milliseconds: 200),
              child: const Text( 'Título', style: TextStyle( fontSize: 40, fontWeight: FontWeight.w200) )
            ),

            FadeInDown(
              delay: const Duration(milliseconds: 1000),
              child: const Text( 'Soy un texto pequeño', style: TextStyle( fontSize: 20, fontWeight: FontWeight.w400) )
            ),

            FadeInLeft(
              delay: const Duration( milliseconds:  1100),
              child: Container(
                width: 220,
                height: 2,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}

