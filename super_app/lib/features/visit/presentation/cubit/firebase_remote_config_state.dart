import 'package:equatable/equatable.dart';

// sealec class = bu sınıfın alt sınıfları sadece bu sınıf içinde tanımlanabilir
// switch bloğu yazarken flutter tüm dutumları kapsadığından bu şekilde emin olur
// equatable ise karşılaştırma yapar. Eğer hata mesajı halen "internet yok" ise tekrar aynı hata geldiğinde tekrar durum yayınlamaz
sealed class FirebaseRemoteConfigState extends Equatable {
  const FirebaseRemoteConfigState();

  @override
  List<Object?> get props => [];
}

final class FirebaseRemoteConfigInitial extends FirebaseRemoteConfigState {}

final class FirebaseRemoteConfigLoading extends FirebaseRemoteConfigState {}

final class FirebaseRemoteConfigLoaded extends FirebaseRemoteConfigState {
  final FirebaseRemoteConfigLoaded firebaseRemoteConfig;

  const FirebaseRemoteConfigLoaded(this.firebaseRemoteConfig);

  @override
  List<Object?> get props => [firebaseRemoteConfig];
}

final class FirebaseRemoteConfigError extends FirebaseRemoteConfigState {
  final String message;

  const FirebaseRemoteConfigError(this.message);

  @override
  List<Object?> get props => [message];
}
