import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class WebState extends Equatable {
  @override
  List<Object> get props => [];
}

class BrowserState extends WebState {
  final String url;

  BrowserState(this.url) : super();

  @override
  List<Object> get props => [url];

}

class ErrorState extends WebState {
  final String message;

  ErrorState(this.message) : super();

  @override
  List<Object> get props => [message];
}

class LoadingState extends WebState {
  LoadingState() : super();
}



