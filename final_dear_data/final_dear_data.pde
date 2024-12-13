/** Cool Interactive Chess Data Visualizations **/

// Mode selector for different visualizations
int mode = 1; // 1 = Timeline, 2 = Bar Chart, 3 = Heatmap

// Data for graphs
float[] ratings = {950, 965, 980, 970, 985, 995, 1005, 1015, 1020, 1035, 1045, 1060, 1075, 1085, 1095, 1100, 1115, 1120, 1130, 1150, 1165, 1155, 1175, 1200};
String[] openings = {"Italian", "Sicilian", "Queen's Gambit", "London", "Ruy-Lopez", "King's Indian", "Caro-Kann"};
int[] gamesPlayed = {10, 15, 12, 8, 6, 9, 7};
int[] winsOpenings = {7, 3, 8, 6, 5, 5, 4};
int[][] mistakes = new int[30][5]; // Mistakes for heatmap; 30 days, up to 5 games per day

void setup() {
  size(900, 600);
  textFont(createFont("Arial", 14));
  smooth();

  // Generate random data for mistakes and blunders
  for (int i = 0; i < 30; i++) {
    for (int j = 0; j < 5; j++) {
      mistakes[i][j] = (int)random(0, 5); // Random mistakes per game
    }
  }
}

void draw() {
  background(255);

  if (mode == 1) {
    drawTimeline();
  } else if (mode == 2) {
    drawBarChart();
  }

  drawHeader();
}

void drawHeader() {
  fill(0);
  textAlign(CENTER);
  textSize(18);
  text("Chess Data Visualizations", width / 2, 30);
  textSize(12);
  text("Press 1: Timeline | 2: Bar Chart | 3: Heatmap", width / 2, 50);
}

// Timeline Graph
void drawTimeline() {
  textAlign(LEFT);
  textSize(12);
  fill(0);
  text("Timeline: Daily Ratings Progression", 50, 70);

  int days = ratings.length;
  float margin = 100;
  float graphWidth = width - margin * 2;
  float graphHeight = height - margin * 2;
  float dayWidth = graphWidth / (days - 1);

  // Draw axes
  stroke(0);
  line(margin, margin, margin, height - margin); // Y-axis
  line(margin, height - margin, width - margin, height - margin); // X-axis

  // Draw ratings line
  noFill();
  stroke(50, 100, 250);
  beginShape();
  for (int i = 0; i < days; i++) {
    float x = margin + i * dayWidth;
    float y = map(ratings[i], 950, 1200, height - margin, margin);
    vertex(x, y);
    fill(50, 100, 250);
    ellipse(x, y, 8, 8);
  }
  endShape();

  // Tooltip for ratings
  for (int i = 0; i < days; i++) {
    float x = margin + i * dayWidth;
    float y = map(ratings[i], 950, 1200, height - margin, margin);
    if (dist(mouseX, mouseY, x, y) < 10) {
      fill(0);
      fill(255);
      rect(mouseX, mouseY, 150, 60);
      fill(0);
      textAlign(LEFT);
      text("Day " + (i + 1) + "\nPrevious: " + (i > 0 ? ratings[i - 1] : "N/A") + "\nCurrent: " + ratings[i], mouseX + 10, mouseY + 20);
    }
  }
}

// Bar Chart
void drawBarChart() {
  textAlign(LEFT);
  textSize(12);
  fill(0);
  text("Bar Chart: Openings Played and Wins", 50, 70);

  float margin = 100;
  float barWidth = (width - 2 * margin) / openings.length;

  for (int i = 0; i < openings.length; i++) {
    float x = margin + i * barWidth;
    float barHeightGames = map(gamesPlayed[i], 0, max(gamesPlayed), 0, height - 200);
    float barHeightWins = map(winsOpenings[i], 0, max(gamesPlayed), 0, height - 200);

    // Games Played Bar
    if (mouseX > x && mouseX < x + barWidth * 0.4 && mouseY > height - 100 - barHeightGames) {
      fill(80, 250, 80);
    } else {
      fill(100, 200, 100);
    }
    rect(x, height - 100 - barHeightGames, barWidth * 0.4, barHeightGames);

    // Wins Bar
    if (mouseX > x + barWidth * 0.5 && mouseX < x + barWidth * 0.9 && mouseY > height - 100 - barHeightWins) {
      fill(250, 80, 80);
    } else {
      fill(200, 100, 100);
    }
    rect(x + barWidth * 0.5, height - 100 - barHeightWins, barWidth * 0.4, barHeightWins);

    // Labels
    fill(0);
    textAlign(CENTER);
    text(openings[i], x + barWidth * 0.5, height - 80);
  }

  // Tooltip
  for (int i = 0; i < openings.length; i++) {
    float x = margin + i * barWidth;
    if (mouseX > x && mouseX < x + barWidth) {
      fill(0);
      text("Games: " + gamesPlayed[i] + "\nWins: " + winsOpenings[i], mouseX + 10, mouseY - 20);
    }
  }

  // Legend
  fill(100, 200, 100);
  rect(width - 235, height - 40, 20, 20);
  fill(0);
  text("Games Played", width - 170, height - 25);

  fill(200, 100, 100);
  rect(width - 100, height - 40, 20, 20);
  text("Wins", width - 60, height - 25);
}

void keyPressed() {
  if (key == '1') mode = 1;
  if (key == '2') mode = 2;
}
