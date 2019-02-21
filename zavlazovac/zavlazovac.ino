#include <TimerOne.h>     //https://www.instructables.com/id/Create-Internal-Interrupt-In-Arduino/s
#include <LiquidCrystal.h>

const int humSensor = A0;
const int tempSensor = A1;
const byte rs = 12, en = 11, d4 = 4, d5 = 5, d6 = 6, d7 = 7;
const byte interruptPin = 2;
const byte pumpPin = 3;

const byte customChar[8] = {
  0b00110,
  0b01001,
  0b01001,
  0b00110,
  0b00000,
  0b00000,
  0b00000,
  0b00000,
};

volatile float humValue = 0;
volatile float tempValue = 0;
volatile bool state = true;

float mapFloat(long x, float in_min, float in_max, float out_min, float out_max) {
  return (float)(x - in_min) * (out_max - out_min) / (float)(in_max - in_min) + out_min;
}

void sensorReading() {
  humValue = analogRead(humSensor);
  tempValue = mapFloat(analogRead(tempSensor), 0, 1023, 0, 445.11);
}

void change() {
  digitalWrite(13, digitalRead(13) ^ 1);
  state = !state;
}

void setup() {
  LiquidCrystal lcd(rs, en, d4, d5, d6, d7);
  lcd.createChar(0, customChar);
  lcd.begin(16, 2);

  pinMode(13, OUTPUT);
  pinMode(pumpPin, OUTPUT);
  pinMode(humSensor, INPUT);
  pinMode(tempSensor, INPUT);
  pinMode(interruptPin, INPUT_PULLUP);
  attachInterrupt(digitalPinToInterrupt(interruptPin), change, RISING);
  Timer1.initialize(2000000); // initialize timer1, and set and period in microseconds
  Timer1.attachInterrupt(sensorReading); // attaches sensorReading() as a timer interrupt function
  delay(2000);
}

void loop() {
  // put your main code here, to run repeatedly:
  /*lcd.clear();
    if (state){
    lcd.print("Soil moisture:");
    lcd.setCursor(0, 1);
    lcd.print(humValue);
    }else{
    lcd.print("Temperature:");
    lcd.setCursor(0, 1);
    lcd.print(tempValue);
    lcd.write(byte(0));
    lcd.print("C");
    } */
lcd.print("Zavlazovac");
delay(500);
lcd.clear();
delay(500);
}

