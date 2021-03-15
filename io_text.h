String menu="\t - enters menu to set ";
String digit_count="Invalic vaule - digit count";
String done="done";

void cmd_help(){
  Serial.println("");
  Serial.println("available commands:");
  Serial.println("help\t\t - shows all commands");
  Serial.print("setTime\t"); Serial.print(menu); Serial.println("time");
  Serial.print("setDate\t"); Serial.print(menu); Serial.println("Date");
  Serial.print("setDay\t"); Serial.print(menu); Serial.println("Day");
  Serial.print("setTimer1"); Serial.print(menu); Serial.println("Timer 1");
  Serial.print("setTimer2"); Serial.print(menu); Serial.println("Timer 2");
  Serial.println("readTime");
  Serial.println("readDate");
  Serial.println("readTimer1");
  Serial.println("readTimer2");
  Serial.println("exitConfig");
  Serial.println("");
}


void input_handler(){
  bool pending=false;
  while(Serial.available()==0);   //wait for user Inpout
  memset(rxString,'\0',strlen(rxString)); //String leeren
  pending=true;
  while(pending==true){
    while(Serial.available()){
      char rxRead=Serial.read();
      if(rxRead!=13){
        rxString[index]=rxRead;
        index++;
      }
      else{
        pending=false;
        index=0;
      }
    }
  }
}

void cmd_setTime(){
  error=0;
  val=0;
  Serial.println("set Time: (Format HHMM, for example: 1245 or 0815)");
  Serial.println("(set seconds to 0)");
  Serial.println("always enter wintertime");
  input_handler();    //eingang in rxString abspeichern

  if(strlen(rxString)!=4){
    Serial.println(digit_count);
    error++;
  }
  if(error==0){
    val=(rxString[0]-'0')*1000;
    val+=((rxString[1]-'0')*100);
    val+=((rxString[2]-'0')*10);
    val+=(rxString[3]-'0');

    if(val>=2400 || (val%100)>=60){
      error++;
      Serial.println("Invalid value - out of range");
    }
  }
  if(error==0){
    Serial.print("Entered Time: ");
    Serial.println(val);
    write_time();
    Serial.println(done);
  }
  
}

void cmd_setDate(){
  error=0;
  new_date=0;
  new_month=0;
  new_year=0;
  Serial.println("Set date: (Format DDMMYY, for example 280121)");
  
  Serial.print("Enter date: ");
  input_handler();
  
  if(strlen(rxString)>2){
    Serial.println(digit_count);
    error++;
  }
  if(error==0){
    new_date=(rxString[0]-'0')*10;
    new_date+=(rxString[1]-'0');

    if(new_date>31){
      error++;
      Serial.println("Invalid value - too long month");
    }
  }
  memset(rxString,'\0',strlen(rxString)); //String leeren
  if(error==0){
    Serial.println(new_date);
  }

  if(error==0){
    Serial.print("Enter month (for example January: 01, November: 11) : ");
    input_handler();

    if(strlen(rxString)>2){
      Serial.println(digit_count);
      error++;      
    }
    if(error==0){
      new_month=(rxString[0]-'0')*10;
      new_month+=(rxString[1]-'0');
      if(new_month>12){
        error++;
        Serial.println("Invalid value - is this 2020 or what?");
      }
    }
    memset(rxString,'\0',strlen(rxString)); //String leeren
    if(error==0){
      Serial.println(new_month);
    }
  }

  if(error==0){
    Serial.print("Enter Year: ");
    input_handler();

    if(strlen(rxString)!=4){
      Serial.println(digit_count);
      error++;
    }
    if(error==0){
      new_year=(rxString[0]-'0')*1000;
      new_year+=(rxString[1]-'0')*100;
      new_year+=(rxString[2]-'0')*10;
      new_year+=(rxString[3]-'0');
      if(new_year>2100||new_year<1990){
        Serial.println("\nAre you a time traveler?");
      }
    }
    memset(rxString,'\0',strlen(rxString)); //String leeren
    if(error==0){
      Serial.println(new_year);
      Serial.print("So today is the ");
      Serial.print(new_date); Serial.print(".");
      Serial.print(new_month);Serial.print(".");
      Serial.println(new_year);

      write_date();
      Serial.println(done);
    }
  }
}
void cmd_setDay(){
  error=0;
  Serial.println("enter Day: ( '1' :Monday, ...)");
  input_handler();
  if(strlen(rxString)>1){
    Serial.println(digit_count);
    error++;
  }
  if(error==0){
    new_day=rxString[0]-'0';
    write_day();
    Serial.println(done);
  }
}


uint16_t input_time(){
  error=0;
  val=0;
  input_handler();
  Serial.println(rxString);
  if(strlen(rxString)!=4){
    error++;
    Serial.println(digit_count);
  }
  if(error==0){
    val=(rxString[0]-'0')*1000;
    val+=((rxString[1]-'0')*100);
    val+=((rxString[2]-'0')*10);
    val+=(rxString[3]-'0');

    if(val>=2400 || (val%100)>=60){
      error++;
      Serial.println("Invalid value - out of range");
    }
  }
  memset(rxString,'\0',strlen(rxString)); //String leeren
  if(error==0)
    return val;
  else
    return 4040;
}

void cmd_userTimer1(){
  Serial.println("set On and Off time range 1: ");
  Serial.println("Timer range 1 On: (for example 0800)");
  timer1on=input_time();
  if(timer1on==4040){
    timer1on=0;
  }
  else{
    Serial.println("Timer range 1 Off: (for example 1200)");
    timer1off=input_time();
    if(timer1off==4040){
      timer1off=0;
    }
    else{
      Serial.print("Entered On-Time: ");
      Serial.println(timer1on);
      Serial.print("Entered Off-Time: ");
      Serial.println(timer1off);
      EEPROM.write(0,timer1on/100);
      EEPROM.write(1,timer1on%100);
      EEPROM.write(2,timer1off/100);
      EEPROM.write(3,timer1off%100);
      delay(100);
    }
  }
}

void cmd_userTimer2(){
  Serial.println("set On and Off time range 2: ");
  Serial.println("Timer range 2 On: (for example 0800)");
  timer2on=input_time();
  if(timer2on==4040){
    timer2on=0;
  }
  else{
    Serial.println("Timer range 2 Off: (for example 1200)");
    timer2off=input_time();
    if(timer2off==4040){
      timer2off=0;
    }
    else{
      Serial.print("Entered On-Time: ");
      Serial.println(timer2on);
      Serial.print("Entered Off-Time: ");
      Serial.println(timer2off);
      EEPROM.write(4,timer2on/100);
      EEPROM.write(5,timer2on%100);
      EEPROM.write(6,timer2off/100);
      EEPROM.write(7,timer2off%100);
      delay(100);
    }
  }
}

void cmd_readTime(){
  Serial.print("read Time: ");
  if(thour<10)
    Serial.print("0");
  Serial.print(thour);  Serial.print(":");
  if(tminute<10)
    Serial.print("0");
  Serial.println(tminute);
}

void cmd_readDate(){
  Serial.print("read Date: ");
  if(tdate<10)
    Serial.print("0");
  Serial.print(tdate); Serial.print(".");
  if(tmonth<10)
    Serial.print("0");
  Serial.print(tmonth); Serial.print(".");
  Serial.println(tyear);
  Serial.print("Day: ");
  Serial.print(daybyte);
  Serial.println(" (1=Monday, ...)");
}

void cmd_readTimer1(){
  Serial.print("read Timer 1: ");
  Serial.print(timer1on);
  Serial.print(" to ");
  Serial.println(timer1off);
}

void cmd_readTimer2(){
  Serial.print("read Timer 2: ");
  Serial.print(timer2on);
  Serial.print(" to ");
  Serial.println(timer2off);
}

void cmd_invalid(){
  Serial.println("");
  Serial.println("invalid command!");
  Serial.println("Please enter a command from the list below.");
  cmd_help();  
}
