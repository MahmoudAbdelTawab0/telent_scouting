part of 'skills_cubit.dart';

@immutable
abstract class SkillsState {}

class SkillsInitial extends SkillsState {}
class SkillsLoading extends SkillsState {}
class SkillsNetworkFailed extends SkillsState {}
class SkillsDataSuccessed extends SkillsState {
  final Skils skillData;

  SkillsDataSuccessed( {required this.skillData});

}
class SkillsDataFailed extends SkillsState {
  final statusCode ;
  SkillsDataFailed(int? this.statusCode);
}