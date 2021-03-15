/*
void set_time(uint16_t Year, byte Month, byte Date, byte Day, byte Hour, byte Minute, byte Second){
  byte conv_year,conv_month,conv_date,conv_day,conv_hour,conv_minute,conv_second=0;
  
  conv_second=(((Second/10)<<4)|Second%10);
  conv_minute=(((Minute/10)<<4)|Minute%10);
  conv_hour=(((Hour/10)<<4)|Hour%10);
  conv_date=(((Day/10)<<4)|Day%10);
  if(Year>=2000){
    conv_month=0x80;
    Year=Year-2000;
  }
  else
    Year=Year-1900;
  conv_month|=(((Month/10)<<4)|Month%10);
  conv_year=(((Year/10)<<4)|Year%10);
  Serial.println(conv_year);
  if(!i2c_start((I2C_7BITADDR<<1)|I2C_WRITE)){  //I2C_WRITE adds a 0, READ adds 1; 7Bit-->8Bit
    return;
  }
  i2c_write(I2C_SEC);                             //send memory address
  i2c_write(conv_second);                         //Set Seconds  
  i2c_rep_start((I2C_7BITADDR<<1)|I2C_WRITE);     //restart for reading
  i2c_write(I2C_MIN);                             //send memory address
  i2c_write(conv_minute);                         //Set Minutes  
  i2c_rep_start((I2C_7BITADDR<<1)|I2C_WRITE);     //restart for reading
  i2c_write(I2C_HOUR);                            //send memory address
  i2c_write(conv_hour);                           //Set Hours   
  i2c_rep_start((I2C_7BITADDR<<1)|I2C_WRITE);     //restart for reading
  i2c_write(I2C_DAY);                             //send memory address
  i2c_write(Day);                                 //Set Day (1-7) 1=monday  
  i2c_rep_start((I2C_7BITADDR<<1)|I2C_WRITE);     //restart for reading
  i2c_write(I2C_DATE);                            //send memory address
  i2c_write(conv_date);                           //Set Date  
  i2c_rep_start((I2C_7BITADDR<<1)|I2C_WRITE);     //restart for reading
  i2c_write(I2C_MONTH);                           //send memory address
  i2c_write(conv_month);                          //Set Month
  i2c_rep_start((I2C_7BITADDR<<1)|I2C_WRITE);     //restart for reading
  i2c_write(I2C_YEAR);                            //send memory address
  i2c_write(conv_year);                           //Set Year
  i2c_stop();
}*/

void write_RTC(uint8_t write_select){ //val: 1=time, 2=date, 3=time
   if(!i2c_start((I2C_7BITADDR<<1)|I2C_WRITE)){  //I2C_WRITE adds a 0, READ adds 1; 7Bit-->8Bit
    return;
  }
  if(write_select==1){
    i2c_write(I2C_SEC);                             //send memory address
    i2c_write(0);                                   //Set Seconds  
    i2c_rep_start((I2C_7BITADDR<<1)|I2C_WRITE);     //restart for reading
    i2c_write(I2C_MIN);                             //send memory address
    i2c_write((((val%100)/10)<<4)|(val%100)%10);    //Set Minutes  
    i2c_rep_start((I2C_7BITADDR<<1)|I2C_WRITE);     //restart for reading
    i2c_write(I2C_HOUR);                            //send memory address
    i2c_write((((val/100)/10)<<4)|(val/100)%10);    //Set Hours 
  }
  if(write_select==2){
    i2c_write(I2C_DATE);                            //send memory address
    i2c_write(((new_date/10)<<4)|new_date%10);      //Set Date
    i2c_rep_start((I2C_7BITADDR<<1)|I2C_WRITE);     //restart for reading
    i2c_write(I2C_MONTH);                           //send memory address
    if(new_year>1999){
      i2c_write((((new_month/10)<<4)|new_month%10))|0x80;    //Set Month
      new_year-=2000;
    }
    else{
      i2c_write(((new_month/10)<<4)|new_month%10);    //Set Month
      new_year-=1900;
    }
//    i2c_write(((new_month/10)<<4)|new_month%10);    //Set Month
    i2c_rep_start((I2C_7BITADDR<<1)|I2C_WRITE);     //restart for reading
    i2c_write(I2C_YEAR);                            //send memory address
    i2c_write(((new_year/10)<<4)|new_year%10);      //Set Year  
  }
  if(write_select==3){
    i2c_write(I2C_DAY);                             //send memory address
    i2c_write(new_day);                             //Set Day (1-7) 1=monday
  }
  i2c_stop();
}

void write_time(){
  write_RTC(1);
}

void write_date(){
  write_RTC(2);
}

void write_day(){
  write_RTC(3);
}

void read_RTC(){
  //Second    Just for calibration
  if(!i2c_start((I2C_7BITADDR<<1)|I2C_WRITE)){  //I2C_WRITE adds a 0, READ adds 1; 7Bit-->8Bit
    //Serial.println("I2C Device busy");
    return;
  }
  i2c_write(I2C_SEC);       //send memory address
  //i2c_write(0b00000000);  //Set Minutes - remove next two lines while programming
  i2c_stop();
  
  //#########################################################################
  //Minute
  if(!i2c_start((I2C_7BITADDR<<1)|I2C_WRITE)){  //I2C_WRITE adds a 0, READ adds 1; 7Bit-->8Bit
    //Serial.println("I2C Device busy");
    return;
  }
  i2c_write(I2C_MIN);       //send memory address
  //i2c_write(0b01010110);  //Set Minutes - remove next two lines while programming
  i2c_rep_start((I2C_7BITADDR<<1)|I2C_READ);    //restart for reading
  minutebyte=i2c_read(true);  //request dat from slave; "true" sends NAK to terminate
  i2c_stop();

  //#########################################################################
  //Hour
  if(!i2c_start((I2C_7BITADDR<<1)|I2C_WRITE)){  //I2C_WRITE adds a 0, READ adds 1; 7Bit-->8Bit
    //Serial.println("I2C Device busy");
    return;
  }
  i2c_write(I2C_HOUR);       //send memory address
  //i2c_write(0b00010100);   //Set Hours - remove next two lines while programming
  i2c_rep_start((I2C_7BITADDR<<1)|I2C_READ);    //restart for reading
  hourbyte=i2c_read(true);  //request dat from slave; "true" sends NAK to terminate
  i2c_stop();

  //#########################################################################
  //Day
  if(!i2c_start((I2C_7BITADDR<<1)|I2C_WRITE)){  //I2C_WRITE adds a 0, READ adds 1; 7Bit-->8Bit
    //Serial.println("I2C Device busy");
    return;
  }
  i2c_write(I2C_DAY);       //send memory address
  //i2c_write(0b00000011);   //Set Day (1-7) 1=monday- remove next two lines while programming
  i2c_rep_start((I2C_7BITADDR<<1)|I2C_READ);    //restart for reading
  daybyte=i2c_read(true);  //request dat from slave; "true" sends NAK to terminate
  i2c_stop();
  
  //#########################################################################
  //Date
  if(!i2c_start((I2C_7BITADDR<<1)|I2C_WRITE)){  //I2C_WRITE adds a 0, READ adds 1; 7Bit-->8Bit
    //Serial.println("I2C Device busy");
    return;
  }
  i2c_write(I2C_DATE);       //send memory address
  //i2c_write(0b00000001);   //Set Date - remove next two lines while programming
  i2c_rep_start((I2C_7BITADDR<<1)|I2C_READ);    //restart for reading
  datebyte=i2c_read(true);  //request dat from slave; "true" sends NAK to terminate
  i2c_stop();
 
  //#########################################################################
  //Month
  if(!i2c_start((I2C_7BITADDR<<1)|I2C_WRITE)){  //I2C_WRITE adds a 0, READ adds 1; 7Bit-->8Bit
    //Serial.println("I2C Device busy");
    return;
  }
  i2c_write(I2C_MONTH);       //send memory address
  //i2c_write(0b10001000);   //Set Month - remove next two lines while programming  
  i2c_rep_start((I2C_7BITADDR<<1)|I2C_READ);    //restart for reading
  monthbyte=i2c_read(true);  //request dat from slave; "true" sends NAK to terminate
  i2c_stop();

  //#########################################################################
  //Year
  if(!i2c_start((I2C_7BITADDR<<1)|I2C_WRITE)){  //I2C_WRITE adds a 0, READ adds 1; 7Bit-->8Bit
    //Serial.println("I2C Device busy");
    return;
  }
  i2c_write(I2C_YEAR);       //send memory address
  //i2c_write(0b00100000);   //Set Year - remove next two lines while programming  
  i2c_rep_start((I2C_7BITADDR<<1)|I2C_READ);    //restart for reading
  yearbyte=i2c_read(true);  //request dat from slave; "true" sends NAK to terminate
  i2c_stop();

  //#########################################################################
  //Converting Time
  tminute=((minutebyte&0b11110000)>>4)*10+(minutebyte&0b00001111);
  thour=((hourbyte&0b00110000)>>4)*10+(hourbyte&0b00001111);
  tdate=((datebyte&0b00110000)>>4)*10+(datebyte&0b00001111);
  tmonth=((monthbyte&0b00010000)>>4)*10+(monthbyte&0b00001111);
  tcentury=(monthbyte&0b10000000)>>7;    //if century==1 --> nach 2000
  if(tcentury)
    tyear=2000+((yearbyte&0b11110000)>>4)*10+(yearbyte&0b00001111);
  else
    tyear=1900+((yearbyte&0b11110000)>>4)*10+(yearbyte&0b00001111);
}
