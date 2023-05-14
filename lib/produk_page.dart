import 'package:uts_mobile/produk_detail.dart';
import 'package:uts_mobile/produk_form.dart';
import 'package:flutter/material.dart';

class ProdukPage extends StatefulWidget {
  const ProdukPage({Key? key}) : super(key: key);

  @override
  _ProdukPageState createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Produk'),
        actions: [
          GestureDetector(
              // menampilkan icon +
              child: const Icon(Icons.add),
              onTap: () async {
                // berpindah ke halaman ProdukForm

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProdukForm()));
              })
        ],
      ),
      body: ListView(
        children: const [
          // List 1
          ItemProduk(
            NamaBarang: "Coca-cola",
            HargaBarang: 15000,
            StokBarang: 100,
          ),
          ItemProduk(
            NamaBarang: "Sprite",
            HargaBarang: 15000,
            StokBarang: 50,
          ),
        ],
      ),
    );
  }
}

class ItemProduk extends StatelessWidget {
  final String? NamaBarang;
  final int? HargaBarang;
  final int? StokBarang;

  const ItemProduk({
    Key? key,
    this.NamaBarang,
    this.HargaBarang,
    this.StokBarang,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(NamaBarang.toString()),
          subtitle: Text(HargaBarang.toString()),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProdukDetail(
                      NamaBarang: NamaBarang,
                      HargaBarang: HargaBarang,
                      StokBarang: StokBarang,
                    )));
      },
    );
  }
}
