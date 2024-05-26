import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

double progression(
  double payed,
  double amount,
) {
  return payed / amount;
}

double progressioncalc(double progression) {
  if (progression >= 1) {
    return progression - 1;
  } else {
    return progression;
  }
}

int coins(
  double payed,
  double amount,
) {
  return (payed / amount * 100).toInt();
}

double sumamount(
  double oldpay,
  double newpay,
  double amount,
) {
  if (oldpay + newpay > amount) {
    return oldpay;
  } else {
    return oldpay + newpay;
  }
}

int heartscalc(
  double progression,
  int hearts,
) {
  if (progression >= 1) {
    return hearts + 1;
  } else {
    return hearts;
  }
}
