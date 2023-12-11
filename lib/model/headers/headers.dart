class LearningHeaders {
  final String token;
  
  const LearningHeaders({required this.token});

  Map<String, dynamic> toJson () => {
    "x-apikkey": token,
  };
}