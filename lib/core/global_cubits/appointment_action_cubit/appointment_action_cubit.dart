

import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:doctor_app/core/global_cubits/appointment_action_cubit/appointment_action_state.dart';
import 'package:doctor_app/core/repositories/appointment_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../generated/l10n.dart';
import '../../database/api/dio_factory.dart';

class AppointmentActionCubit extends Cubit<AppointmentActionState> {
  AppointmentActionCubit(this._appointmentRepo) : super(AppointmentActionInitial());

    final AppointmentRepo _appointmentRepo;

  void acceptAppointment({required String appointmentId}) async {
    emit(AcceptAppointmentLoading(appointmentId: appointmentId));
    final result =
        await _appointmentRepo.acceptAppointment(appointmentId: appointmentId);

    result.fold(
      (apiErrorModel) => AcceptAppointmentFailure(apiErrorModel: apiErrorModel,appointmentId: appointmentId),
      (message) => emit(AcceptAppointmentSuccess(message: message,appointmentId: appointmentId)),
    );
  }

  void declineAppointment({required String appointmentId}) async {
    emit(DeclineAppointmentLoading(appointmentId: appointmentId));
    final result =
        await _appointmentRepo.declineAppointment(appointmentId: appointmentId);

    result.fold(
      (apiErrorModel) =>
          emit(DeclineAppointmentFailure(apiErrorModel: apiErrorModel,appointmentId: appointmentId)),
      (message) => emit(DeclineAppointmentSuccess(message: message,appointmentId: appointmentId)),
    );
  }
  

  
  Future<void> downloadAndOpenFile({required String url}) async {
    emit(FileDownloadLoading(appointmentId: ''));
      const String url =
        'https://drive.usercontent.google.com/download?id=12uPQADfVgwxajKAMUmta9Zzs_zb_gjSy&export=download&authuser=0&confirm=t&uuid=72c4fd48-345f-493d-98f6-b2a51a0b570a&at=ALoNOgl6z30XGQlvNTQsARCj_sL6:1748242676189';
    const String filename = 'analysis_document.pdf';

    try {
      final permissionStatus = await _requestStoragePermission();

      if (!permissionStatus.isGranted) {
        if (permissionStatus.isPermanentlyDenied) {
          // emit(PermissionPermanentlyDenied());
          await openAppSettings();
          return;
        }
        emit(FileDownloadError(S.current.storagePermissionDenied));
        return;
      }

      final dir = await _getDownloadDirectory();
      if (dir == null) {
        emit(FileDownloadError(S.current.downloadDirectoryNotFound));
        return;
      }

      final path = '${dir.path}/$filename';
      final file = File(path);

      // Delete existing file if it exists
      if (await file.exists()) {
        await file.delete();
      }


      // Download the file
      await DioFactory.getDio().download(url, path);

      // Make file visible in file manager (especially for iOS)
      if (Platform.isIOS) {
        await OpenFile.open(path);
      }

      emit(FileDownloadSuccess(appointmentId: ''));
    } catch (e) {
      emit(FileDownloadError(e.toString()));
    }
  }

  Future<PermissionStatus> _requestStoragePermission() async {
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;

      if (androidInfo.version.sdkInt <= 28) {
        // Android 9 (Pie) and below
        return await Permission.storage.request();
      } else if (androidInfo.version.sdkInt <= 32) {
        // Android 10-12
        return await Permission.manageExternalStorage.request();
      } else {
        // Android 13+
        return await Permission.photos.request();
      }
    } else {
      // iOS - no storage permission needed for app directories
      return PermissionStatus.granted;
    }
  }

  Future<Directory?> _getDownloadDirectory() async {
    if (Platform.isAndroid) {
      // Try Downloads directory first
      try {
        final downloadsDir = Directory('/storage/emulated/0/Download');
        if (await downloadsDir.exists()) {
          return downloadsDir;
        }
      } catch (e) {
        print('Could not access Downloads directory: $e');
      }

      // Fallback to external storage directory
      return await getExternalStorageDirectory();
    } else if (Platform.isIOS) {
      return await getApplicationDocumentsDirectory();
    }
    return null;
  }
}
