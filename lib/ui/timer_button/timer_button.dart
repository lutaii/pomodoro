library timer_button;

import 'dart:math' as math;

import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro_app/common/constants.dart';
import 'package:pomodoro_app/provider/settings_provider.dart';
import 'package:pomodoro_app/ui/settings_screen.dart/models/settings_model.dart';

import '../../di/get_it_manager.dart';
import '../../common/palette.dart';
import 'model/timer_type.dart';

part 'bloc/pomodoro_bloc.dart';
part 'widgets/circular_progress_indicator.dart';
part 'widgets/circular_progress_indicator_painet.dart';
part 'widgets/pomodoro_widget.dart';
part 'bloc/pomodoro_state.dart';
part 'bloc/pomodoro_event.dart';
