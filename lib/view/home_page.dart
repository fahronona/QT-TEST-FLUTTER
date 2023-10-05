import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qt_test/model/produkModel.dart';
import 'package:qt_test/provider/produk_provider.dart';
import 'package:qt_test/service/service.dart';
import 'package:qt_test/view/add_page.dart';
import 'package:qt_test/view/edit_page.dart';
import 'package:qt_test/widget/tablewidget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var str = ref.watch(stateString);
    var produkData = ref.watch(produkDataProvider(str));
    return Scaffold(
        body: produkData.when(
            data: (produkData) {
              return Padding(
                padding: const EdgeInsets.only(right: 24, left: 24, top: 30),
                child: RefreshIndicator(
                  onRefresh: () async {
                    ref.refresh(produkProvider);
                  },
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Data Produk",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                              width: 140,
                              height: 50,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const AddPage())).then((value) {
                                      ref.read(stateString.notifier).state = "";
                                      ref.refresh(produkDataProvider(""));
                                    });
                                  },
                                  // style: ElevatedButton.styleFrom(
                                  //     backgroundColor: Colors.blue,
                                  //     elevation: 0,
                                  //     shape: RoundedRectangleBorder(
                                  //       borderRadius: BorderRadius.circular(10),
                                  //     ),
                                  //     foregroundColor: Colors.white),
                                  child: const Text("Tambah Data"))),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 25, horizontal: 0),
                        child: TextField(
                          onSubmitted: (e) async {
                            ref.read(stateString.notifier).state = e;
                            ref.refresh(produkDataProvider(str));
                          },
                          textInputAction: TextInputAction.search,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(),
                            labelText: 'Cari data',
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                            columns: headerTable(),
                            rows: (produkData.data ?? [])
                                .map((data) => DataRow(cells: [
                                      DataCell(Text(data.id.toString())),
                                      DataCell(Text(data.namaBarang!)),
                                      DataCell(Text(data.stok.toString())),
                                      DataCell(
                                          Text(data.jumlahTerjual.toString())),
                                      DataCell(Text(data.tanggalTransaksi!)),
                                      DataCell(Text(data.jenisBarang!)),
                                      DataCell(Row(
                                        children: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            EditPage(
                                                              idBarang: data.id
                                                                  .toString(),
                                                              NamaBarang: data
                                                                  .namaBarang!,
                                                              JenisBarang: data
                                                                  .jenisBarang
                                                                  .toString(),
                                                              Jumlahterjual: data
                                                                  .jumlahTerjual
                                                                  .toString(),
                                                              Stok: data.stok
                                                                  .toString(),
                                                              TanggalTransaksi:
                                                                  data.tanggalTransaksi!,
                                                            ))).then((value) {
                                                  ref
                                                      .read(
                                                          stateString.notifier)
                                                      .state = "";
                                                  ref.refresh(
                                                      produkDataProvider(str));
                                                });
                                              },
                                              child: const Text(
                                                "Edit",
                                              )),
                                          TextButton(
                                              onPressed: () {
                                                ref
                                                    .read(produkProvider)
                                                    .deleteProduk(
                                                        data.id.toString())
                                                    .then((value) {
                                                  // ignore: unused_result
                                                  ref
                                                      .read(
                                                          stateString.notifier)
                                                      .state = "";
                                                  ref.refresh(
                                                      produkDataProvider(""));
                                                });
                                              },
                                              child: const Text(
                                                "Delete",
                                                style: TextStyle(
                                                    color: Colors.red),
                                              )),
                                        ],
                                      )),
                                    ]))
                                .toList()),
                      ),
                    ],
                  ),
                ),
              );
            },
            error: (error, s) => Text(error.toString()),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )));
  }
}
