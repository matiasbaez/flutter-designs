import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:designs/models/models.dart';
import 'package:designs/screens/screens.dart';
import 'package:designs/routes/routes.dart';
import 'package:designs/theme/theme.dart';

class LauncherTabletScreen extends StatelessWidget {
  const LauncherTabletScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final LayoutModel layoutModel = Provider.of<LayoutModel>(context);
    final themeChanger = Provider.of<ThemeChanger>(context);
    final appTheme = themeChanger.currentTheme;

    return Scaffold(

      appBar: AppBar(
        backgroundColor: appTheme.colorScheme.secondary,
        title: const Text('Launcher - Tablet'),
      ),

      drawer: _CustomDrawer(),

      body: Row(
        children: <Widget>[

          SizedBox(
            width: 300,
            height: double.infinity,
            child: _OptionsList()
          ),

          Container(
            width: 1,
            height: double.infinity,
            color: ( themeChanger.darkTheme ) ? Colors.grey : appTheme.colorScheme.secondary,
          ),

          Expanded(
            child: layoutModel.currentPage
          ),

        ]
      ),
    );
  }
}

class _OptionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: const  BouncingScrollPhysics(),
      itemCount: pageRoutes.length,
      separatorBuilder: (context, index) => Divider(
        color: appTheme.primaryColorLight,
      ),
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon( pageRoutes[i].icon, color: appTheme.colorScheme.secondary ),
        title: Text( pageRoutes[i].title ),
        trailing: FaIcon( FontAwesomeIcons.chevronRight, color: appTheme.colorScheme.secondary ),
        onTap: () {
          final LayoutModel layoutModel = Provider.of<LayoutModel>(context, listen: false);  
          layoutModel.currentPage = pageRoutes[i].page;
        }
      ),
    );
  }
}

class _CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final themeChanger = Provider.of<ThemeChanger>(context, listen: true);
    final appTheme = themeChanger.currentTheme;
    final secondaryColor = appTheme.colorScheme.secondary;

    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                padding: const EdgeInsets.all( 20 ),
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: secondaryColor,
                  child: const Text('MB', style: TextStyle( fontSize: 50 ) ),
                ),
              ),
            ),

            Expanded(
              child: _OptionsList()
            ),

            ListTile(
              leading: Icon( Icons.lightbulb_outline, color: secondaryColor ),
              title: const Text( 'Dark Mode' ),
              trailing: Switch.adaptive(
                value: themeChanger.darkTheme,
                activeColor: secondaryColor,
                onChanged: (value) {
                  themeChanger.darkTheme = value;
                }
              ),
            ),

            SafeArea(
              top: false,
              right: false,
              bottom: true,
              left: false,
              child: ListTile(
                leading: Icon( Icons.add_to_home_screen, color: secondaryColor ),
                title: const Text( 'Custom Theme' ),
                trailing: Switch.adaptive(
                  value: themeChanger.customTheme,
                  activeColor: secondaryColor,
                  onChanged: (value) {
                    themeChanger.customTheme = value;
                  }
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}