import '../../model/coins.dart';
import 'package:equatable/equatable.dart';

abstract class ListCoinsState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ListCoinsEmpty extends ListCoinsState {}

class ListCoinsLoading extends ListCoinsState {}

class ListCoinsLoaded extends ListCoinsState {
  final List<Coins>? listCoins;
  ListCoinsLoaded({this.listCoins});

}

class ListCoinsLoadFail extends ListCoinsState {
  String? error;

  ListCoinsLoadFail({this.error});
}
