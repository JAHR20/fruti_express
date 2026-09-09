
import 'package:freezed_annotation/freezed_annotation.dart';

enum DeliveryMethod { 
  @JsonValue('delivery')
  homeDelivery,
  
  @JsonValue('pick_up')
  pickUp,
}