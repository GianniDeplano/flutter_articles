import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class FetchNewsEvent extends NewsEvent {
  final String topic;

  FetchNewsEvent({@required this.topic}) : assert(topic != null);
  @override
  List<Object> get props => [topic];
}

class RefreshNewsEvent extends NewsEvent {
  final String topic;

  RefreshNewsEvent({@required this.topic}) : assert(topic != null);
  @override
  List<Object> get props => [topic];
}

class ResetNewsEvent extends NewsEvent {
  @override
  List<Object> get props => null;
}

class ErrorNewsEvent extends NewsEvent {
  @override
  List<Object> get props => null;
}
