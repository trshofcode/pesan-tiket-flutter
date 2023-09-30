import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:absensi/blocs/tiket.dart';
import 'package:absensi/api/api_response.dart';
import 'package:absensi/models/tiket.dart';
import 'package:absensi/api/api_base_helper.dart';
import 'package:absensi/halaman/tiket/order.dart';
import 'package:absensi/halaman/notificationservice.dart';
import 'package:timezone/data/latest.dart' as tz;

import '../notificationservice.dart';

class TiketHalaman extends StatefulWidget {
  TiketState createState() => TiketState();
}

class TiketState extends State<TiketHalaman> {
  late TiketBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = TiketBloc();
    tz.initializeTimeZones();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tiket"),
      ),
      body: Container(
        padding: EdgeInsets.all(2.0),
        child: RefreshIndicator(
          onRefresh: () => bloc.fetchList(),
          child: StreamBuilder<ApiResponse<List<Tiket>>>(
            stream: bloc.listStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                switch (snapshot.data!.status) {
                  case Status.LOADING:
                    return Text(snapshot.data!.message,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis);
                    break;
                  case Status.COMPLETED:
                    return TiketList(list: snapshot.data!.data);
                    break;
                  case Status.ERROR:
                    return InkWell(
                      child: Text(snapshot.data!.message),
                      onTap: () {
                        bloc.fetchList();
                      },
                    );
                    break;
                }
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}

//LIST TIKET
class TiketList extends StatelessWidget {
  final List<Tiket> list;

  const TiketList({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: true,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(3.0),
          child: Card(
              elevation: 3.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                          return new TiketDetail(
                            id: list[index].id,
                            paket: list[index].paket,
                            harga: list[index].harga,
                          );
                        },
                        fullscreenDialog: true));
                  },
                  child: ListTile(
                    leading: Image(image: AssetImage("assets/icon/tiket.png")),
                    title: Text('${list[index].paket}'),
                    subtitle: Text('${list[index].harga.toString()}'),
                    trailing: Icon(Icons.add_shopping_cart),
                  ))),
        );
      },
    );
  }
}

//DETAIL TIKET
class TiketDetail extends StatelessWidget {
  TiketDetail({key, required this.id, required this.paket, required this.harga})
      : super(key: key);

  ApiBaseHelper api = ApiBaseHelper();
  final _formKey = GlobalKey<FormState>();

  final int id;
  final String paket;
  final int harga;
  String nama = "";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(paket),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              // tambahkan komponen seperti input field disini
              TextFormField(
                initialValue: id.toString(),
                readOnly: true,
                decoration: new InputDecoration(
                    labelText: "ID Paket", icon: Icon(Icons.tag)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'ID Paket tidak boleh kosong';
                  }
                  return null;
                },
              ),

              TextFormField(
                initialValue: paket,
                readOnly: true,
                decoration: new InputDecoration(
                    labelText: "Nama Paket", icon: Icon(Icons.pages)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nama Paket tidak boleh kosong';
                  }
                  return null;
                },
              ),

              TextFormField(
                initialValue: harga.toString(),
                readOnly: true,
                decoration: new InputDecoration(
                    labelText: "Harga Paket", icon: Icon(Icons.attach_money)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Harga Paket tidak boleh kosong';
                  }
                  return null;
                },
              ),

              TextFormField(
                onSaved: (String? value) {
                  nama = value!;
                },
                decoration: new InputDecoration(
                    hintText: "Masukan Nama Lengkap Anda",
                    labelText: "Nama Lengkap",
                    icon: Icon(Icons.people)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),

              RaisedButton(
                child: Text(
                  "Order",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    var order_id = DateTime.now().millisecondsSinceEpoch;
                    Map data = {
                      "payment_type": "bank_transfer",
                      "bank_transfer": {"bank": "permata"},
                      "transaction_details": {
                        "order_id": order_id.toString(),
                        "gross_amount": harga
                      },
                      "tiket_id": id,
                      "nama": nama
                    };
                    var body = json.encode(data);
                    final response = await api.post(
                        "http://192.168.1.12:3000/order/charge", body);

                    Navigator.of(context).push(new MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                          //return new orderDetail(
                          //hasil: response.toString(),
                          //);
                          return new OrderHalaman();
                        },
                        fullscreenDialog: true));
                    NotificationService().showNotification(1, "Order Tiket",
                        "Berhasil order, segera selesaikan pembayaran", 10);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//HASIL ORDER
class orderDetail extends StatelessWidget {
  orderDetail({
    key,
    required this.hasil,
  }) : super(key: key);

  final String hasil;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Text("Hasil Order"),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            child: Text(hasil),
          ),
        ));
  }
}
