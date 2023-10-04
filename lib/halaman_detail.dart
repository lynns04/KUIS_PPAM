import 'package:flutter/material.dart';
import 'data_buku.dart';
import 'package:url_launcher/url_launcher.dart';

class HalamanDetail extends StatefulWidget {
  final DataBuku book;
  const HalamanDetail({super.key,required this.book});

  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: true,
        title: Text(widget.book.title),
        actions: <Widget>[
      IconButton(
      icon: isBookmarked
      ? Icon(
        Icons.bookmark_added,
        color: Colors.white,
      )
          : Icon (
      Icons.bookmark_border,
      color:  Colors.white,
    ),
      onPressed: (){
      setState(() {
      isBookmarked = !isBookmarked;
    }
    );

    final snackBar = SnackBar(
      content: Text( isBookmarked ? "Buku berhasil disimpan ke Bookmark" : "Buku berhasil dihapus dari Bookmark", ),
      backgroundColor: (isBookmarked)?Colors.green : Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    },
      ),
        ],
      ),


      body: SingleChildScrollView(
        padding: EdgeInsets.all(50),
        child: Center(
          child: Column(
            children: [
              Text(widget.book.title, style: TextStyle(fontWeight: FontWeight.bold),),
              Container(
                padding: EdgeInsets.all(10),
                height: 1150 / 3,
                child :  Image.network(widget.book.imageLink),

              ),
              Container(child: Text(widget.book.author),),
              Container(child: Text(widget.book.country),),
              Container(child: Text(widget.book.language),),


    ],
          ),
        ),
      ),floatingActionButton: FloatingActionButton(
      onPressed: (){
        _launchUrl(widget.book.link);
      },
      child: Icon(Icons.link),
    ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}