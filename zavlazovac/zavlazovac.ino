#include <LiquidCrystal.h>
#include "TimerOne.h"

const int humSensor = A0;
const int tempSensor = A1;
const byte rs = 12, en = 11, d4 = 4, d5 = 5, d6 = 6, d7 = 7;
const byte interruptPin = 2;
const byte pumpPin = 3;

volatile float humValue;
volatile float tempValue;
volatile byte state = TRUE;

float mapFloat(long x, float in_min, float in_max, float out_min, float out_max){
  return (float)(x - in_min) * (out_max - out_min) / (float)(in_max - in_min) + out_min;
}

void setup() {
  LiquidCrystal lcd(rs, en, d4, d5, d6, d7);
  lcd.begin(16, 2);
  lcd.print("Zavlazovac");

  pinMode(13, OUTPUT);
  pinMode(interruptPin, INPUT_PULLUP);
  attachInterrupt(digitalPinToInterrupt(interruptPin), change, FALLING);
  Timer1.initialize(2000000); // initialize timer1, and set and period in microseconds
  Timer1.attachInterrupt(sensorReading); // attaches sensorReading() as a timer interrupt function
delay(2000);
}

void sensorReading(){
  digitalWrite(13, digitalRead(13) ^ 1);
  humValue = analogRead(humSensor);
  tempValue = mapFloat(analogRead(tempSensor),0,1023,0,445.11); 
}

void change(){
  state = !state;
}
void loop() {
  // put your main code here, to run repeatedly:
  if (state){
  lcd.setCursor(0, 1);
  lcd.print(Soil moisture:);
  lcd.setCursor(0, 2);
  lcd.print(humValue);
}else{
  lcd.setCursor(0, 1);
  lcd.print(Temperature:);
  lcd.setCursor(0, 2);
  lcd.print(tempValue);
}
}
