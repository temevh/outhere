class Task {
  final String name;
  final String category;
  final String path;

  Task({required this.name, required this.category, required this.path});
}

List<Task> tasks = [
  Task(
      name: "Talk to x new people",
      category: "Sociability",
      path: "assets/images/talking.png"),
  //Task(name: "Say hi to a stranger", category: "Sociability"),
  //Task(name: "Stare at a wall for x mins", category: "Concentration"),
  Task(
      name: "Read a book for x minutes",
      category: "Learning",
      path: "assets/images/reading.png"),
  // Add more tasks here
];
