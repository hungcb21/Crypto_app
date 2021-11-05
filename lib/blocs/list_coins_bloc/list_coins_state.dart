import 'package:crypto_test/model/coins.dart';
import 'package:equatable/equatable.dart';

abstract class ListCoinsState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ListCoinsEmpty extends ListCoinsState {}

class ListCoinsLoading extends ListCoinsState {}

class ListCoinsLoaded extends ListCoinsState {
  final List<Coins> listCoins;
  final bool hasReachedEnd;

   ListCoinsLoaded(this.listCoins, this.hasReachedEnd);

  @override
  // TODO: implement props
  List<Object> get props => [listCoins, hasReachedEnd];

  ListCoinsLoaded cloneWith({List<Coins>? listCoins, bool? hasReachedEnd}) {
    return ListCoinsLoaded(
        listCoins ?? this.listCoins, hasReachedEnd ?? this.hasReachedEnd);
  }
}

class ListCoinsLoadFail extends ListCoinsState {
  String error;

  ListCoinsLoadFail(this.error);
}
