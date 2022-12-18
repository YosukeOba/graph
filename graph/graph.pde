String filename = "graph.txt";

void draw() {
 String[] lines = loadStrings(filename);
 println("there are " + lines.length + " lines");
 for (int i = 0 ; i < lines.length; i++) {
  println(lines[i] + "(by loadStrings)");
 }
 exit();
}
