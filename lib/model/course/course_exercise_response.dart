class CourseExercisesResponse {
    int status;
    String message;
    List<CourseExercisesData> data;

    CourseExercisesResponse({
        required this.status,
        required this.message,
        required this.data,
    });

    factory CourseExercisesResponse.fromJson(Map<String, dynamic> json) => CourseExercisesResponse(
        status: json["status"],
        message: json["message"],
        data: List<CourseExercisesData>.from(json["data"].map((x) => CourseExercisesData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class CourseExercisesData {
    String exerciseId;
    String exerciseTitle;
    String accessType;
    String icon;
    String exerciseUserStatus;
    String jumlahSoal;
    int jumlahDone;

    CourseExercisesData({
        required this.exerciseId,
        required this.exerciseTitle,
        required this.accessType,
        required this.icon,
        required this.exerciseUserStatus,
        required this.jumlahSoal,
        required this.jumlahDone,
    });

    factory CourseExercisesData.fromJson(Map<String, dynamic> json) => CourseExercisesData(
        exerciseId: json["exercise_id"],
        exerciseTitle: json["exercise_title"],
        accessType: json["access_type"],
        icon: json["icon"],
        exerciseUserStatus: json["exercise_user_status"],
        jumlahSoal: json["jumlah_soal"],
        jumlahDone: json["jumlah_done"],
    );

    Map<String, dynamic> toJson() => {
        "exercise_id": exerciseId,
        "exercise_title": exerciseTitle,
        "access_type": accessType,
        "icon": icon,
        "exercise_user_status": exerciseUserStatus,
        "jumlah_soal": jumlahSoal,
        "jumlah_done": jumlahDone,
    };
}
