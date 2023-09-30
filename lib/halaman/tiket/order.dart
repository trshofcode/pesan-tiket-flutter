import 'package:flutter/material.dart';
import 'package:absensi/blocs/order.dart';
import 'package:absensi/api/api_response.dart';
import 'package:absensi/models/order.dart';
import 'package:flutter/services.dart';

class OrderHalaman extends StatefulWidget {
  OrderState createState() => OrderState();
}

class OrderState extends State<OrderHalaman> {
  late OrderBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = OrderBloc();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order"),
      ),
      body: Container(
        padding: EdgeInsets.all(2.0),
        child: RefreshIndicator(
          onRefresh: () => bloc.fetchList(),
          child: StreamBuilder<ApiResponse<List<Order>>>(
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
                    return OrderList(list: snapshot.data!.data);
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

//LIST Order
class OrderList extends StatelessWidget {
  final List<Order> list;
  const OrderList({Key? key, required this.list}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: true,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: 1,
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
                        return new OrderDetail(
                          no_rek: list[index].no_rek,
                        );
                      },
                      fullscreenDialog: true));
                },
                child: ListTile(
                  title: Text('Tiket Konser Pamungkas'),
                  subtitle: Text('Presale 1'),
                  trailing: Text('Pending'),
                )),
          ),
        );
      },
    );
  }
}

class OrderDetail extends StatelessWidget {
  OrderDetail({key, required this.no_rek}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final String no_rek;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Bayar"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.centerRight,
                children: <Widget>[
                  TextFormField(
                    initialValue: no_rek,
                    readOnly: true,
                    decoration: new InputDecoration(
                        labelText: "No. Rek",
                        icon: Icon(Icons.credit_card_outlined)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'No.Rek tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.content_copy_outlined, color: Colors.blue),
                    onPressed: () {
                      Clipboard.setData(ClipboardData());
                    },
                  ),
                ],
              ),
              Text('*Silahkan lakukan pembayaran melalui Bank Permata'),
            ],
          ),
        ),
      ),
    );
  }
}
