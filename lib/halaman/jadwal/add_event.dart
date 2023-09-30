import 'dart:convert';

import 'package:absensi/models/event.dart';
import 'package:flutter/material.dart';
import 'package:absensi/responses/event.dart';
import 'package:absensi/api/api_base_helper.dart';
import 'package:absensi/api/api_response.dart';
import 'package:absensi/halaman/jadwal/jadwal-1.dart';

class AddEventPage extends StatefulWidget {
  @override
  _AddEventPageState createState() => _AddEventPageState();

  final Event note;
  const AddEventPage({required Key key, required this.note}) : super(key: key);
}

class _AddEventPageState extends State<AddEventPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  late TextEditingController judul;
  late TextEditingController deskripsi;
  late DateTime tanggal;
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  late bool processing;
  ApiBaseHelper api = ApiBaseHelper();

  @override
  void initState() {
    super.initState();
    judul = TextEditingController(
        text: widget.note != null ? widget.note.judul : "");
    deskripsi = TextEditingController(
        text: widget.note != null ? widget.note.deskripsi : "");
    tanggal = DateTime.now();
    processing = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note != null ? "Edit Note" : "Add note"),
      ),
      key: _key,
      body: Form(
        key: _formKey,
        child: Container(
          alignment: Alignment.center,
          child: ListView(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: TextFormField(
                  controller: judul,
                  validator: (value) =>
                      (value!.isEmpty) ? "Please Enter title" : null,
                  style: style,
                  decoration: InputDecoration(
                      labelText: "Title",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: TextFormField(
                  controller: deskripsi,
                  minLines: 3,
                  maxLines: 5,
                  validator: (value) =>
                      (value!.isEmpty) ? "Please Enter deskripsi" : null,
                  style: style,
                  decoration: InputDecoration(
                      labelText: "deskripsi",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              const SizedBox(height: 10.0),
              ListTile(
                title: Text("Date (YYYY-MM-DD)"),
                subtitle:
                    Text("${tanggal.year} - ${tanggal.month} - ${tanggal.day}"),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: tanggal,
                      firstDate: DateTime(tanggal.year - 5),
                      lastDate: DateTime(tanggal.year + 5));
                  if (picked != null) {
                    setState(() {
                      tanggal = picked;
                    });
                  }
                },
              ),
              SizedBox(height: 10.0),
              processing
                  ? Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(30.0),
                        color: Theme.of(context).primaryColor,
                        child: MaterialButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                processing = true;
                              });
                              Map data = {
                                "judul": judul.text,
                                "deskripsi": deskripsi.text,
                                "tanggal": widget.note.tanggal
                              };
                              var body = json.encode(data);
                              final response = await api.post(
                                  "http://192.168.1.12:3000/order/charge",
                                  body);
                            }
                            Navigator.pop(context);
                            setState(() {
                              processing = false;
                            });
                          },
                          child: Text(
                            "Save",
                            style: style.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    judul.dispose();
    deskripsi.dispose();
    super.dispose();
  }
}
