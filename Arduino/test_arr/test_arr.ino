const int num_inputs = 2;
const int d_delay = 10;

const int x1_step1_xoffset[] = {558, 52}; // Column vector
const double x1_step1_gain[] = {0.000550206327372765, 0.0045662100456621}; // Column vector
const int x1_step1_ymin = -1;

int input_initial[num_inputs][d_delay] = {
    {
        2305, 2316, 2315, 2308, 2280,
        2326, 2341, 2357, 2351, 2341
    },
    {
        77, 77, 74, 76, 77,
        76, 77, 81, 80, 78
    }
};


double xd1[num_inputs][11];

void setup()
{
  Serial.begin(9600);
}

void loop()
{
  
  for(int i = 0; i < num_inputs; i++) // For every row
  {
    for(int j = 0; j < d_delay; j++) // For every column
    {
      //xd1 = bsxfun(@minus,xi1,settings.xoffset);
      xd1[i][j] = input_initial[i][j] - x1_step1_xoffset[i];
      //xd1 = bsxfun(@times,xd1,settings.gain);
      xd1[i][j] = xd1[i][j] * x1_step1_gain[i];
      //xd1 = bsxfun(@plus,xd1,settings.ymin);
      xd1[i][j] = xd1[i][j] + x1_step1_ymin;
      Serial.print("i: ");
      Serial.print(i+1);
      Serial.print(" j:");
      Serial.print(j+1);
      Serial.print(" ");
      Serial.print(xd1[i][j]);
      xd1[2][11] = 33;
      Serial.print(" LAST: ");
      Serial.print(xd1[1][10]);
      Serial.println(xd1[2][11]);
    }
  }
}
