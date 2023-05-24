library settings_screen;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro_app/common/constants.dart';
import 'package:pomodoro_app/ui/settings_screen.dart/models/settings_items.dart';
import 'package:pomodoro_app/ui/settings_screen.dart/models/settings_model.dart';
import 'package:pomodoro_app/ui/settings_screen.dart/models/settings_type.dart';

import '../../di/get_it_manager.dart';
import '../../common/palette.dart';
import '../../provider/settings_provider.dart';
import 'models/settings_list_item.dart';

part 'cubit/settings_screen_cubit.dart';
part 'widgets/settings_screen_widget.dart';
