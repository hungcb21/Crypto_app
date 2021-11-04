import 'package:equatable/equatable.dart';

abstract class ListCoinsEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchListCoins extends ListCoinsEvent{}