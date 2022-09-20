import 'package:flutter/material.dart';

/// Details Screen Dimens
///
/// MovieCover
const double backCover_h = 300;
const double frontCoverP_l = 104;
const double frontCoverP_t = 140;
const double frontCoverP_r = 104;
const double frontCoverP_b = 20;

///
/// MovieDetailsSwitcher
const double movieDetailsSW_h = 36;

///
/// MovieStars
const double bigStarContainer_h = 30;
const double smallStarContainer_h = 14;
const double bigStarSize = 20;
const double smallStarSize = 14;

///
/// CastAndCrewList
const double castAndCrewList_h = 300;
const double textButton_h = 18;

///
/// PersonImage
const double personImageBorder_r = personImage_h / 2;
const double personImage_w = 50;
const double personImage_h = 50;

///
/// Calculate dimension
double details_button_w(BuildContext context, {int buttonsCount = 3}) =>
    MediaQuery.of(context).size.width / buttonsCount - padding_24;

double fiftyFivePercentsOfWidth(BuildContext context) =>
    MediaQuery.of(context).size.width * 0.55;

double thirtyPercentsOfWidth(BuildContext context) =>
    MediaQuery.of(context).size.width * 0.30;

/// border radius
const double border_w_1 = 1;
const double border_r_16 = 16;

/// Details Screen Paddings
const double padding_2 = 2;
const double padding_4 = 4;
const double padding_8 = 8;
const double padding_10 = 10;
const double padding_15 = 15;
const double padding_16 = 16;
const double padding_18 = 18;
const double padding_20 = 20;
const double padding_24 = 24;
const double padding_30 = 30;

///
/// Shadow
const double shadow_h_24 = 24;
const double shadow_h_14 = 14;
const double shadow_w_24 = 24;
