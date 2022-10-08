import 'dart:convert';

import 'package:price_tracker/features/price/domain/entities/tick_entity.dart';

TickModel tickModelFromJson(String str) => TickModel.fromJson(json.decode(str));

class TickModel extends TickEntity {
  TickModel({
    required echoReq,
    required msgType,
    required subscription,
    required tick,
  }) : super(
            echoReq: echoReq,
            msgType: msgType,
            subscription: subscription,
            tick: tick);
  factory TickModel.fromJson(Map<String, dynamic> json) => TickModel(
        echoReq: EchoReq.fromJson(json["echo_req"]),
        msgType: json["msg_type"],
        subscription: Subscription.fromJson(json["subscription"]),
        tick: Tick.fromJson(json["tick"]),
      );
}

