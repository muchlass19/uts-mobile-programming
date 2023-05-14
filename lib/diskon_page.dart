import 'package:uts_mobile/diskon_detail.dart';
import 'package:uts_mobile/diskon_form.dart';
import 'package:uts_mobile/login.dart';
import 'package:uts_mobile/home.dart';
import 'package:flutter/material.dart';

class DiskonPage extends StatefulWidget {
  const DiskonPage({Key? key}) : super(key: key);

  @override
  _DiskonPageState createState() => _DiskonPageState();
}

class _DiskonPageState extends State<DiskonPage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (_selectedIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    } else if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DiskonPage()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diskon Page'),
        actions: [
          GestureDetector(
            // menampilkan icon +
            child: const Icon(Icons.add),
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DiskonForm(),
                ),
              );
            },
          )
        ],
      ),
      body: ListView(
        children: const [
          // List 1
          ItemProduk(
            NamaBarang: "Coca-cola",
            HargaBarang: 15000,
            Diskon: 5000,
          ),
          ItemProduk(
            NamaBarang: "Sprite",
            HargaBarang: 15000,
            Diskon: 0,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.trolley),
            label: 'Produk',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.discount),
            label: 'Diskon',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
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
  final int? Diskon;

  const ItemProduk({
    Key? key,
    this.NamaBarang,
    this.HargaBarang,
    this.Diskon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(NamaBarang.toString()),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Harga Asli: ${HargaBarang.toString()}'),
              Text('Diskon: ${Diskon.toString()}'),
              Text('Harga Diskon: ${(HargaBarang! - Diskon!).toString()}'),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DiskonDetail(
              NamaBarang: NamaBarang,
              HargaBarang: HargaBarang,
              Diskon: Diskon,
            ),
          ),
        );
      },
    );
  }
}
