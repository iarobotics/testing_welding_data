double atanTable[101]; // 101 stk a 4 bytes = 404 Bytes
#define MINN -10.0
#define MAXX  10.0
double  t;

void setup() {
  Serial.begin(9600);

  // generate  table from -10 to 10 and 101 entries  (50 on neg side, 50 on pos side and 0

  for (int i = 0; i < 101; i++) {
    atanTable[i] = atan(-10.0 + i*0.2);
  }
}



double myAtan(double v)  // v i [-10.0 -> 10.0  ]
{
  int i;
  // convert value to entry index   -10->10  == > 0->100
  i =  (int) ( (v + 10.0) * 5.0);

  Serial.print("org value");
  Serial.print(" ");
  Serial.print(v, 5);
  Serial.print(" ");
  Serial.print(i);
  Serial.print(" ");
  Serial.print( atan(v), 5);
  Serial.print(" ");
  Serial.println  (atanTable[i], 5);

  return (atanTable[i]);  // look in table
}


double testtable[12];

void loop() {

  //test
  Serial.println("start");
  Serial.println( millis() );

  // 1000 lookup for speed testing

  for (int i = -770; i < 770 ; i++)
  {
    t += myAtan( i * (1.0/77.0)); // we need to add or similar otherwise code oprimization will just remove test loop
    //my atan is called with values from -1000 to 1000
  }


  // approx 0.8 microsec pr table lookup
  Serial.println( millis());

  delay(10000);

}
