import 'dart:convert';

TickEntity tickModelFromJson(String str) =>
    TickEntity.fromJson(json.decode(str));

class TickEntity {
  TickEntity({
    required this.echoReq,
    required this.msgType,
    required this.subscription,
    required this.tick,
  });

  EchoReq echoReq;
  String msgType;
  Subscription subscription;
  Tick tick;

  factory TickEntity.fromJson(Map<String, dynamic> json) => TickEntity(
        echoReq: EchoReq.fromJson(json["echo_req"]),
        msgType: json["msg_type"],
        subscription: Subscription.fromJson(json["subscription"]),
        tick: Tick.fromJson(json["tick"]),
      );
}

class EchoReq {
  EchoReq({
    required this.subscribe,
    required this.ticks,
  });

  int subscribe;
  String ticks;

  factory EchoReq.fromJson(Map<String, dynamic> json) => EchoReq(
        subscribe: json["subscribe"],
        ticks: json["ticks"],
      );
}

class Subscription {
  Subscription({
    required this.id,
  });

  String id;

  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        id: json["id"],
      );
}

class Tick {
  Tick({
    required this.ask,
    required this.bid,
    required this.epoch,
    required this.id,
    required this.pipSize,
    required this.quote,
    required this.symbol,
  });

  double ask;
  double bid;
  int epoch;
  String id;
  int pipSize;
  double quote;
  String symbol;

  factory Tick.fromJson(Map<String, dynamic> json) => Tick(
        ask: json["ask"].toDouble(),
        bid: json["bid"].toDouble(),
        epoch: json["epoch"],
        id: json["id"],
        pipSize: json["pip_size"],
        quote: json["quote"].toDouble(),
        symbol: json["symbol"],
      );
}
