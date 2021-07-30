import 'package:flutter/material.dart';
import 'package:pages_familiar/services/data_service.dart';
import 'package:flutter/widgets.dart';



class CreateKeyboard extends StatefulWidget {
  const CreateKeyboard({Key? key}) : super(key: key);

  @override
  _CreateKeyboardState createState() => _CreateKeyboardState();
}

class _CreateKeyboardState extends State<CreateKeyboard> {
  final DataService _data = DataService();
  String image = '';
  String title = '';
  String category = '';
  
  
  final FormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        
        key: FormKey,
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (val) {
                setState(() => image = val.trim());
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Image URL',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (val) {
                setState(() => title = val.trim());
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (val) {
                setState(() => category = val.trim());
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Category',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
                child: Text('Upload'),
                onPressed: () async {
                  
                  if (FormKey.currentState!.validate()) {
                    dynamic result =
                        await _data.savePost(image, title, category);
                    if (result == null) {
                      print('Upload');
                      print(result);
                    }
                  }
                  Text('Upload');
                }),
          )
        ]),
      ),
      appBar: AppBar(
        title: Text("Upload your Keyboard"),
      ),
    );
  }
}
