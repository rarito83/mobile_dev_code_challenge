class Message {
  int? id;
  String? body;
  String? attachment;
  String? timestamp;
  String? from;
  String? to;

  Message({
    this.id,
    this.body,
    this.attachment,
    this.timestamp,
    this.from,
    this.to,
  });

  factory Message.fromJsonMsg(Map<String, dynamic> json) => Message(
        id: json["id"],
        body: json["body"] ?? "",
        attachment: json["attachment"] ?? "",
        timestamp: json["timestamp"],
        from: json["from"],
        to: json["to"],
      );

  Map<String, dynamic> toJsonMsg() => {
        "id": id,
        "body": body ?? "",
        "attachment": attachment ?? "",
        "timestamp": timestamp,
        "from": from,
        "to": to,
      };
}
