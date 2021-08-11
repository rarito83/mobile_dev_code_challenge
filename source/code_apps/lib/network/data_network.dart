import 'dart:convert';
import 'package:code_apps/model/data.dart';
import 'package:flutter/services.dart';

class DataNetwork {
  Future<List<Message>> getDataLocal() async {
    final String response = await rootBundle.loadString('assets/message_dataset.json');
    final body = json.decode(response);
    final message = body['data'] as List<dynamic>;
    print("body json >> $message");
    return message.map((value) => Message.fromJsonMsg(value)).toList();
  }
}