import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:telent_scouting/Screens/skills/passing_screen.dart';
import 'package:telent_scouting/models/skills_model.dart';
import 'package:telent_scouting/repo/skill_repo.dart';

part 'skills_state.dart';

class SkillsCubit extends Cubit<SkillsState> {
  SkillsCubit() : super(SkillsInitial());

   late  Response<dynamic> skillRepo  ;
   void getData ()async{
     try {

       emit(SkillsLoading());
       skillRepo = (await SkillRepo().getSkill()) as Response;
final skillData = Skils.fromJson(skillRepo.data);
       emit(SkillsDataSuccessed(skillData:skillData));
     }  catch (e) {
       emit(SkillsDataFailed(
skillRepo.statusCode
       ));
     }

   }
   void getRepo (){

   }
}
