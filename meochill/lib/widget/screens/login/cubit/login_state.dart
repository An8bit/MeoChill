import 'package:meochill/common/enum/load_status.dart';
import 'package:meochill/models/account.dart'; // Đảm bảo đường dẫn này chính xác

import '../../../../models/account.dart';

class LoginState {
  final LoadStatus loadStatus;
  final Account account;
  final String errorMessage;

  LoginState({
    this.loadStatus = LoadStatus.Init,
    required this.account,
    this.errorMessage = '',
  });

  LoginState.init()
      : loadStatus = LoadStatus.Init,
        account = Account(), // Giả sử Account có constructor mặc định
        errorMessage = '';

  LoginState copyWith({
    LoadStatus? loadStatus,
    Account? account,
    String? errorMessage,
  }) {
    return LoginState(
      loadStatus: loadStatus ?? this.loadStatus,
      account: account ?? this.account,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  String toString() => 'LoginState(loadStatus: $loadStatus, account: $account, errorMessage: $errorMessage)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is LoginState &&
      other.loadStatus == loadStatus &&
      other.account == account &&
      other.errorMessage == errorMessage;
  }

  @override
  int get hashCode => loadStatus.hashCode ^ account.hashCode ^ errorMessage.hashCode;
}
