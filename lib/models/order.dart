class Order {
  //atribut
  late int status_code;
  late String status_message;
  late int transaction_id;
  late int order_id;
  late int gross_amount;
  late String transaction_status;
  late String no_rek;

  //metod kontruktor
  Order(
      {required this.status_code,
      required this.status_message,
      required this.transaction_id,
      required this.order_id,
      required this.gross_amount,
      required this.transaction_status,
      required this.no_rek});

  Order.fromJson(Map<String, dynamic> json) {
    status_code = json['status_code'];
    status_message = json['status_message'];
    transaction_id = json['transaction_id'];
    order_id = json['order_id'];
    gross_amount = json['gross_amount'];
    transaction_status = json['transaction_status'];
    no_rek = json['no_rek'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.status_code;
    data['status_message'] = this.status_message;
    data['transaction_id'] = this.transaction_id;
    data['order_id'] = this.order_id;
    data['gross_amount'] = this.gross_amount;
    data['transaction_status'] = this.transaction_status;
    data['no_rek'] = this.no_rek;
    return data;
  }
}
