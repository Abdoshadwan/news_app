abstract class NewsStates {}

class InitialState extends NewsStates {}

class navigationscreens extends NewsStates {}

class SettingsScreen extends NewsStates {}

class BusinessLoadingState extends NewsStates{}

class BusinessNews extends NewsStates {}

class BusinessNewsError extends NewsStates {
  final String error;
  BusinessNewsError(this.error);
}

class SportsLoadingState extends NewsStates{}

class SportsNews extends NewsStates {}

class SportsNewsError extends NewsStates {
  final String error;
  SportsNewsError(this.error);
}

class ScienceLoadingState extends NewsStates{}

class ScienceNews extends NewsStates {}

class ScienceNewsError extends NewsStates {
  final String error;
  ScienceNewsError(this.error);
}
class changemodestate extends NewsStates{}

class SearchLoadingState extends NewsStates{}

class SearchNews extends NewsStates {}

class SearchNewsError extends NewsStates {
  final String error;
  SearchNewsError(this.error);
}