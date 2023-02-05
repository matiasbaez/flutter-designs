

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:designs/widgets/widgets.dart';
import 'package:provider/provider.dart';

class PinterestScreen extends StatelessWidget {
  const PinterestScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: const [
            PinterestGrid(),
            _PinterestMenuLocation()
          ]
        )
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {

  const _PinterestMenuLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final _MenuModel menuModel = Provider.of<_MenuModel>(context);

    if ( screenWidth > 500 ) screenWidth = screenWidth - 300;

    return Positioned(
      bottom: 30,
      child: SizedBox(
        width: screenWidth,
        child: Row(
          children: [
            const Spacer(),

            PinterestMenu(
              show: menuModel.show,
              items: [
                PinterestButton(icon: Icons.pie_chart, onPressed: () {}),
                PinterestButton(icon: Icons.search, onPressed: () {}),
                PinterestButton(icon: Icons.notifications, onPressed: () {}),
                PinterestButton(icon: Icons.supervised_user_circle, onPressed: () {}),
              ],
            ),

            const Spacer(),
          ]
        )
      )
    );
  }
}

class PinterestGrid extends StatefulWidget {

  const PinterestGrid({
    Key? key,
  }) : super(key: key);

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {

  final List<int> items = List.generate(200, (i) => i);
  final ScrollController controller = ScrollController();
  double previousScroll = 0;

  @override
  void initState() {
    final _MenuModel menuModel = Provider.of<_MenuModel>(context, listen: false);

    controller.addListener(() {

      menuModel.show = !(controller.offset > previousScroll && controller.offset > 150);
      previousScroll = controller.offset;

    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    int count;
    count = (MediaQuery.of(context).size.width > 500) ? 3 : 2;

    return StaggeredGridView.countBuilder(
      crossAxisCount: count,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      controller: controller,
      itemCount: items.length,
      staggeredTileBuilder: (index) => StaggeredTile.count(1, index.isEven ? 1 : 2),
      itemBuilder: (context, index) => _PinterestItem(index: index ),
    );
  }
}

class _PinterestItem extends StatelessWidget {

  final int index;

  const _PinterestItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all( 5 ),
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all( Radius.circular(30) )
      ),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index'),
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  bool _show = true;

  bool get show => _show;

  set show( bool index ) {
    _show = index;
    notifyListeners();
  }

}
