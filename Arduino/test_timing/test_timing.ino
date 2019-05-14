unsigned long time_start;
unsigned long time_end;

//Number of hidden layer neurons (N), default 10
//int neurons = sizeof (neuron_weights) / sizeof (double);
const int num_neurons = 1;

// Arrays containing N values type double
double neuron_weights[] = {9.658126969864468947, 5.7803138312073132354,
                           8.6163694803768269281, -7.7437324618457283876,
                           0.63693086216754069007, -1.1985263984659919601,
                           1.7785112048310540711, -4.4016892103714821971,
                           0.20221591887896114836, 1.628777181121905171};

double neuron_biases[] = {-4.8103382239472978199, 6.4804560577834831037,
                          -7.0785687625136448631, -7.4447988349325484592,
                          -4.6759512794534279223, -5.1366434222714856261,
                          -3.7249942757126945914, -4.7207034319208824868,
                          7.7607704728766657709, 17.59196954093474119};

double output_weights[] = {20.902116062013480047, 13.339710972299895886,
                           12.076856966595276077, 0.55025560154176866856,
                           -24.132607464655464469, -2.6857866551215234807,
                           2.3136910339592131614, 6.8467846391196101052,
                           3.2356875988466229366, 0.58534792235686905482};

double output_bias = -2.2920076624970211476;

int input = 2305;

// Array to hold the neuron output
double hidden_output[num_neurons];
// Result of the output layer
double result = 0;
long multiplier = 1000000000;

// Same values converted to long (32bit int)
long output_bias_long = -2.2920076624970211476 * multiplier;
long hidden_output_long[num_neurons];
long result_long = 0;
long neuron_weights_long[num_neurons];
long neuron_biases_long[num_neurons];
long output_weights_long[num_neurons];

void double_arr_to_int()
{
    for(int k = 0; k < num_neurons; k++)
    {
        neuron_weights_long[k] = neuron_weights[k] * multiplier;
        neuron_biases_long[k] = neuron_biases[k] * multiplier;
        output_weights_long[k] = output_weights[k] * multiplier;
    }
}


void setup()
{
    Serial.begin(9600);
}

void loop()
{
    result = 0;
    result_long = 0;
    //Serial.print("Start: ");
    time_start = micros();

    // // Perform operation at the hidden neuron layer
    // for(int i = 0; i < num_neurons; i++)
    // {
    //  hidden_output[i] = (input * neuron_weights[i]) + neuron_biases[i];
    // }
    // //Calculate the result of the output layer
    // for(int j = 0; j < num_neurons; j++)
    // {
    //  result += hidden_output[j] * output_weights[j];
    // }

    // INTEGER - Perform operation at the hidden neuron layer -
    for(int i = 0; i < num_neurons; i++)
    {
     hidden_output_long[i] = (input * neuron_weights_long[i]) + neuron_biases_long[i];
    }
    //Calculate the result of the output layer
    for(int j = 0; j < num_neurons; j++)
    {
     result_long += exp(hidden_output_long[j] * output_weights_long[j]);
    }


    time_end = micros();
    //Serial.print(time_start); //prints time since program started
    //Serial.print("  End: ");
    Serial.println(time_end - time_start);
    //Serial.print("Result: ");
    //Serial.println(result);

    delay(1000);          // wait a second so as not to send massive amounts of data

}
