import 'package:alzcare/features/Community/data/datasource/community_remote_data_source.dart';
import 'package:alzcare/features/Community/data/repository/community_repository.dart';
import 'package:alzcare/features/Community/domain/base_repository/community_base_repository.dart';
import 'package:alzcare/features/Community/domain/usecase/create_comment_use_case.dart';
import 'package:alzcare/features/Community/domain/usecase/create_post_use_case.dart';
import 'package:alzcare/features/Community/domain/usecase/delete_all_notification_use_case.dart';
import 'package:alzcare/features/Community/domain/usecase/delete_post_use_case.dart';
import 'package:alzcare/features/Community/domain/usecase/get_all_comments_use_case.dart';
import 'package:alzcare/features/Community/domain/usecase/get_all_message_use_case.dart';
import 'package:alzcare/features/Community/domain/usecase/get_all_myposts_use_case.dart';
import 'package:alzcare/features/Community/domain/usecase/get_all_notification_use_case.dart';
import 'package:alzcare/features/Community/domain/usecase/get_all_posts_use_case.dart';
import 'package:alzcare/features/Community/domain/usecase/post_message_use_case.dart';
import 'package:alzcare/features/Community/domain/usecase/toggle_comment_likes_use_case.dart';
import 'package:alzcare/features/Community/domain/usecase/toggle_post_likes_use_case.dart';
import 'package:alzcare/features/Community/presentation/controller/community_cubit.dart';
import 'package:alzcare/features/Medication%20Reminder/data/datasource/medication_reminder_remote_data_source.dart';
import 'package:alzcare/features/Medication%20Reminder/data/repository/medication_reminder_repository.dart';
import 'package:alzcare/features/Medication%20Reminder/domain/usecase/delete_medication_reminder_use_case.dart';
import 'package:alzcare/features/Medication%20Reminder/domain/usecase/get_all_medication_reminder_use_case.dart';
import 'package:alzcare/features/Medication%20Reminder/domain/usecase/create_medication_reminder_use_case.dart';
import 'package:alzcare/features/Medication%20Reminder/presentation/controller/medication_reminder_cubit.dart';
import 'package:alzcare/features/authentication/data/datasource/auth_data_source.dart';
import 'package:alzcare/features/authentication/data/repository/auth_repositroy.dart';
import 'package:alzcare/features/authentication/domain/base_repository/auth%20base%20repository.dart';
import 'package:alzcare/features/authentication/domain/usecase/caregiver_register_use_case.dart';
import 'package:alzcare/features/authentication/domain/usecase/forget_password_use_case.dart';
import 'package:alzcare/features/authentication/domain/usecase/get_current_user_use_case.dart';
import 'package:alzcare/features/authentication/domain/usecase/login_use_case.dart';
import 'package:alzcare/features/authentication/domain/usecase/patient_register_use_case.dart';
import 'package:alzcare/features/authentication/domain/usecase/reset_password.dart';
import 'package:alzcare/features/authentication/domain/usecase/verify_code_use_case.dart';
import 'package:alzcare/features/authentication/presentation/controller/auth_cubit.dart';
import 'package:alzcare/features/health_care/data/datasource/remote_data_source.dart';
import 'package:alzcare/features/health_care/domain/base_repository/base%20repository.dart';
import 'package:alzcare/features/health_care/domain/usecase/delete_medical_details_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/delete_prescription_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/delete_tests_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/get_all_medical_details_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/get_all_prescription_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/get_all_tests_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/get_prescription_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/get_test_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/create_medical_details_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/create_prescription_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/create_test_use_case.dart';
import 'package:alzcare/features/health_care/presentation/controller/prescription_cubit.dart';
import 'package:alzcare/features/home_data/presentation/controller/home_cubit.dart';
import 'package:alzcare/features/health_care/presentation/controller/medical_details_cubit.dart';
import 'package:alzcare/features/health_care/presentation/controller/test_cubit.dart';
import 'package:alzcare/features/profile/data/datasource/profile_remote_data_source.dart';
import 'package:alzcare/features/profile/data/repository/repository.dart';
import 'package:alzcare/features/profile/domain/base_repository/profile_base_repository.dart';
import 'package:alzcare/features/profile/domain/usecase/change_password_use_case.dart';
import 'package:alzcare/features/profile/domain/usecase/change_profile_data_use_case.dart';
import 'package:alzcare/features/profile/presentation/controller/profile_cubit.dart';
import 'package:get_it/get_it.dart';
import '../../features/Medication Reminder/domain/base_repository/medication_reminder_base_repository.dart';
import '../../features/health_care/data/repository/repositroy.dart';
final sl=GetIt.instance;
class ServicesLocator
{
  void init() {
    //ToDo: Authentication
    // ToDo: Cubit
    sl.registerFactory(() => AuthCubit(sl(),sl(),sl(),sl(),sl(),sl(),sl()));
    sl.registerFactory(() => HomeCubit());
    // ToDo: Use Cases
    sl.registerLazySingleton(() => PatientRegisterUseCase(sl()));
    sl.registerLazySingleton(() => CareGiverRegisterUseCase(sl()));
    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerLazySingleton(() => ForgetPasswordUseCase(sl()));
    sl.registerLazySingleton(() => ResetPasswordUseCase(sl()));
    sl.registerLazySingleton(() => VerifyCodeUseCase(sl()));
    sl.registerLazySingleton(() => GetCurrentUserUseCase(sl()));
    // ToDo: Repository
    sl.registerLazySingleton<AuthBaseRepository>(() => AuthRepository(sl()));
    // ToDo: Data source
    sl.registerLazySingleton<AuthBaseRemoteDataSource>(() => AuthRemoteDataSource());
    //ToDo: Home Data
    //ToDo: 1: health care
    //ToDo: cubit MedicalDetails
    sl.registerFactory(() => MedicalDetailsCubit(sl(),sl(),sl()));
    //ToDo: Use Cases
    sl.registerLazySingleton(() => PostMedicalDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetMedicalDetailsUseCase(sl()));
    sl.registerLazySingleton(() =>DeleteMedicalDetailsUseCase(sl()));
// ToDo: Test
    sl.registerFactory(() => TestCubit(sl(),sl(),sl(),sl()));
    //ToDo: Use Cases
    sl.registerLazySingleton(() =>PostTestUseCase(sl()));
    sl.registerLazySingleton(() =>GetAllTestsUseCase(sl()));
    sl.registerLazySingleton(() =>GetTestUseCase(sl()));
    sl.registerLazySingleton(() =>DeleteTestsUseCase(sl()));
    //ToDo: Use Prescription
    sl.registerFactory(() => PrescriptionCubit(sl(),sl(),sl(),sl()));
    sl.registerLazySingleton(() =>PostPrescriptionUseCase(sl()));
    sl.registerLazySingleton(() =>GetAllPrescriptionUseCase(sl()));
    sl.registerLazySingleton(() =>DeletePrescriptionUseCase(sl()));
    sl.registerLazySingleton(() =>GetPrescriptionUseCase(sl()));
//ToDo: Use  Repository health care
    sl.registerLazySingleton<BaseRepository>(() => RepositoryHealthCare(sl()));
    // ToDo: Data source health care
    sl.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());
    //ToDo: cubit Profile
    sl.registerFactory(() => ProfileCubit(sl(),sl()));
    //ToDo: usecase Profile
    sl.registerLazySingleton(() =>ChangeprofiledataUseCase(sl()));
    sl.registerLazySingleton(() =>ChangePasswordUseCase(sl()));

//ToDo: Use  Repository Profile
    sl.registerLazySingleton<ProfileBaseRepository>(() => Repository(sl()));
    // ToDo: Data source Profile
    sl.registerLazySingleton<BaseProfileRemoteDataSource>(() => ProfileRemoteDataSource());
    //ToDo:Medication Reminder


    //ToDo: cubit MedicationReminder

    sl.registerFactory(() => MedicationReminderCubit(sl(),sl(),sl()));

    //ToDo: usecase MedicationReminder
    sl.registerLazySingleton(() =>PostMedicationReminderUseCase(sl()));
    sl.registerLazySingleton(() =>GetAllMedicationReminderUseCase(sl()));
    sl.registerLazySingleton(() =>DeleteMedicationReminderUseCase(sl()));

//ToDo: Use  Repository MedicationReminder

    sl.registerLazySingleton<MedicationReminderBaseRepository>(() => MedicationReminderRepository(sl()));

    // ToDo: Data source MedicationReminder

    sl.registerLazySingleton<BaseRemoteDataSourceMedicationReminder>(() => RemoteDataSourceMedicationReminder());
    //ToDo: community
    //ToDo: cubit community
    sl.registerFactory(() => CommunityCubit(sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl()));
    //ToDo: usecase community
    sl.registerLazySingleton(() =>CreatePostUseCase(sl()));
    sl.registerLazySingleton(() =>DelelteAllNotificationUseCase(sl()));
    sl.registerLazySingleton(() =>GetAllNotificationUseCase(sl()));
    sl.registerLazySingleton(() =>GetAllPostUsecase(sl()));
    sl.registerLazySingleton(() =>CreateCommentUseCase(sl()));
    sl.registerLazySingleton(() =>GetAllCommentUseCase(sl()));
    sl.registerLazySingleton(() =>TogglePostLikesUseCase(sl()));
    sl.registerLazySingleton(() =>ToggleCommentLikesUseCase(sl()));
    sl.registerLazySingleton(() =>PostMessageUseCase(sl()));
    sl.registerLazySingleton(() =>GetAlMessagesChatUseCase(sl()));
    sl.registerLazySingleton(() =>GetAllMyPostUsecase(sl()));
    sl.registerLazySingleton(() =>DeletePostUsecase(sl()));
//ToDo: Use  Repository community
    sl.registerLazySingleton<BaseRepositoryCommunity>(() => CommunityRepository(sl()));
    // ToDo: Data source community
    sl.registerLazySingleton<BaseRemoteDataSourceCommunity>(() => CommunityRemoteDataSource());




  }
}