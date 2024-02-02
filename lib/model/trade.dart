import 'dart:convert';


  List<Trade> tradeListFromJson(String str) =>
      List<Trade>.from(json.decode(str).map((x) => Trade.fromJson(x)));

class Trade {
  double? currentPrice;
  String? comment;
  int? digits;
  int? login;
  double? openPrice;
  String? openTime;
  double? profit;
  double? sl;
  double? swaps;
  String? symbol;
  double? tp;
  int? ticket;
  int? type;
  double? volume;

  Trade({
    this.currentPrice,
    this.comment,
    this.digits,
    this.login,
    this.openPrice,
    this.openTime,
    this.profit,
    this.sl,
    this.swaps,
    this.symbol,
    this.tp,
    this.ticket,
    this.type,
    this.volume,
  });

  factory Trade.fromJson(Map<String, dynamic> json) {
    return Trade(
      currentPrice: json['currentPrice'] as double?,
      comment: json['comment'] as String?,
      digits: json['digits'] as int?,
      login: json['login'] as int?,
      openPrice: json['openPrice'] as double?,
      openTime: json['openTime'] as String?,
      profit: json['profit'] as double?,
      sl: json['sl'] as double?,
      swaps: json['swaps'] as double?,
      symbol: json['symbol'] as String?,
      tp: json['tp'] as double?,
      ticket: json['ticket'] as int?,
      type: json['type'] as int?,
      volume: json['volume'] as double?,
    );
  }

}
