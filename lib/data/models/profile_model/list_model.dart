import 'package:flutter/material.dart';
import 'package:go_smart_task/core/utils/assets.dart';

List<ListItemModel> profileData = [
  ListItemModel(title: 'Edit Profile', imagePath: AppAssets.editProfile,),
  ListItemModel(title: 'My Points', imagePath: AppAssets.points, ),
  ListItemModel(title: 'My Notifications', imagePath: AppAssets.not,),
  ListItemModel(title: 'Manage Family', imagePath: AppAssets.family, ),
  ListItemModel(title: 'Livery Setting', imagePath: AppAssets.book,),
  ListItemModel(title: 'Fill Medical Report', imagePath: AppAssets.medicalReport, ),
  ListItemModel(title: 'Fill Club Application', imagePath: AppAssets.clipboard, ),
  ListItemModel(title: 'Billing Details', imagePath: AppAssets.bill, ),
  ListItemModel(title: 'Tutorial Guides', imagePath: AppAssets.idea, ),
  ListItemModel(title: 'Information', imagePath: AppAssets.info,),
  ListItemModel(title: 'Contact US', imagePath: AppAssets.contact, ),
];

class ListItemModel {
  final String title;
  final String imagePath;

  ListItemModel({
    required this.title,
    required this.imagePath,
  });
}
