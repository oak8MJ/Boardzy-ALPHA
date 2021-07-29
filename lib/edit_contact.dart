import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class EditPost extends StatefulWidget {
  String PostKey;

  EditPost({required this.PostKey});

  @override
  _EditPostState createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  late TextEditingController _imageController, _titleController;
  String _categorySelected = '';

  late DatabaseReference _ref;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _imageController = TextEditingController();
    _titleController = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('Posts');
    getPostDetail();
  }

  Widget _buildPostcategory(String title) {
    return InkWell(
      child: Container(
        height: 40,
        width: 90,
        decoration: BoxDecoration(
          color: _categorySelected == title
              ? Colors.green
              : Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          _categorySelected = title;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Post'),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _imageController,
              decoration: InputDecoration(
                hintText: 'Enter image',
                prefixIcon: Icon(
                  Icons.account_circle,
                  size: 30,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Enter title',
                prefixIcon: Icon(
                  Icons.phone_iphone,
                  size: 30,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildPostcategory('Office'),
                  SizedBox(width: 10),
                  _buildPostcategory('Gaming'),
                  SizedBox(width: 10),

                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: RaisedButton(
                child: Text(
                  'Update Post',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {
                  savePost();
                },
                color: Theme.of(context).primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }

  getPostDetail() async {
    DataSnapshot snapshot = await _ref.child(widget.PostKey).once();

    Map Post = snapshot.value;

    _imageController.text = Post['image'];

    _titleController.text = Post['title'];

    setState(() {
      _categorySelected = Post['category'];
    });
  }

  void savePost() {
    String image = _imageController.text;
    String title = _titleController.text;

    Map<String, String> Post = {
      'image': image,
      'title':  title,
      'category': _categorySelected,
    };

    _ref.child(widget.PostKey).update(Post).then((value) {
      Navigator.pop(context);
    });
  }
}
