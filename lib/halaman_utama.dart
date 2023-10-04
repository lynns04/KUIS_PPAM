import 'package:flutter/material.dart';
import 'package:lat3/halaman_detail.dart';
import 'package:lat3/data_buku.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Data Buku'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: listBuku.length,
          itemBuilder: (context, index) {
            final DataBuku book=listBuku[index];
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => HalamanDetail (book: book)));
              },
              child: Card(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  // width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 200,
                        width: MediaQuery.of(context).size.width / 3,
                          child: Image.network(
                              book.imageLink,
                                  fit: BoxFit.fill,

                          )
                      ),
                      SizedBox(width: 20),
                      Text(book.title),

                    ],
                  ),
                )

              ),
            );
          },
      ),
    );
  }
}
