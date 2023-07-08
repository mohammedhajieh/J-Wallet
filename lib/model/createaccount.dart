class CreateAccount {
  String? password;
  List<String>? secretPhrase;

  CreateAccount({this.password, this.secretPhrase});

  CreateAccount.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    secretPhrase = json['secretPhrase'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['password'] = password;
    data['secretPhrase'] = secretPhrase;
    return data;
  }
}