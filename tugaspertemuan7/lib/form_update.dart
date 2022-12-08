import 'package:flutter/material.dart';
import 'package:tugaspertemuan7/todo.dart';
import 'package:tugaspertemuan7/db_provider.dart';
import 'package:provider/provider.dart';

class UpdatePage extends StatefulWidget {
  final Todo? todo;

  const UpdatePage({Key? key, this.todo}) : super(key: key);

  @override
  State<UpdatePage> createState() => _FormPageState();
}

class _FormPageState extends State<UpdatePage> {
  final TextEditingController _kegiatanController = TextEditingController();
  final TextEditingController _waktuController = TextEditingController();
  final TextEditingController _prioritasController = TextEditingController();
  final TextEditingController _keteranganController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(widget.todo!.id);
    _kegiatanController.text = widget.todo!.kegiatan;
    _waktuController.text = widget.todo!.waktu;
    _prioritasController.text = widget.todo!.prioritas;
    _keteranganController.text = widget.todo!.keterangan;

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit TODO"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.close,
                size: 20,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: _kegiatanController,
                  decoration: InputDecoration(
                    label: const Text('Nama Kegiatan'),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _waktuController,
                  decoration: InputDecoration(
                    label: const Text('Waktu Kegiatan'),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _prioritasController,
                  decoration: InputDecoration(
                    label: const Text('Prioritas'),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _keteranganController,
                  minLines: 6,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    label: const Text('Keterangan'),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: FloatingActionButton.extended(
                      onPressed: () async {
                        final todo = Todo(
                            id: widget.todo!.id!,
                            kegiatan: _kegiatanController.text,
                            waktu: _waktuController.text,
                            prioritas: _prioritasController.text,
                            keterangan: _keteranganController.text);
                        Provider.of<DbProvider>(context, listen: false)
                            .updateTodos(todo);
                        Navigator.pop(context);
                      },
                      label: Text("Buat TODO"),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ))
              ]),
        ),
      )),
    );
  }
}
