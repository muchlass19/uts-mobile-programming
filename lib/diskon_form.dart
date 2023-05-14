import 'package:uts_mobile/diskon_detail.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DiskonForm extends StatefulWidget {
  const DiskonForm({Key? key}) : super(key: key);

  @override
  _DiskonFormState createState() => _DiskonFormState();
}

class _DiskonFormState extends State<DiskonForm> {
  final _NamaBarangTextboxController = TextEditingController();
  final _HargaBarangTextboxController = TextEditingController();
  final _DiskonTextboxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Produk'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            _textboxNamaBarang(),
            _textboxHargaBarang(),
            _textboxDiskon(),
            _tombolSimpan(),
          ],
        ),
      ),
    );
  }

  _textboxNamaBarang() {
    return TextField(
      decoration: const InputDecoration(
          labelText: "Nama Barang", contentPadding: EdgeInsets.all(12)),
      controller: _NamaBarangTextboxController,
    );
  }

  _textboxHargaBarang() {
    return TextField(
      decoration: const InputDecoration(
          labelText: "Harga Barang", contentPadding: EdgeInsets.all(12)),
      keyboardType: TextInputType.number,
      controller: _HargaBarangTextboxController,
    );
  }

  _textboxDiskon() {
    return TextField(
      decoration: const InputDecoration(
          labelText: "Diskon", contentPadding: EdgeInsets.all(12)),
      keyboardType: TextInputType.number,
      controller: _DiskonTextboxController,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () {
          if (_NamaBarangTextboxController.text.isEmpty ||
              _HargaBarangTextboxController.text.isEmpty ||
              _DiskonTextboxController.text.isEmpty) {
            Fluttertoast.showToast(
                msg: "Mohon lengkapi data!",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.TOP,
                backgroundColor: Colors.red,
                textColor: Colors.white);
            return;
          }

          if (_NamaBarangTextboxController.text.length < 3) {
            Fluttertoast.showToast(
                msg: "Nama Barang minimal 3 karakter",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.TOP,
                backgroundColor: Colors.red,
                textColor: Colors.white);
            return;
          }

          String NamaBarang = _NamaBarangTextboxController.text;
          int HargaBarang = int.parse(_HargaBarangTextboxController.text);
          int Diskon = int.parse(_DiskonTextboxController.text);

          // pindah ke halaman Produk Detail dan mengirim data
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DiskonDetail(
                    NamaBarang: NamaBarang,
                    HargaBarang: HargaBarang,
                    Diskon: Diskon,
                  )));
        },
        child: const Text('Simpan'));
  }
}
