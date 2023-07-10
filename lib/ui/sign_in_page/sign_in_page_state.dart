class SignInPageState {
  final String name;
  final bool isEnable;

  const SignInPageState({
    required this.name,
    required this.isEnable,
  });

  static SignInPageState get initialState => const SignInPageState(
        name: '',
        isEnable: false,
      );

  SignInPageState clone({
    String? name,
    bool? isEnable,
  }) {
    return SignInPageState(
      name: name ?? this.name,
      isEnable: isEnable ?? this.isEnable,
    );
  }
}
