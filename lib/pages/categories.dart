import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  CategoriesPage({Key? key}) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Categories"),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          child: Center(
            child: Column(
              children: [OfficeCard()],
            ),
          ),
        ),
      ),
    );
  }
}

class OfficeCard extends StatelessWidget {
  const OfficeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.chair),
              title: Text('Office'),
              subtitle: Text('Browse office keyboards'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  child: const Text('Browse'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/Office');
                  },
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.gamepad),
              title: Text('Gaming'),
              subtitle: Text('Browse gaming keyboards'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  child: const Text('Browse'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/gaming');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
