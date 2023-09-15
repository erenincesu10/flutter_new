part of 'home_cubit.dart';

enum HomeStatus {
  init,
  loading,
  success,
  error,
}

class HomeState extends Equatable {
  final HomeStatus status;
  final int counter;

  const HomeState({
    required this.status,
    required this.counter,
  });

  //başlangıç değerlerini tanımladıktan sonra değiştirmek için copywith ile değiştireceğiz
  HomeState copyWith({
    HomeStatus? status,
    int? counter,
  }) {
    return HomeState(
      status: status ?? this.status,
      counter: counter ?? this.counter,
    );
  }

  @override
  List<Object> get props => [
        status,
        counter,
      ];
}
