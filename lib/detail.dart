import 'package:flutter/material.dart';
import 'package:store_app_localapi/edit_data.dart';
import 'package:store_app_localapi/model/res_get_data.dart';

class DetailScreen extends StatefulWidget {
  final Data? data;
  const DetailScreen(this.data, {Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text("${widget.data?.itemName}")),
      body: Center(
          child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.6,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("code: ${widget.data?.itemCode}"),
              Text("price: ${widget.data?.price}"),
              Text("stock: ${widget.data?.stock}"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => EditData(
                                    data: widget.data,
                                  )));
                    },
                    child: Text("EDIT"),
                    color: Colors.green,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: Text("DELETE"),
                    color: Colors.red,
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
