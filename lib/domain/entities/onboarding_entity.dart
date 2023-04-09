import 'package:equatable/equatable.dart';

class OnBoardingEntity extends Equatable {
  final String url;
  final String title;

  const OnBoardingEntity({required this.url, required this.title});

  @override
  
  List<Object?> get props => [url, title];
}
