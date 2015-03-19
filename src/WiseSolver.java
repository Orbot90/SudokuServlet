import java.io.IOException;
import java.util.*;
/**
* Created by IntelliJ IDEA.
* User: Юрий
* Date: 01.02.15
* Time: 20:46
* To change this template use File | Settings | File Templates.
*/
public class WiseSolver {
static Cell[][] sudokuArr;
static boolean isSolved;
static String ls = System.getProperty("line.separator");
static Stack<Cell[][]> backUpStack = new Stack<Cell[][]>();
static boolean sameNumbers = false;
static String[] answer;
static String[] doSolve(int[][] sudoku) throws IOException, CloneNotSupportedException {
sudokuArr = new Cell[9][9];
answer = new String[11];
for(int i = 0; i < 11; i++) {
answer[i] = "";
}
initSudoku(sudoku);
solve();
if(isSolved) {
printSudoku();
} else answer[0] = "Not Solved :(";
return answer;
}
public static void initSudoku(int[][] sudoku) throws IOException {
for(int i = 0; i < 9; i++)
for(int j = 0; j < 9; j++) {
Cell cell = new Cell(sudoku[i][j]);
cell.setSectorNumber((3 * (i/3)) + (j/3));
sudokuArr[i][j] = cell;
}
}
public static void printSudoku() {
for(int i = 0, k = 0; i < 9; i++, k++) {
if(i == 3 || i == 6) {
answer[k] = "|_*_||_*_||_*_||_*_||_*_||_*_||_*_||_*_||_*_||_*_||_*_|";
k++;
}
for(int j = 0; j < 9; j++) {
if(j == 3 || j == 6)
answer[k] += "|_*_|";
answer[k] += "|_" + ((sudokuArr[i][j].getValue() instanceof Integer) ? sudokuArr[i][j].getValue() : "_") + "_|";
}
}
}
public static boolean check(int line, int col, Integer num) { //Check lines and columns
boolean somethingDone = false;
for(int i = 0; i < 9; i++) {
if(sudokuArr[line][i].check(num))
somethingDone = true;
if(sudokuArr[i][col].check(num))
somethingDone = true;
if((num.equals(sudokuArr[line][i].getValue()) && (i != col)) || (num.equals(sudokuArr[i][col].getValue()) && i != line) ) {
sameNumbers = true;
}
}
for(int i = 0; i < 9; i++) { //Check sector
for(int j = 0; j < 9; j++) {
if(sudokuArr[i][j].getSectorNumber() == ((3 * (line/3)) + (col/3)))
if(sudokuArr[i][j].check(num))
somethingDone = true;
if(num.equals(sudokuArr[i][j].getValue()) && (i != line) && (j != col) && (sudokuArr[i][j].getSectorNumber() == ((3 * (line/3)) + (col/3)))) {
sameNumbers = true;
}
}
}
return somethingDone;
}
public static boolean checkForUnique(int line, int col, TreeSet<Integer> set) {
boolean isUnique; //Find out if there is any unique number in line\column\sector int this set
boolean somethingDone = false;
Iterator<Integer> iterator = set.iterator();
while(iterator.hasNext()) {
isUnique = true;
Integer uniqueNum = iterator.next();
for(int i = 0; i < 9; i++) {
if(sudokuArr[line][i].contains(uniqueNum) || sudokuArr[i][col].contains(uniqueNum)) {
isUnique = false;
break;
}
}
if(isUnique) {
sectorCheck: for(int i = 0; i < 9; i++) { //Check sector
for(int j = 0; j < 9; j++) {
if(sudokuArr[i][j].contains(uniqueNum) && sudokuArr[i][j].getSectorNumber() == ((3 * (line/3)) + (col/3))) {
isUnique = false;
break sectorCheck;
}
}
}
if(isUnique) sudokuArr[line][col].setUnique(uniqueNum);
somethingDone = true;
}
}
return somethingDone;
}
public static boolean guess(int numberOfGuesses) {
int numberOfPossibleGuesses;
for(int i = 0; i < 9; i++)
for(int j = 0; j < 9; j++) {
if(sudokuArr[i][j].getValue() instanceof TreeSet) {
TreeSet<Integer> set = (TreeSet) sudokuArr[i][j].getValue();
numberOfPossibleGuesses = set.size();
if(numberOfGuesses == numberOfPossibleGuesses)
return false;
Iterator<Integer> iterator = set.iterator();
for(int k = 0; k < numberOfGuesses; k++)
iterator.next();
sudokuArr[i][j].setUnique(iterator.next());
return true;
}
}
return false;
}
public static void solve() throws CloneNotSupportedException {
int numberOfGuesses = 0;
boolean nothingDone;
isSolved = false;
while(!isSolved) {
isSolved = true; //Maybe it's already full of the right numbers?
nothingDone = true;
for (int i = 0; i < 9; i++) {
for(int j = 0; j < 9; j++) {
if(sudokuArr[i][j].getFound() && !sudokuArr[i][j].getChecked()) {
if(check(i, j, (Integer)sudokuArr[i][j].getValue())) //check line i and column j and the sector if wasn't checked
nothingDone = false;
sudokuArr[i][j].setCheckedTrue();
} else if (!sudokuArr[i][j].getFound()) {
isSolved = false;
if(checkForUnique(i, j, (TreeSet<Integer>)sudokuArr[i][j].getValue()))
nothingDone = false;
}
}
}
if(sameNumbers) {
sudokuArr = backUpStack.pop();
sameNumbers = false;
isSolved = false;
return;
}
if(nothingDone && !isSolved) {
Cell[][] backUp = new Cell[9][9];
for (int i = 0; i < 9; i++)
for(int j = 0; j < 9; j++) {
backUp[i][j] = sudokuArr[i][j].clone();
}
boolean guessed = guess(numberOfGuesses);
if(!guessed) {
sudokuArr = backUpStack.pop();
isSolved = false;
return;
} else {
backUpStack.push(backUp);
numberOfGuesses++;
solve();
}
}
}
}
}