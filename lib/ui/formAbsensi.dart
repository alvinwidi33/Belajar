import 'package:flutter/material.dart';

import '../models/absensi.dart';

class FormAbsensi extends StatefulWidget {
  final Absensi? absensi;
  FormAbsensi({super.key, this.absensi});

  @override
  State<FormAbsensi> createState() => _FormAbsensiState(this.absensi);
}

class _FormAbsensiState extends State<FormAbsensi> {
  Absensi? absensi;
  _FormAbsensiState(this.absensi);
  TextEditingController namaController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (absensi != null) {
      namaController.text = absensi!.nama;
      statusController.text = absensi!.status_hadir;
    }
    return Scaffold(
      appBar: AppBar(title: Text("Form Absensi")),
      body: Padding(
        padding: EdgeInsets.only(top: 15, left: 15, right: 10),
        child: ListView(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: TextField(
                  controller: namaController,
                  decoration: InputDecoration(labelText: "Nama"),
                  onChanged: (value) {},
                )),
            Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: TextField(
                  controller: statusController,
                  decoration: InputDecoration(labelText: "Status"),
                  onChanged: (value) {},
                )),
            Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: ElevatedButton(
                      child: Text('Saved'),
                      onPressed: () {
                        if (absensi == null) {
                          absensi = Absensi(
                              namaController.text, statusController.text);
                        } else {
                          absensi!.nama = namaController.text;
                          absensi!.status_hadir = statusController.text;
                        }
                        Navigator.pop(context, absensi);
                      },
                    )),
                    Container(
                      width: 10,
                    ),
                    Expanded(
                        child: ElevatedButton(
                      child: Text("Kembali"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
