class SignInPageState {
  final String name;
  final bool isEnable;
  final bool isNavigateToHomePage;

  const SignInPageState({
    required this.name,
    required this.isEnable,
    required this.isNavigateToHomePage,
  });

  static SignInPageState get initialState => const SignInPageState(
        name: '',
        isEnable: false,
        isNavigateToHomePage: false,
      );

  SignInPageState clone({
    String? name,
    bool? isEnable,
    bool? isNavigateToHomePage,
  }) {
    return SignInPageState(
      name: name ?? this.name,
      isEnable: isEnable ?? this.isEnable,
      isNavigateToHomePage: isNavigateToHomePage ?? this.isNavigateToHomePage,
    );
  }
}
