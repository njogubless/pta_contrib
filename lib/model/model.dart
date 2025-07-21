
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';



part 'model.g.dart'; 
part 'model.freezed.dart';  

@freezed
class Project with _$Project { 

  const factory Project({
    required String id, 
    required String title, 
    required String description, 
    required double targetAmount,
    required double currentAmount, 
    required String imageUrl, 
  }) = _Project; 


  factory Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);
  
  @override
  // TODO: implement currentAmount
  double get currentAmount => throw UnimplementedError();
  
  @override
  // TODO: implement description
  String get description => throw UnimplementedError();
  
  @override
  // TODO: implement id
  String get id => throw UnimplementedError();
  
  @override
  // TODO: implement imageUrl
  String get imageUrl => throw UnimplementedError();
  
  @override
  // TODO: implement targetAmount
  double get targetAmount => throw UnimplementedError();
  
  @override
  // TODO: implement title
  String get title => throw UnimplementedError();
  
  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

 
}