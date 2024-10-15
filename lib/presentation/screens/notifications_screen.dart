import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _NotificationModel(),      
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: const Text( 'Notifications Screen')),
        floatingActionButton: const FloatingButton(),
        bottomNavigationBar: const BottomNavigation(),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final int number = Provider.of<_NotificationModel>(context).getNumber;

    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        const BottomNavigationBarItem(
          label: 'Bones',
          icon: FaIcon( FontAwesomeIcons.bone )
        ),
        BottomNavigationBarItem(
          label: 'Notifications',
          icon: Stack( 
            children:  [
              const FaIcon( FontAwesomeIcons.bell ),
              Positioned(
                top: 0.0,
                right: 0.0,
                child: BounceInDown(
                  from: 10,
                  animate: ( number > 0 ? true : false),
                  child: Bounce(
                    from: 10,
                    controller: ( controller ) => Provider.of<_NotificationModel>(context).setBounceController = controller,
                    child: Container(
                      alignment: Alignment.center,
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.circle,
                      ),
                      child: Text('$number', style: const TextStyle( color: Colors.white, fontSize: 9 ),),
                    ),
                  ),
                ),
              )
            ]
          )
        ),
        const BottomNavigationBarItem(
          label: 'My Dog',
          icon: FaIcon( FontAwesomeIcons.dog )
        ),
      ]
    );
  }
}

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.pink,
      child: const FaIcon( FontAwesomeIcons.play, color: Colors.white ),        
      onPressed: () { 
        final notifyModel = Provider.of<_NotificationModel>(context, listen: false);
      
        int number = notifyModel.getNumber;
        number++;
        notifyModel.number = number;  

        if ( number >= 2 ) {
          final controller = notifyModel.getBounceController;
          controller.forward( from:  0.0 );
        }
      }
    );
  }
}

class _NotificationModel extends ChangeNotifier {
  int _number = 0;
  late AnimationController _bounceController;

  int get getNumber => _number;

  set number( int value ){
    _number = value;
    notifyListeners();
  }

  AnimationController get getBounceController => _bounceController;

  set setBounceController( AnimationController controller ){
    _bounceController = controller;
  }
}