class UserProfile {
  String? address;
  double? balance;
  String? city;
  String? country;
  int? currency;
  int? currentTradesCount;
  double? currentTradesVolume;
  double? equity;
  double? freeMargin;
  bool? isAnyOpenTrades;
  bool? isSwapFree;
  int? leverage;
  String? name;
  String? phone;
  int? totalTradesCount;
  double? totalTradesVolume;
  int? type;
  int? verificationLevel;
  String? zipCode;

  UserProfile({
    this.address,
    this.balance,
    this.city,
    this.country,
    this.currency,
    this.currentTradesCount,
    this.currentTradesVolume,
    this.equity,
    this.freeMargin,
    this.isAnyOpenTrades,
    this.isSwapFree,
    this.leverage,
    this.name,
    this.phone,
    this.totalTradesCount,
    this.totalTradesVolume,
    this.type,
    this.verificationLevel,
    this.zipCode,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      address: json['address'] as String?,
      balance: (json['balance'] as num?)?.toDouble(),
      city: json['city'] as String?,
      country: json['country'] as String?,
      currency: json['currency'] as int?,
      currentTradesCount: json['currentTradesCount'] as int?,
      currentTradesVolume: (json['currentTradesVolume'] as num?)?.toDouble(),
      equity: (json['equity'] as num?)?.toDouble(),
      freeMargin: (json['freeMargin'] as num?)?.toDouble(),
      isAnyOpenTrades: json['isAnyOpenTrades'] as bool?,
      isSwapFree: json['isSwapFree'] as bool?,
      leverage: json['leverage'] as int?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      totalTradesCount: json['totalTradesCount'] as int?,
      totalTradesVolume: (json['totalTradesVolume'] as num?)?.toDouble(),
      type: json['type'] as int?,
      verificationLevel: json['verificationLevel'] as int?,
      zipCode: json['zipCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'balance': balance,
      'city': city,
      'country': country,
      'currency': currency,
      'currentTradesCount': currentTradesCount,
      'currentTradesVolume': currentTradesVolume,
      'equity': equity,
      'freeMargin': freeMargin,
      'isAnyOpenTrades': isAnyOpenTrades,
      'isSwapFree': isSwapFree,
      'leverage': leverage,
      'name': name,
      'phone': phone,
      'totalTradesCount': totalTradesCount,
      'totalTradesVolume': totalTradesVolume,
      'type': type,
      'verificationLevel': verificationLevel,
      'zipCode': zipCode,
    };
  }
}
