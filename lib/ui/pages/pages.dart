import 'dart:io';

import 'package:flutix_new/bloc/blocs.dart';
import 'package:flutix_new/models/models.dart' as models;
import 'package:flutix_new/models/models.dart';
import 'package:flutix_new/services/services.dart';
import 'package:flutix_new/shared/shared.dart';
import 'package:flutix_new/ui/widgets/widgets.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:random_string/random_string.dart';
import 'package:flutix_new/extensions/extensions.dart';
part 'sign_in_page.dart';
part 'wrapper.dart';
part 'main_page.dart';
part 'splash_page.dart';
part 'movie_page.dart';
part 'sign_up_page.dart';
part 'preferences_page.dart';
part 'account_confirmation_page.dart';
part 'movie_detail_page.dart';
part 'select_schedule_page.dart';
part 'select_seat_page.dart';
part 'checkout_page.dart';
part 'success_page.dart';
part 'ticket_page.dart';
part 'ticket_detail_page.dart';
part 'profile_page.dart';
part 'topup_page.dart';
part 'wallet_page.dart';
part 'edit_profile_page.dart';
