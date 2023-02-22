enum WalletType { mobile, visa, bank }

class WalletModel {
  String code;
  WalletType type;
  String name;
  WalletModel({required this.name, required this.type, required this.code});
}
