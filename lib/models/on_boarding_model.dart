import 'package:equatable/equatable.dart';

class OnBoardingModel extends Equatable {
  final String url;
  final String title;

  const OnBoardingModel({required this.url, required this.title});

  @override
  List<Object> get props => [url, title];
}
