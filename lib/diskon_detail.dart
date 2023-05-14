import 'package:flutter/material.dart';

class DiskonDetail extends StatefulWidget {
  final String? NamaBarang;
  final int? HargaBarang;
  final int? Diskon;

  const DiskonDetail({
    Key? key,
    this.NamaBarang,
    this.HargaBarang,
    this.Diskon,
  }) : super(key: key);

  @override
  _DiskonDetailState createState() => _DiskonDetailState();
}

class _DiskonDetailState extends State<DiskonDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Diskon'),
      ),
      body: Column(
        children: [
          Text("Nama Barang : ${widget.NamaBarang}"),
          Text("Harga Barang : ${widget.HargaBarang}"),
          Text("Diskon : ${widget.Diskon}")
        ],
      ),
    );
  }
}
