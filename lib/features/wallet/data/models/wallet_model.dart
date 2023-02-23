enum WalletType { mobile, visa, bank }

class WalletModel {
  String code;
  WalletType type;
  String name;
  UserWalletData userData;
  WalletModel(
      {required this.name,
      required this.type,
      required this.code,
      required this.userData});
}

class UserWalletData {
  String? phoneNumber;
  String? creditCardNumber;
  String? creditCardExp;
  String? creditCardCvv;

  UserWalletData(
      {this.phoneNumber,
      this.creditCardNumber,
      this.creditCardExp,
      this.creditCardCvv});
}
