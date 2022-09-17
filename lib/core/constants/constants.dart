import 'package:flutter/material.dart';

const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Color(0xFF212332);

const defaultPadding = 16.0;

const appBarHeight = 40.0;

const commonIconSize = 20.0;

const commonFontSize = 20.0;

const defaultFontFamily = "SourceHanSansCN";

const nonHero = {"id":-1,"name":"无","alias":"None","squarePortraitPath":"/lol-game-data/assets/v1/champion-icons/-1.png","roles":[]};
















/// api
const String acceptGame = "/lol-matchmaking/v1/ready-check/accept";
const String getGameState = "/lol-gameflow/v1/gameflow-phase";
const String getHeroList = "/lol-game-data/assets/v1/champion-summary.json";
const String getTeamInfo = "/lol-champ-select/v1/session";
const String gameSessionData = "/lol-gameflow/v1/session";
const String champSelectSession = "/lol-champ-select/v1/session";
const String champSelectAction = "/lol-champ-select/v1/session/actions";
const String getOwnedChampions = "/lol-champions/v1/owned-champions-minimal";