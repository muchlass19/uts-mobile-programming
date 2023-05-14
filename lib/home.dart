import 'package:uts_mobile/login.dart';
import 'package:uts_mobile/produk_detail.dart';
import 'package:uts_mobile/produk_form.dart';
import 'package:uts_mobile/diskon_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (_selectedIndex == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Home()));
    } else if (_selectedIndex == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const DiskonPage()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Login()));
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.trolley), label: 'Produk'),
          BottomNavigationBarItem(icon: Icon(Icons.discount), label: 'Diskon'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Logout'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class ItemProduk extends StatelessWidget {
  final String? NamaBarang;
  final int? HargaBarang;
  final int? StokBarang;

  const ItemProduk(
      {Key? key, this.NamaBarang, this.HargaBarang, this.StokBarang})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(NamaBarang.toString()),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(HargaBarang.toString()),
              Text('Stok: ${StokBarang.toString()}')
            ],
          ),
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
