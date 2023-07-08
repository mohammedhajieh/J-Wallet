class CoinPrica {
  // ignore: prefer_typing_uninitialized_variables
  var coinprice;
  String? coinname;
  String? coinId;
  String? image;
  String? fullName;
  String? nickName;
  CoinPrica(
      {this.coinprice,
      this.coinname,
      this.coinId,
      this.image,
      this.fullName,
      this.nickName});

  CoinPrica.fromJson(Map<String, dynamic> json) {
    coinprice = json['coinprice'];
    coinname = json['coinname'];
    coinId = json['coinId'];
    image = json['image'];
    fullName = json['FullName'];
    nickName = json['nickName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coinprice'] = coinprice;
    data['coinname'] = coinname;
    data['coinId'] = coinId;
    data['image'] = image;
    data['FullName'] = fullName;
    data['nickName'] = nickName;
    return data;
  }
}

List<CoinPrica> coinList = [];
