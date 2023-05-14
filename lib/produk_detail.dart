import 'package:flutter/material.dart';

class ProdukDetail extends StatefulWidget {
  final String? NamaBarang;
  final int? HargaBarang;
  final int? StokBarang;

  const ProdukDetail({
    Key? key,
    this.NamaBarang,
    this.HargaBarang,
    this.StokBarang,
  }) : super(key: key);

  @override
  _ProdukDetailState createState() => _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Barang'),
      ),
      body: Column(
        children: [
          Text("Nama Barang : ${widget.NamaBarang}"),
          Text("Harga Barang : ${widget.HargaBarang}"),
          Text("Stok Barang : ${widget.StokBarang}")
        ],
      ),
    );
  }
}
