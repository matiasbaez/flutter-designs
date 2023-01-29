
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Notification Page'),
        ),
    
        body: Container(),
    
        floatingActionButton: const _FloatingButton(),
    
        bottomNavigationBar: const _CustomBottomNavigationBar(),
      ),
    );
  }
}

class _CustomBottomNavigationBar extends StatelessWidget {
  const _CustomBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final notification = Provider.of<_NotificationModel>(context);
    final amount = notification._number;

    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.blue,
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.grey,
      items: [

        const BottomNavigationBarItem(
          label: 'Bones',
          
          icon: FaIcon( FontAwesomeIcons.bone )
        ),

        BottomNavigationBarItem(
          label: 'Notifications',
          icon: Stack(
            children: <Widget>[
              const FaIcon( FontAwesomeIcons.bell ),

              Positioned(
                top: 0,
                right: 0,
                // child: Icon( Icons.brightness_1, size: 10, color: Colors.blueAccent, )
                child: BounceInDown(
                  from: 10,
                  animate: amount > 0,
                  child: Bounce(
                    from: 10,
                    controller: (controller) => Provider.of<_NotificationModel>(context).bounceController = controller,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle
                      ),
                      alignment: Alignment.center,
                      child: Text( '$amount', style: const TextStyle( color: Colors.white, fontSize: 7 ) ),
                    ),
                  ),
                ),
              )
            ]
          )
        ),

        const BottomNavigationBarItem(
          label: 'Account',
          icon: FaIcon( FontAwesomeIcons.accusoft )
        ),

      ],
    );
  }
}

class _FloatingButton extends StatelessWidget {
  const _FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final notification = Provider.of<_NotificationModel>(context, listen: false);
        int number = notification.number;
        number++;
        notification.number = number;

        if (number >= 2) notification.bounceController.forward( from: 0.0 );
      },
      backgroundColor: Colors.blue,
      child: const FaIcon( FontAwesomeIcons.play, color: Colors.white ),
    );
  }
}

class _NotificationModel extends ChangeNotifier {

  int _number = 0;
  late AnimationController _bounceController;

  int get number => _number;
  AnimationController get bounceController => _bounceController;

  set number( int number ) {
    _number = number;
    notifyListeners();
  }

  set bounceController( AnimationController bounceController ) {
    _bounceController = bounceController;
    // notifyListeners();
  }

}