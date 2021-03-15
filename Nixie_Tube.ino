//SoftI2CMaster.h by felias-fogg https://github.com/felias-fogg/SoftI2CMaster
#include <stdio.h>
#include <EEPROM.h>

#define h14 4
#define h13 5
#define h12 6
#define h11 7
#define h04 13
#define h03 12
#define h02 11
#define h01 10
#define m14 A5
#define m13 A4
#define m12 A3
#define m11 A2
#define m04 0
#define m03 1
#define m02 2
#define m01 3
#define SHDN A0

#define SCL_PIN 1
#define SCL_PORT PORTB
#define SDA_PIN 0
#define SDA_PORT PORTB
#define I2C_HARDWARE 0    //deaktivieren, da sonso normale pins genutzt werden müssten
#define I2C_TIMEOUT 2000  //2 sek timeout
#define I2C_SLOWMODE 1
#include <SoftI2CMaster.h>

#define I2C_7BITADDR  0x68  //DS3231
#define I2C_SEC       0x00  //Seconds
#define I2C_MIN       0x01  //Minutes
#define I2C_HOUR      0x02  //Hours
#define I2C_DAY       0x03  //Day
#define I2C_DATE      0x04  //Date
#define I2C_MONTH     0x05  //Month+Century
#define I2C_YEAR      0x06  //Year

uint8_t index=0;
char rxString[25];
uint8_t i,error=0;

uint8_t new_date,new_month,new_day;
uint16_t new_year,val=0;
uint16_t timer1on,timer1off,timer2on,timer2off;
byte hourbyte,minutebyte,daybyte,datebyte,monthbyte,yearbyte; //variables read from RTC
uint8_t tminute,thour,tdate,tcentury,tmonth;  //variables after convertion
uint16_t tyear;
uint16_t military_time; //to compare with timer

#include "RTC_driver.h"
#include "io_text.h"

bool cfg_mode=0;

void pin_setup(void);                 //Set Pinmode
void show_num(int tube, int number);  //1=m01;2=m10;3=h01;4=h10


void setup() {
  pinMode(0,INPUT_PULLUP);
  pinMode(1,OUTPUT);
  digitalWrite(1,LOW);
  for(i=0;i<8;i++)
  timer1on=EEPROM.read(0)*100+EEPROM.read(1);
  timer1off=EEPROM.read(2)*100+EEPROM.read(3);
  timer2on=EEPROM.read(4)*100+EEPROM.read(5);
  timer2off=EEPROM.read(6)*100+EEPROM.read(7);

  delay(100);
  if(digitalRead(0)==0||cfg_mode==1){  //cfg_mode
    pinMode(0,INPUT);
    cfg_mode=1;
    while(digitalRead(0)==0);         //warte bis jumper gelöst
    delay(100);
    Serial.begin(9600);
    delay(50);
    Serial.println("Config Mode activated!");
    cmd_help();
  }
  pin_setup();
  randomSeed(analogRead(1));
  i2c_init();
}

void loop() {
  Serial.println("\nnew loop debug");
  static bool clock_active=0; //flag if HF is on or off
  static uint8_t oldmin=0, oldhour=0; //to grab change in hour; 10min

  while(cfg_mode==1){
    uint8_t newstuff=0;
    while(Serial.available()){
      char rxRead=Serial.read();
      if(rxRead!=13){
        rxString[index]=rxRead;
        index++;
      }
      else{
        newstuff=1;
        index=0;
      }
    }
    
    if(newstuff==1){
      newstuff=0;
      // Eingabeauswertung

      if((String) rxString == "help"){
        cmd_help();
      }
      else if((String) rxString == "setTime"){
        cmd_setTime();
      }
      else if((String) rxString == "setDate"){
        cmd_setDate();
      }
      else if((String) rxString == "setDay"){
        cmd_setDay();
      }
      else if((String) rxString == "setTimer1"){
        cmd_userTimer1();
      }
      else if((String) rxString == "setTimer2"){
        cmd_userTimer2();
      }
      else if((String) rxString == "readTime"){
        read_RTC();
        cmd_readTime();
      }
      else if((String) rxString == "readDate"){
        read_RTC();
        cmd_readDate();
      }
      else if((String) rxString == "readTimer1"){
        cmd_readTimer1();
      }
      else if((String) rxString == "readTimer2"){
        cmd_readTimer2();
      }
      else if((String) rxString=="exitConfig"){             //debug über software beenden
        Serial.println("leaving config mode!");
        Serial.end();
        cfg_mode=0;
        pinMode(0,OUTPUT);
        pinMode(1,OUTPUT);
        digitalWrite(0,LOW);
        digitalWrite(1,LOW);
      }
      else{
        cmd_invalid();
      }
      memset(rxString,'\0',strlen(rxString)); //String leeren
      delay(20);
    }
  }

  read_RTC();   //get data from RTC:
  // handles convertion --> tminute
  
  //#########################################################################
  //Winter/Sommerzeit
    //Sommerzeit beginnt letzten Sonntag (frühestens 25.03.)im März      02:00-->03:00    Wird aufgerufen, wenn Sommerzeit ist und "summer" noch auf 0 ist(noch nicht umgestellt ist)
    //Winterzeit beginnt letzten Sonntag (frühestens 25.10.)im Oktober   03:00-->02:00    Wird aufgerufen, wenn Winterzeit ist und "summer" noch auf 1 ist(noch nicht umgestellt ist)

  static bool summer=0;    //checkt anhand des Datums ob Sommer ist  1:Sommer  0:Winter
  if((((tmonth==3)&&(tdate>=25)&&(daybyte==7)&&(thour>=2))                                        //März letzter Sonntag ab 02:00
    ||((tmonth==3)&&(daybyte<=6)&&((tdate-daybyte)>=25))                                          //März nach letztem Sonntag
    ||((tmonth>=4)&&(tmonth<=9))                                                                  //April bis September
    ||((tmonth==10)&&((((tdate-daybyte)<=24)&&(daybyte<=6)) || ((daybyte==7)&&(tdate<=24)) )  )   //Oktober bis Samstag vor letztem Sonntag
    ||((tmonth==10)&&(daybyte==7)&&(tdate>=25)&&(thour<=2)))                                      //Oktober letzter Sonntag bis 03:00
    ){                                                                                            //noch nicht auf Winterzeit umgestellt
      summer=1;
    }
    else
      summer=0;

    if(summer){                   //Sommerzeit
      if(thour==23)
        thour=0;
      else
        thour++;
    }
    else{                         //Winterzeit
      ;
    }

  //#########################################################################
  //Converting Output Time
  byte digit[4]={0};    //[hour10;hour01;min10;min01]
  digit[0]=thour/10;
  digit[1]=thour%10;
  digit[2]=tminute/10;
  digit[3]=tminute%10;

  //#########################################################################
  //CLOCK OFF Statement
  military_time=thour*100+tminute;
  if(((timer1on<=military_time)&&(military_time<=timer1off))||((timer2on<=military_time)&&(military_time<=timer2off))){
    clock_active=1;
    digitalWrite(SHDN,1); //HV wird erzeugt
  }
  else{
    clock_active=0;
    digitalWrite(SHDN,0); //HV abgeschalten
  }
    
  //#########################################################################
  //Anti Cathode poisoning
  if(clock_active==1){
    if(oldhour!=digit[1]){
      for(i=0;i<20;i++){
        show_num(0,random(10));
        show_num(1,random(10));
        show_num(2,random(10));
        show_num(3,random(10));
        delay(30);
      }
      show_num(3,digit[3]);
      for(i=0;i<20;i++){
        show_num(0,random(10));
        show_num(1,random(10));
        show_num(2,random(10));
        delay(30);
      }
      show_num(2,digit[2]);
      for(i=0;i<20;i++){
        show_num(0,random(10));
        show_num(1,random(10));
        delay(30);
      }
      show_num(1,digit[1]);
      for(i=0;i<20;i++){
        show_num(0,random(10));
        delay(30);
      }
    }
    else if(oldmin!=digit[2]){
     for(i=0;i<10;i++){
        show_num(0,9-i);
        show_num(1,9-i);
        show_num(2,9-i);
        show_num(3,9-i);
        delay(100);
      }
    }
  }

  Serial.print(digit[0]);
  Serial.print(digit[1]);
  Serial.print(digit[2]);
  Serial.println(digit[3]);
  //#########################################################################
  //Output
  if(clock_active==1){
    for(i=0;i<4;i++){
      show_num(i,digit[i]);//digit[i]); //i=0=h10;1=h01;2=m10;3=m01 - digit[i]=0-9: normal; 10=OFF
    }
  }
  else{
    for(i=0;i<4;i++){
      show_num(i,10);     //OFF - HV wird aber eh abgeschalten
    }
  }

  oldmin=digit[2];
  oldhour=digit[1];
  delay(5000);
}

void pin_setup(void){
  pinMode(m01,OUTPUT);
  pinMode(m02,OUTPUT);
  pinMode(m03,OUTPUT);
  pinMode(m04,OUTPUT);

  pinMode(m11,OUTPUT);
  pinMode(m12,OUTPUT);
  pinMode(m13,OUTPUT);
  pinMode(m14,OUTPUT);

  pinMode(h01,OUTPUT);
  pinMode(h02,OUTPUT);
  pinMode(h03,OUTPUT);
  pinMode(h04,OUTPUT);

  pinMode(h11,OUTPUT);
  pinMode(h12,OUTPUT);
  pinMode(h13,OUTPUT);
  pinMode(h14,OUTPUT);

  pinMode(SHDN,OUTPUT);
  
}

void show_num(int tube, int number){  //0=h10;1=h01;2=m10;3=m01
  switch(tube){
    case 0: if(number==0){digitalWrite(h11,0);digitalWrite(h12,0);digitalWrite(h13,0);digitalWrite(h14,0);}
       else if(number==1){digitalWrite(h11,0);digitalWrite(h12,0);digitalWrite(h13,0);digitalWrite(h14,1);}
       else if(number==2){digitalWrite(h11,0);digitalWrite(h12,0);digitalWrite(h13,1);digitalWrite(h14,0);}
       else if(number==3){digitalWrite(h11,0);digitalWrite(h12,0);digitalWrite(h13,1);digitalWrite(h14,1);}
       else if(number==4){digitalWrite(h11,0);digitalWrite(h12,1);digitalWrite(h13,0);digitalWrite(h14,0);}
       else if(number==5){digitalWrite(h11,0);digitalWrite(h12,1);digitalWrite(h13,0);digitalWrite(h14,1);}
       else if(number==6){digitalWrite(h11,0);digitalWrite(h12,1);digitalWrite(h13,1);digitalWrite(h14,0);}
       else if(number==7){digitalWrite(h11,0);digitalWrite(h12,1);digitalWrite(h13,1);digitalWrite(h14,1);}
       else if(number==8){digitalWrite(h11,1);digitalWrite(h12,0);digitalWrite(h13,0);digitalWrite(h14,0);}
       else if(number==9){digitalWrite(h11,1);digitalWrite(h12,0);digitalWrite(h13,0);digitalWrite(h14,1);}
       else if(number==10){digitalWrite(h11,1);digitalWrite(h12,1);digitalWrite(h13,1);digitalWrite(h14,1);}  //OFF
       break;
    case 1: if(number==0){digitalWrite(h01,0);digitalWrite(h02,0);digitalWrite(h03,0);digitalWrite(h04,0);}
       else if(number==1){digitalWrite(h01,0);digitalWrite(h02,0);digitalWrite(h03,0);digitalWrite(h04,1);}
       else if(number==2){digitalWrite(h01,0);digitalWrite(h02,0);digitalWrite(h03,1);digitalWrite(h04,0);}
       else if(number==3){digitalWrite(h01,0);digitalWrite(h02,0);digitalWrite(h03,1);digitalWrite(h04,1);}
       else if(number==4){digitalWrite(h01,0);digitalWrite(h02,1);digitalWrite(h03,0);digitalWrite(h04,0);}
       else if(number==5){digitalWrite(h01,0);digitalWrite(h02,1);digitalWrite(h03,0);digitalWrite(h04,1);}
       else if(number==6){digitalWrite(h01,0);digitalWrite(h02,1);digitalWrite(h03,1);digitalWrite(h04,0);}
       else if(number==7){digitalWrite(h01,0);digitalWrite(h02,1);digitalWrite(h03,1);digitalWrite(h04,1);}
       else if(number==8){digitalWrite(h01,1);digitalWrite(h02,0);digitalWrite(h03,0);digitalWrite(h04,0);}
       else if(number==9){digitalWrite(h01,1);digitalWrite(h02,0);digitalWrite(h03,0);digitalWrite(h04,1);}
       else if(number==10){digitalWrite(h01,1);digitalWrite(h02,1);digitalWrite(h03,1);digitalWrite(h04,1);}  //OFF
       break;
    case 2: if(number==0){digitalWrite(m11,0);digitalWrite(m12,0);digitalWrite(m13,0);digitalWrite(m14,0);}
       else if(number==1){digitalWrite(m11,0);digitalWrite(m12,0);digitalWrite(m13,0);digitalWrite(m14,1);}
       else if(number==2){digitalWrite(m11,0);digitalWrite(m12,0);digitalWrite(m13,1);digitalWrite(m14,0);}
       else if(number==3){digitalWrite(m11,0);digitalWrite(m12,0);digitalWrite(m13,1);digitalWrite(m14,1);}
       else if(number==4){digitalWrite(m11,0);digitalWrite(m12,1);digitalWrite(m13,0);digitalWrite(m14,0);}
       else if(number==5){digitalWrite(m11,0);digitalWrite(m12,1);digitalWrite(m13,0);digitalWrite(m14,1);}
       else if(number==6){digitalWrite(m11,0);digitalWrite(m12,1);digitalWrite(m13,1);digitalWrite(m14,0);}
       else if(number==7){digitalWrite(m11,0);digitalWrite(m12,1);digitalWrite(m13,1);digitalWrite(m14,1);}
       else if(number==8){digitalWrite(m11,1);digitalWrite(m12,0);digitalWrite(m13,0);digitalWrite(m14,0);}
       else if(number==9){digitalWrite(m11,1);digitalWrite(m12,0);digitalWrite(m13,0);digitalWrite(m14,1);}
       else if(number==10){digitalWrite(m11,1);digitalWrite(m12,1);digitalWrite(m13,1);digitalWrite(m14,1);}  //OFF
       break;
    case 3: if(number==0){digitalWrite(m01,0);digitalWrite(m02,0);digitalWrite(m03,0);digitalWrite(m04,0);}
       else if(number==1){digitalWrite(m01,0);digitalWrite(m02,0);digitalWrite(m03,0);digitalWrite(m04,1);}
       else if(number==2){digitalWrite(m01,0);digitalWrite(m02,0);digitalWrite(m03,1);digitalWrite(m04,0);}
       else if(number==3){digitalWrite(m01,0);digitalWrite(m02,0);digitalWrite(m03,1);digitalWrite(m04,1);}
       else if(number==4){digitalWrite(m01,0);digitalWrite(m02,1);digitalWrite(m03,0);digitalWrite(m04,0);}
       else if(number==5){digitalWrite(m01,0);digitalWrite(m02,1);digitalWrite(m03,0);digitalWrite(m04,1);}
       else if(number==6){digitalWrite(m01,0);digitalWrite(m02,1);digitalWrite(m03,1);digitalWrite(m04,0);}
       else if(number==7){digitalWrite(m01,0);digitalWrite(m02,1);digitalWrite(m03,1);digitalWrite(m04,1);}
       else if(number==8){digitalWrite(m01,1);digitalWrite(m02,0);digitalWrite(m03,0);digitalWrite(m04,0);}
       else if(number==9){digitalWrite(m01,1);digitalWrite(m02,0);digitalWrite(m03,0);digitalWrite(m04,1);}
       else if(number==10){digitalWrite(m01,1);digitalWrite(m02,1);digitalWrite(m03,1);digitalWrite(m04,1);}  //OFF
       break;       
    default: break; 
  }
}
