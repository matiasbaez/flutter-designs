import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:designs/theme/theme.dart';

class SliverListScreen extends StatelessWidget {

  const SliverListScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: [
          _MainScroll(),

          Positioned(
            bottom: -10,
            right: 0,
            child: _NewListButton()
          ),
        ],
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {

  final items = const [
    _ListItem( title: 'Orange', color:Color(0xffF08F66) ),
    _ListItem( title: 'Family', color:Color(0xffF2A38A) ),
    _ListItem( title: 'Subscriptions', color:Color(0xffF7CDD5) ),
    _ListItem( title: 'Books', color:Color(0xffFCEBAF) ),
    _ListItem( title: 'Orange', color:Color(0xffF08F66) ),
    _ListItem( title: 'Family', color:Color(0xffF2A38A) ),
    _ListItem( title: 'Subscriptions', color:Color(0xffF7CDD5) ),
    _ListItem( title: 'Books', color:Color(0xffFCEBAF) ),
  ];

  @override
  Widget build(BuildContext context) {

    final themeChanger = Provider.of<ThemeChanger>(context, listen: true);
    final appTheme = themeChanger.currentTheme;

    return CustomScrollView(
      slivers: <Widget>[
        // SliverAppBar(
        //   floating: true,
        //   backgroundColor: Colors.blue,
        //   title: Text('Lorem IPsum'),
        // ),

        SliverPersistentHeader(
          floating: true,
          delegate: _CustomSliverHeaderDelegate(
            minHeight: 170,
            maxHeight: 200,
            child: Container(
              alignment: Alignment.centerLeft,
              color: appTheme.scaffoldBackgroundColor,
              child: const _Title()
            )
          )
        ),

        SliverList(
          delegate: SliverChildListDelegate([
            ...items,

            const SizedBox( height: 100 ),

            
          ])
        ),
      ],
    );
  }

}

class _CustomSliverHeaderDelegate extends SliverPersistentHeaderDelegate {

  final double minHeight;
  final double maxHeight;
  final Widget child;

  _CustomSliverHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(child: child);
  }

  @override
  double get maxExtent => (minHeight > maxHeight) ? minHeight : maxHeight;

  @override
  double get minExtent => (minHeight < maxHeight) ? minHeight : maxHeight;

  @override
  bool shouldRebuild(_CustomSliverHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
           minHeight != oldDelegate.minHeight ||
           child     != oldDelegate.child;
  }

}

class _NewListButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final themeChanger = Provider.of<ThemeChanger>(context, listen: true);
    final appTheme = themeChanger.currentTheme;

    return ButtonTheme(
      minWidth: size.width * 0.9,
      height: 100,
      child: MaterialButton(
        onPressed: () {},
        color: (themeChanger.darkTheme) ? appTheme.colorScheme.secondary : const Color(0xffED6762),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only( topLeft: Radius.circular( 50 ) )
        ),
        child: Text(
          'CREATE NEW LIST',
          style: TextStyle(
            color: appTheme.scaffoldBackgroundColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 3
          ),
        ),
      ),
    );
  }

}

class _TasksList extends StatelessWidget {

  final List<Widget> items; 

  const _TasksList({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: ((context, index) => items[index]),
    );
  }
}

class _ListItem extends StatelessWidget {

  final String title;
  final Color color;

  const _ListItem({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context, listen: true);
    final appTheme = themeChanger.currentTheme;

    return Container(
      height: 130,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: (themeChanger.darkTheme) ? Colors.grey : color,
        borderRadius: BorderRadius.circular( 30 )
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20
        )
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context, listen: true);
    final appTheme = themeChanger.currentTheme;

    return Column(
      children: <Widget>[
        const SizedBox( height: 30 ),

        Container(
          margin: const EdgeInsets.symmetric( horizontal: 30, vertical: 10 ),
          child: Text( 'New', style: TextStyle( color: (themeChanger.darkTheme) ? Colors.grey : const Color(0xff532128), fontSize: 50 ) )
        ),

        Stack(
          children: <Widget>[
            const SizedBox( width: 100 ),

            Positioned(
              bottom: 8,
              child: Container(
                width: 120,
                height: 8,
                color: (themeChanger.darkTheme) ? Colors.grey : const Color(0xffF7CDD5)
              ),
            ),

            Container(
              child: const Text( 'List', style: TextStyle( color: Color(0xffD93A30), fontSize: 50, fontWeight: FontWeight.bold ) ),
            ),

          ],
        )
      ]
    );
  }
}