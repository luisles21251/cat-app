
enum EnvMode {
  production,
  qA,
  sandBox,
}



class Env{
  late EnvMode m;

  static final Env _instance = Env._internal();

  Env._internal();

  factory Env(EnvMode mode) {
    _instance.m = mode;
    return _instance;
  }


  static EnvMode get mode => _instance.m;

  static const String _apiProduction = "https://api.thecatapi.com/v1";
  static const String _apiQA = "https://api.thecatapi.com/v1";
  static const String _apiSandBox = "https://api.thecatapi.com/v1";



  String get api {
    switch (m) {
      case EnvMode.production:
        return _apiProduction;
      case EnvMode.qA:
        return _apiQA;
      case EnvMode.sandBox:
        return _apiSandBox;

    }
  }

}