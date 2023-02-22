String? required(String? value) {
  if (value?.isEmpty ?? true) return 'Veuillez renseigner ce champ';
  return null;
}

String? validateEmail(String? value) {
  var regExp = RegExp(
      r"^[A-Z0-9_!#$%&'*+/=?`{|}~^-]+(?:\.[A-Z0-9_!#$%&'*+/=?`{|}~^-]+)*@[A-Z0-9-]+(?:\.[A-Z0-9-]+)*$");
  bool match = regExp.hasMatch(value ?? '');
  if (!match) return "Votre email n'est pas valide.";
  return null;
}
