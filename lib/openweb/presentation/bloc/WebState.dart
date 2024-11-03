import 'package:equatable/equatable.dart';


class WebState extends Equatable {
  final String url;
  const WebState(this.url);

  @override
  List<Object> get props => [url];
}



