class RegisterUserModel {
  final _RegisterUser user;
  final _Tokens tokens;
  final int statusCode;
  final String message;

  RegisterUserModel({
    required this.user,
    required this.tokens,
    required this.statusCode,
    required this.message,
  });

  factory RegisterUserModel.fromJson(Map<String, dynamic> json) {
    return RegisterUserModel(
      user: _RegisterUser.fromJson(json['user']),
      tokens: _Tokens.fromJson(json['tokens']),
      statusCode: json['statusCode'],
      message: json['message'],
    );
  }
}

class LoginUserModel {
  final _LoginUser user;
  final _Tokens tokens;
  final int statusCode;
  final String message;
  LoginUserModel({
    required this.user,
    required this.tokens,
    required this.statusCode,
    required this.message,
  });

  factory LoginUserModel.fromJson(Map<String, dynamic> json) {
    return LoginUserModel(
      user: _LoginUser.fromJson(json['user']),
      tokens: _Tokens.fromJson(json['tokens']),
      statusCode: json['statusCode'],
      message: json['message'],
    );
  }
}

class _RegisterUser {
  final int userId;
  final String email;
  final String role;
  final String updatedAt;
  final String createdAt;

  const _RegisterUser({
    required this.email,
    required this.userId,
    required this.role,
    required this.updatedAt,
    required this.createdAt,
  });

  factory _RegisterUser.fromJson(Map<String, dynamic> json) {
    return _RegisterUser(
      email: json['email'],
      userId: json['userId'],
      role: json['role'],
      updatedAt: json['updatedAt'],
      createdAt: json['createdAt'],
    );
  }
}

class _LoginUser {
  final int userId;
  final String email;
  final String role;

  const _LoginUser({
    required this.email,
    required this.userId,
    required this.role,
  });

  factory _LoginUser.fromJson(Map<String, dynamic> json) {
    return _LoginUser(
      email: json['email'],
      userId: json['userId'],
      role: json['role'],
    );
  }
}

class _Tokens {
  final _AccessToken accessToken;
  final _RefreshToken refreshToken;

  _Tokens({required this.accessToken, required this.refreshToken});

  factory _Tokens.fromJson(Map<String, dynamic> json) {
    return _Tokens(
      accessToken: _AccessToken.fromJson(json['access']),
      refreshToken: _RefreshToken.fromJson(json['refresh']),
    );
  }
}

class _AccessToken {
  final String token;
  final String expires;

  _AccessToken({required this.token, required this.expires});

  factory _AccessToken.fromJson(Map<String, dynamic> json) {
    return _AccessToken(
      token: json['token'],
      expires: json['expires'],
    );
  }
}

class _RefreshToken {
  final String token;
  final String expires;

  _RefreshToken({required this.token, required this.expires});

  factory _RefreshToken.fromJson(Map<String, dynamic> json) {
    return _RefreshToken(
      token: json['token'],
      expires: json['expires'],
    );
  }
}
