import 'package:flutter/material.dart';

List<DataColumn> headerTable() {
  return const <DataColumn>[
    DataColumn(
      label: Expanded(
        child: Text(
          'No',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    ),
    DataColumn(
      label: Expanded(
        child: Text(
          'Nama Barang',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    ),
    DataColumn(
      label: Expanded(
        child: Text(
          'stok',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    ),
    DataColumn(
      label: Expanded(
        child: Text(
          'Jumlah Terjual',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    ),
    DataColumn(
      label: Expanded(
        child: Text(
          'Tanggal Transaksi',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    ),
    DataColumn(
      label: Expanded(
        child: Text(
          'Jenis Barang',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    ),
    DataColumn(
      label: Expanded(
        child: Text(
          'Action',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    ),
  ];
}
