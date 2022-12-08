import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'todo.dart';
import 'package:tugaspertemuan7/list_page.dart';

class DetailPage extends StatefulWidget {
  DetailPage({super.key,required this.todo});

  final Todo todo;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: 300,
          child: Text("Detail")),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30,left: 30),
                child: Container(
                  width: double.infinity,
                  child: Text(widget.todo.kegiatan,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Container(
                  width: double.infinity,
                  child: Text(widget.todo.waktu,style: TextStyle(fontWeight: FontWeight.w300),)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30,top: 5),
                child: Container(
                  width: double.infinity,
                  child: Text(widget.todo.prioritas,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),)),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  width: double.infinity,
                  child: Text(widget.todo.keterangan)),
              ),
            ],
          ),
          ),
    );
  }
}