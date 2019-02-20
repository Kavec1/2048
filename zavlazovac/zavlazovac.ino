#include <LiquidCrystal.h>
#include "TimerOne.h"

const int humSensor = A0;
const int tempSensor = A1;
const int rs = 12, en = 11, d4 = 5, d5 = 4, d6 = 3, d7 = 2;
const int interruptPin =;

volatile int humValue;
volatile int tempValue;

float mapFloat(long x, float in_min, float in_max, float out_min, float out_max){
  return (float)(x - in_min) * (out_max - out_min) / (float)(in_max - in_min) + out_min;
}

void setup() {
  LiquidCrystal lcd(rs, en, d4, d5, d6, d7);
  lcd.begin(16, 2);
  lcd.print("Zavlazovac");
  pinMode(13, OUTPUT);
  Timer1.initialize(2000000); // initialize timer1, and set a 1 second period
  Timer1.attachInterrupt(Blink); // attaches Blink() as a timer interrupt function
}

void Blink(){
  digitalWrite(13, digitalRead(13) ^ 1);
  humValue = analogRead(humSensor);
  tempValue = mapFloat(analogRead(tempSensor),0,1023,0,4.5); 
}
void loop() {
  // put your main code here, to run repeatedly:
  float voltage = mapfloat(sensorValue,0,1023,0,4.5);
  lcd.setCursor(0, 1);
  lcd.print(voltage);
  //lcd.print(millis()/1000);
}
