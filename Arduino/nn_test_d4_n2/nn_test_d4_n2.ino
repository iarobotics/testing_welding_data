
const int num_inputs = 2;
const int ts = 1;   // timesteps
const int d = 4;   // input delay
const int double_delay = d*2;
const int num_neurons = 2;
const int w1_cols = num_inputs * d;
const int x1_step1_xoffset[] = {588, 52}; // Column vector
const double x1_step1_gain[] = {0.000550206327372765, 0.0045662100456621}; // Column vector
const int x1_step1_ymin = -1;

//x1 2 time steps
const int input[num_inputs][ts] = {
    {2339}, // current
    {76}    // voltage
};

// xi1
const int input_initial[num_inputs][d] = {
    {
        2305, 2316, 2315, 2308
    },
    {
        77, 77, 74, 76
    }
};

// ===== NEURAL NETWORK CONSTANTS =====
// Layer 1
const double b1[num_neurons] = {
    -4.8103382239472978199, 6.4804560577834831037};

// num_neurons x (num_inputs x delay) 10x20
const double iw1_1[num_neurons][w1_cols] = {
    {
        9.658126969864468947, 5.7803138312073132354,
        8.6163694803768269281, -7.7437324618457283876,
        0.63693086216754069007, -1.1985263984659919601,
        1.7785112048310540711, -4.4016892103714821971
    },
    {
        2.6799973798106964118, 11.145532382973078356,
        4.1091271677359548775, -4.3552098095804483435,
        -3.236936550927393963, -0.65041196947934065697,
        1.6218775396418851908, -4.0375731021670482335
    }
};

//Layer 2
const double b2 = -2.2920076624970211476;

const double lw2_1[num_neurons] = {
    20.902116062013480047, 13.339710972299895886
};

// Output 1
const int y1_step1_ymin = -1;
const double y1_step1_gain = 2;
const int y1_step1_xoffset = 0;

unsigned long time_start;
unsigned long time_end;

// Input 1 Delay States
double xd1[num_inputs][d + 1] = {0};

// Allocate outputs
double y1 = 0;

//int xdts = 0;

// 20x1 matrix
double tapdelay1[double_delay] = {0};
double a1[num_neurons] = {0};
double a2 = 0;
int col = 0;

double tansig_table[101] = {0};

void print_values()
{
    for(int i = 0; i < num_inputs; i++) // For every row
    {
        // for(int j = 0; j < d+1; j++) // For every column  //for xd1
        for(int j = 0; j < 10; j++) // For every column  //
        {
            //Serial.print(i+1);
            //Serial.print(",");
            Serial.print(j+1);
            Serial.print(" :");
            //Serial.println(xd1[i][j],4);
            //Serial.println(xdts);
            Serial.println(y1,4);
        }
    }
}

void setup()
{
    Serial.begin(9600);

    for (int i = 0; i < 101; i++)
    //for (int i = 0; i < 21; i++)
    {
        tansig_table[i] = 2 / (1 + exp(-2 * (-10.0 + i*0.02))) -1;
        //tansig_table[i] = 2 / (1 + exp(-2 * (-2.0 + i*0.2))) -1;
    }
}

double tansig(double v)  // v i [-10.0 -> 10.0  ]
{
  int i;
  // convert value to entry index   -10->10  == > 0->100
  i =  (int) ( (v + 10.0) * 5);

//   Serial.print("org value");
//   Serial.print(" ");
//   Serial.print(v, 5);
//   Serial.print(" ");
//   Serial.print(i);
//   Serial.print(" ");
//   //Serial.print( atan(v), 5);
//   Serial.print( (2 / (1 + exp(-2 * v)) - 1));
//   Serial.print(" ");
//   Serial.println  (tansig_table[i], 5);

  return (tansig_table[i]);  // look in table
}

void loop()
{
    time_start = micros();
    col = d-1;
    a2 = 0;

    for(int i = 0; i < num_inputs; i++) // For every row
    {
        for(int j = 0; j < d; j++) // For every column
        {
            xd1[i][j] = input_initial[i][j] - x1_step1_xoffset[i];
            xd1[i][j] *= x1_step1_gain[i];
            xd1[i][j] += x1_step1_ymin;
        }
    }

    // Reverse xd1 columns and reshape to d*2x1
    for(int i = 0; i < double_delay; i += 2) // For every row
    {
        tapdelay1[i] = xd1[0][col];
        tapdelay1[i+1] = xd1[1][col];
        col--;
        // Add required lines if num_inputs increases
        // TODO: Check if this matrix can be removed and instead perform operations directly on xd1
    }

    //a1 = tansig_apply(b1 + IW1_1*tapdelay1);
    for(int i = 0; i < num_neurons; i++) // For every row
    {
        a1[i] = b1[i];
        for(int j = 0; j < w1_cols; j++) // For every column
        {
            a1[i] += iw1_1[i][j] * tapdelay1[j];

            // if (j%2)
            // {
            //     a1[i] += iw1_1[i][j] * xd1[0][col];

            // }
            // else
            // {
            //     a1[i] += iw1_1[i][j] * xd1[1][col];
            //     col--;
            // }

        }
        //a1[i] = 2 / (1 + exp(-2 * a1[i])) - 1;  // pred: 0.0424
        //a1[i] = tansig(a1[i]);  //lower runtime, Arduino low memory warning pred: -0.43
        //TODO: Replace with lookup table
        a2 += lw2_1[i] * a1[i];
    }
    a2 += b2;

    // Output 1
    y1 = a2 - y1_step1_ymin;
    y1 /= y1_step1_gain;
    y1 += y1_step1_xoffset;

    time_end = micros();
    Serial.print("Runtime: ");
    Serial.print(time_end - time_start);
    Serial.print(" Predcition: ");
    Serial.println(y1,4);

    delay(1000);          // wait a second so as not to send massive amounts of data

}
