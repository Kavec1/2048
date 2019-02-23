#include <TimerOne.h>
#include <LiquidCrystal.h>

const int humSensor = A0;
const int tempSensor = A1;
const byte rs = 12, en = 11, d4 = 4, d5 = 5, d6 = 6, d7 = 7;
const byte pumpPin = 3;
volatile int humValue = 0;
volatile int tempValue = 0;
volatile bool state = true;

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

void LCD_Wirte();

LiquidCrystal lcd(rs, en, d4, d5, d6, d7);
void setup() {
  lcd.createChar(0, customChar);
  lcd.begin(16, 2);
  Timer1.initialize(1000000); // initialize timer1, and set the period in microseconds
  Timer1.attachInterrupt(LCD_Wirte); // attaches LCD_Wirte() as a timer interrupt function
  pinMode(pumpPin, OUTPUT);
  delay(100);
}

void loop() {
  humValue = analogRead(humSensor);
  tempValue = map(analogRead(tempSensor),0,1023,-55,446)-3;
  analogWrite(pumpPin,map(humValue,0,1023,0,255));  //TOTO SI ZMEN TAK AKO CHCEŠ. humValue je hodnota z vlhkomera
  // wait 300 milliseconds before the next loop for the
  //analog-to-digital converter to settle after the last reading:
  delay(300);
}

void LCD_Wirte() {  
  lcd.clear();
  lcd.print("Moisture:");
  lcd.print(map(humValue,0,1023,0,100));
  lcd.print("%");
  lcd.setCursor(0, 1);
  
  lcd.print("Temperature:");
  lcd.print(tempValue);
  lcd.write(byte(0));
  lcd.print("C"); 
}
