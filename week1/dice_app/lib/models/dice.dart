import 'dart:html';
import 'dart:math';

class Dice{
  static const int minDie = 1;
  static const int maxDie = 6;
  bool equalDistr = false;
  String mode = "Equal distribution of two dice";
  var die = List<int>.generate(2, (int index) => minDie,growable: true);
  int numberOfThrows = 0;
  List <int> sumStatistics = List<int>.generate(maxDie*2-minDie*2+1, (int index) => 0,growable: true);
  List dieStatistics = [
    for (var row = 0; row < maxDie-minDie+1; row += 1)
      [for (var column = 0; column < maxDie-minDie+1; column += 1)
        0],
  ];
  Map oldStatus = {
    "equalDistrOld": false,
    "modeOld":"Equal distribution of two dice",
    "dieOld[0]":0,
    "dieOld[1]":0,
    "numberOfThrowsOld":0,
    "sumStatisticsOld[0]": 0,
    "sumStatisticsOld[1]": 0,
    "sumStatisticsOld[2]": 0,
    "sumStatisticsOld[3]": 0,
    "sumStatisticsOld[4]": 0,
    "sumStatisticsOld[5]": 0,
    "sumStatisticsOld[6]": 0,
    "sumStatisticsOld[7]": 0,
    "sumStatisticsOld[8]": 0,
    "sumStatisticsOld[9]": 0,
    "sumStatisticsOld[10]": 0,
    "dieStatisticsOld[0][0]": 0,
    "dieStatisticsOld[0][1]": 0,
    "dieStatisticsOld[0][2]": 0,
    "dieStatisticsOld[0][3]": 0,
    "dieStatisticsOld[0][4]": 0,
    "dieStatisticsOld[0][5]": 0,
    "dieStatisticsOld[1][0]": 0,
    "dieStatisticsOld[1][1]": 0,
    "dieStatisticsOld[1][2]": 0,
    "dieStatisticsOld[1][3]": 0,
    "dieStatisticsOld[1][4]": 0,
    "dieStatisticsOld[1][5]": 0,
    "dieStatisticsOld[2][0]": 0,
    "dieStatisticsOld[2][1]": 0,
    "dieStatisticsOld[2][2]": 0,
    "dieStatisticsOld[2][3]": 0,
    "dieStatisticsOld[2][4]": 0,
    "dieStatisticsOld[2][5]": 0,
    "dieStatisticsOld[3][0]": 0,
    "dieStatisticsOld[3][1]": 0,
    "dieStatisticsOld[3][2]": 0,
    "dieStatisticsOld[3][3]": 0,
    "dieStatisticsOld[3][4]": 0,
    "dieStatisticsOld[3][5]": 0,
    "dieStatisticsOld[4][0]": 0,
    "dieStatisticsOld[4][1]": 0,
    "dieStatisticsOld[4][2]": 0,
    "dieStatisticsOld[4][3]": 0,
    "dieStatisticsOld[4][4]": 0,
    "dieStatisticsOld[4][5]": 0,
    "dieStatisticsOld[5][0]": 0,
    "dieStatisticsOld[5][1]": 0,
    "dieStatisticsOld[5][2]": 0,
    "dieStatisticsOld[5][3]": 0,
    "dieStatisticsOld[5][4]": 0,
    "dieStatisticsOld[5][5]": 0,
    //     "dieStatisticsOld" : [
    //   for (var row = 0; row < maxDie-minDie+1; row += 1)
    //     [for (var column = 0; column < maxDie-minDie+1; column += 1)
    //       0],
    // ]
  };
  Dice();
  // function to show different mode description when clicking the switch widget to change the mode
  void changeMode(){
    if(equalDistr==true){
      mode = 'Equal distribution of sum';
      oldStatus['modeOld'] = "Equal distribution of two dice";
      oldStatus["equalDistrOld"] = false;
    }
    else{
      mode = "Equal distribution of two dices";
      oldStatus['modeOld'] = "Equal distribution of sum";
      oldStatus["equalDistrOld"] = true;
    }
  }
  void throwDiceNoStore(){
    numberOfThrows++;
    //two dices are thrown independently and get uniformly distributed results of each dice
    if (equalDistr == false){
      die[0] = Random().nextInt(maxDie-minDie+1) + minDie;
      die[1] = Random().nextInt(maxDie-minDie+1) + minDie;
      sumStatistics[die[0]+die[1]-2*minDie]++;
      dieStatistics[die[0]-minDie][die[1]-minDie]++;
    }
    //the sum of two dices are uniformly distributed, and for each sum the possible combinations are also uniformly distributed
    else{
      int sum2Dice = Random().nextInt(maxDie*2-minDie*2+1) + minDie*2;
      sumStatistics[sum2Dice-2*minDie]++;
      //if the sum of two dice is not large than the sum of maxDie and minDie, then the possible die of each dice ranges from minDie to maxDie
      if (sum2Dice<=maxDie + minDie) {
        die[0] = Random().nextInt(sum2Dice-minDie*2+1)+minDie;
      }
      //if the sum of two die large than the sum of maxDie and minDie, then the possible die of each dice ranges from (sum-maxDie) to maxDie
      else{
        die[0] = Random().nextInt(maxDie*2-sum2Dice+1) + sum2Dice-maxDie;
      }
      die[1] = sum2Dice - die[0];
      dieStatistics[die[0] - minDie][die[1] - minDie]++;
    }
  }
  void throwDice1000(){
    for(int i=0; i< sumStatistics.length;i++){
      oldStatus["sumStatisticsOld[$i]"] = sumStatistics[i];
    }
    for(int i=0;i< 6; i++){
      for(int j=0; j<6;j++){
        oldStatus["dieStatisticsOld[$i][$j]"] = dieStatistics[i][j];
      }
    }
    oldStatus["equalDistrOld"] = equalDistr;
    oldStatus["modeOld"] = mode;
    oldStatus["dieOld[0]"] = die[0];
    oldStatus["dieOld[1]"] = die[1];
    oldStatus["numberOfThrowsOld"] = numberOfThrows;
    // oldStatus["sumStatisticsOld"] = sumStatistics;
    // oldStatus["dieStatisticsOld"] = dieStatistics;
    for(int i = 0;i<1000;i++){
      throwDiceNoStore();
    }
  }
  //function to throw two dices once and store the result lists
  void throwDice(){
    for(int i=0; i< sumStatistics.length;i++){
      oldStatus["sumStatisticsOld[$i]"] = sumStatistics[i];
    }
    for(int i=0;i< 6; i++){
      for(int j=0; j<6;j++){
        oldStatus["dieStatisticsOld[$i][$j]"] = dieStatistics[i][j];
      }
    }
    oldStatus["equalDistrOld"] = equalDistr;
    oldStatus["modeOld"] = mode;
    oldStatus["dieOld[0]"] = die[0];
    oldStatus["dieOld[1]"] = die[1];
    oldStatus["numberOfThrowsOld"] = numberOfThrows;
    // oldStatus["sumStatisticsOld"] = sumStatistics;
    // oldStatus["dieStatisticsOld"] = dieStatistics;
    numberOfThrows++;
    //two dices are thrown independently and get uniformly distributed results of each dice
    if (equalDistr == false){
      die[0] = Random().nextInt(maxDie-minDie+1) + minDie;
      die[1] = Random().nextInt(maxDie-minDie+1) + minDie;
      sumStatistics[die[0]+die[1]-2*minDie]++;
      dieStatistics[die[0]-minDie][die[1]-minDie]++;
    }
    //the sum of two dices are uniformly distributed, and for each sum the possible combinations are also uniformly distributed
    else{
      int sum2Dice = Random().nextInt(maxDie*2-minDie*2+1) + minDie*2;
      sumStatistics[sum2Dice-2*minDie]++;
      //if the sum of two dice is not large than the sum of maxDie and minDie, then the possible die of each dice ranges from minDie to maxDie
      if (sum2Dice<=maxDie + minDie) {
        die[0] = Random().nextInt(sum2Dice-minDie*2+1)+minDie;
      }
      //if the sum of two die large than the sum of maxDie and minDie, then the possible die of each dice ranges from (sum-maxDie) to maxDie
      else{
        die[0] = Random().nextInt(maxDie*2-sum2Dice+1) + sum2Dice-maxDie;
      }
      die[1] = sum2Dice - die[0];
      dieStatistics[die[0] - minDie][die[1] - minDie]++;
    }
  }
  //function to reset all records of thrown dices
  void resetStatistics(){
    for(int i=0; i< sumStatistics.length;i++){
      oldStatus["sumStatisticsOld[$i]"] = sumStatistics[i];
    }
    for(int i=0;i< 6; i++){
      for(int j=0; j<6;j++){
        oldStatus["dieStatisticsOld[$i][$j]"] = dieStatistics[i][j];
      }
    }
    oldStatus["equalDistrOld"] = equalDistr;
    oldStatus["modeOld"] = mode;
    oldStatus["dieOld[0]"] = die[0];
    oldStatus["dieOld[1]"] = die[1];
    oldStatus["numberOfThrowsOld"] = numberOfThrows;
    // oldStatus["sumStatisticsOld"] = sumStatistics;
    // oldStatus["dieStatisticsOld"] = dieStatistics;
    die[0] = 1;
    die[1] = 1;
    numberOfThrows = 0;
    for(int i = 0;i<sumStatistics.length;i++){
      sumStatistics[i]=0;
    }
    for(int row = 0; row < maxDie-minDie+1; row += 1){
      for(int column = 0; column < maxDie-minDie+1; column += 1){
        dieStatistics[row][column] = 0;
      }
    }
  }

  bool undo(){
    bool flag = true;
    if(numberOfThrows==oldStatus["numberOfThrowsOld"] && mode == oldStatus["modeOld"]){
      return false;
    }
    equalDistr= oldStatus["equalDistrOld"];
    mode=oldStatus["modeOld"];
    die[0] = oldStatus["dieOld[0]"];
    die[1] = oldStatus["dieOld[1]"];
    numberOfThrows=oldStatus["numberOfThrowsOld"] ;
    for(int i=0; i< sumStatistics.length;i++){
      sumStatistics[i] = oldStatus["sumStatisticsOld[$i]"] ;
    }
    for(int i=0;i< 6; i++){
      for(int j=0; j<6;j++){
        dieStatistics[i][j]=oldStatus["dieStatisticsOld[$i][$j]"];
      }
    }
    return flag;
  }
}