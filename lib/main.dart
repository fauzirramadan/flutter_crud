import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store_app_localapi/add_data.dart';
import 'package:store_app_localapi/detail.dart';
import 'package:store_app_localapi/model/res_get_data.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = false;
  List<Data> listData = [];

  Future<ResGetData?> getData() async {
    try {
      setState(() {
        isLoading = true;
      });
      http.Response res = await http
          .get(Uri.parse("http://192.168.100.14/my_store/getData.php"));
      List<Data>? data = resGetDataFromJson(res.body).data;
      setState(() {
        isLoading = false;
        listData = data ?? [];
        log('data berita $listData');
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: const Text("My Store"),
      ),
      body: ListView.builder(
          itemCount: listData.length,
          itemBuilder: (context, index) {
            Data data = listData[index];
            return Container(
                child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => DetailScreen(data)));
              },
              child: Card(
                  child: ListTile(
                title: Text("${data.itemName}"),
                leading: const Icon(Icons.widgets),
                trailing: Text("${data.stock}"),
              )),
            ));
          }),
      bottomNavigationBar: Container(
          padding: const EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width * 0.8,
          child: MaterialButton(
            height: 45,
            color: Colors.blue,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const AddData()));
            },
            child: const Text("Add Data"),
          )),
    );
  }
}
