
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({
    required this.onPressed,
    required this.icon
  });
}

class PinterestMenu extends StatelessWidget {

  final bool show;
  final Color activeColor;
  final Color inactiveColor;
  final Color backgroundColor;

  final List<PinterestButton> items;

  const PinterestMenu({
    super.key,
    this.show = true,
    required this.items,
    this.activeColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.inactiveColor = Colors.blueGrey
  });

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Builder(
        builder: ((context) {

          final _MenuModel menuModel = Provider.of<_MenuModel>(context);
          menuModel.activeColor = activeColor;
          menuModel.inactiveColor = inactiveColor;
          menuModel.backgroundColor = backgroundColor;
          
          return AnimatedOpacity(
            opacity: show ? 1 : 0,
            duration: const Duration( milliseconds: 250 ),
            child: _PinterestMenuBackground(
              child: _MenuItems( items: items )
            ),
          );
        }),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;

  const _PinterestMenuBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _MenuModel menuModel = Provider.of<_MenuModel>(context);

    return Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: menuModel.backgroundColor,
        borderRadius: const BorderRadius.all( Radius.circular(100) ),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -5
          )
        ]
      ),
      child: child,

    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> items;

  const _MenuItems({
    super.key,
    required this.items
  });
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(items.length, (index) => _PinterestMenuButton( index: index, item: items[index], ))
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {

  final int index;
  final PinterestButton item;

  const _PinterestMenuButton({
    super.key,
    required this.index,
    required this.item
  });

  @override
  Widget build(BuildContext context) {

    final _MenuModel menuModel = Provider.of<_MenuModel>(context);
    final int currentIndex = menuModel.currentIndex;
    final bool isActive = (currentIndex == index);

    return GestureDetector(
      onTap: () {
        menuModel.currentIndex = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Icon(
        item.icon,
        size: isActive ? 35 : 25,
        color: isActive ? menuModel.activeColor : menuModel.inactiveColor,
      ),
    );
  }

}

class _MenuModel with ChangeNotifier {
  int _currentIndex = 0;
  Color _activeColor = Colors.black;
  Color _inactiveColor = Colors.blueGrey;
  Color _backgroundColor = Colors.white;

  int get currentIndex => _currentIndex;
  Color get activeColor => _activeColor;
  Color get inactiveColor => _inactiveColor;
  Color get backgroundColor => _backgroundColor;

  set currentIndex( int index ) {
    _currentIndex = index;
    notifyListeners();
  }

  set activeColor( Color color ) {
    _activeColor = color;
  }

  set inactiveColor( Color color ) {
    _inactiveColor = color;
  }

  set backgroundColor( Color color ) {
    _backgroundColor = color;
  }

}
