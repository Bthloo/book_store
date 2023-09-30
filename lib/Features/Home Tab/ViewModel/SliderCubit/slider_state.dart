part of 'slider_cubit.dart';

@immutable
abstract class SliderState {}

class SliderInitial extends SliderState {}

class SliderLoading extends SliderState {}

class SliderSuccess extends SliderState {
  SliderResponse sliderResponse;
  SliderSuccess(this.sliderResponse);
}

class SliderError extends SliderState {
  String message;
  SliderError(this.message);
}
