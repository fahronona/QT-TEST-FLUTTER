import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:qt_test/provider/produk_provider.dart';
import 'package:qt_test/service/service.dart';

class AddPage extends ConsumerWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController NamaBarangCtrl = TextEditingController();
    final TextEditingController StokCtrl = TextEditingController();
    final TextEditingController JumlahTerjualCtrl = TextEditingController();
    final TextEditingController TanggalTransaksiCtrl = TextEditingController();
    final TextEditingController JenisBarangCtrl = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: NamaBarangCtrl,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nama Barang',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: StokCtrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Stok',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: JumlahTerjualCtrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Jumlah Terjual',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: TanggalTransaksiCtrl,
              decoration: InputDecoration(
                hintText: "format tanggal dd-mm-yyy",
                border: OutlineInputBorder(),
                labelText: 'Tanggal Transaksi',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: JenisBarangCtrl,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Jenis Barang',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      ref
                          .read(produkProvider)
                          .createData(
                              namaBarang: NamaBarangCtrl.text,
                              stok: StokCtrl.text,
                              jumlah_terjual: JumlahTerjualCtrl.text,
                              tanggal_transaksi: TanggalTransaksiCtrl.text,
                              jenisBarang: JenisBarangCtrl.text)
                          .then((value) {
                        if (value == "Success") {
                          Navigator.pop(context);
                        }
                      });
                    },
                    child: Text("Submit")))
          ],
        ),
      ),
    );
  }
}
