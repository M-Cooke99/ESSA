#include "circular_buffer.h";
#include "normaliser.h";
#include "generator.h";
#include <Wire.h>

int sound_pin=A0;
#define TimerHz 32
// #define NORMALISE 1
// #define DEBUG 1

uint16_t timer = 0;
float time = 0;
uint16_t sensorReading = 0x0000;
unsigned char buf_size = 16;
uint16_t* array = (uint16_t *) malloc(sizeof(uint16_t)*buf_size);
uint16_t sensorMin = 0xFFFF;
uint16_t sensorMax = 0x0000;
uint16_t generatorMax = 0x01FF; // Used for scaling results

// Ready for stateful operation after VGA + I2C are working
enum generator_states {sine_wave, square_wave, triangle_wave, sensor};
int state = sine_wave; // State of system <-- Until this is stateful

// Setup circular buffer
uint16_t * buffer  = (uint16_t*)malloc(buf_size * sizeof(uint16_t)); // malloc for circular buffer
cbuf_handle_t circularBuffer = circular_buf_init(buffer, buf_size); // init buffer
uint16_t* output = (uint16_t*)malloc(sizeof(uint16_t)*buf_size); // sizing for output

void setup() {
    // Timer
    TCCR1A = 0;
    TCCR1B = 0;
    TCNT1 = 0; // Start at 0
    TCCR1B |= (0 << CS12) | (1 << CS11) |  (0 << CS10); // 8 Prescale
    TCCR1B |= (1 << WGM12); // Waveform from TCCR1A
    TIMSK1 |= (1 << OCIE1A); //16,000,000 Hz timer
    // This just helps when configuring
    #if (2000000 % TimerHz != 0)
    #error Invalid TimerHz
    #endif
    OCR1A = (2000000 / TimerHz) - 1; //Count before interrupt

    // Sensor
    pinMode(sound_pin,INPUT);

    // I2C
    Wire.begin(1);
    Wire.onRequest(requestEvent);

    // Testing only
    Serial.begin(250000);
}

ISR(TIMER1_COMPA_vect){
    time = prescaledNormaliser(timer, 0, TimerHz);
    // Generate Data
    switch(state) {
        case sine_wave:
            circular_buf_put(circularBuffer, generatorMax * generateSineWave(time));
            break;
        case square_wave:
            circular_buf_put(circularBuffer, generatorMax * generateSquareWave(time));
            break;
        case triangle_wave:
            circular_buf_put(circularBuffer, generatorMax * generateTriangleWave(time));
            break;
        case sensor:
            sensorReading = analogRead(sound_pin);
            // This can be done compile time as it won't be togglable
            #ifdef NORMALISE 
            circular_buf_put(circularBuffer, generatorMax * normaliseData(sensorReading, &sensorMin, &sensorMax));
            #else
            circular_buf_put(circularBuffer, prescaledNormaliser(sensorReading, 50, 300));
            #endif
            break;
        default:
            break;
    }
    // Increment Timer
    if (timer >= TimerHz -1){
        timer = 0;
    } else {
        timer ++;
    }
}

// On I2C master request
void requestEvent() {
  Serial.println(circular_buf_return_average(circularBuffer));
  Wire.write(circular_buf_return_average(circularBuffer));
}

// As work is all done in interupts this could be empty
void loop() {
    // Print buffer for debug / testing
    output = circular_buf_return_buf(circularBuffer, array);
    for(int i = 0; i < circularBuffer->max; i++){
            Serial.print(output[i]);
            if (i != circularBuffer->max - 1){
                Serial.print(", ");
            }
    }
    Serial.print(" -> Average: ");
    Serial.println(circular_buf_return_average(circularBuffer));
    delay(500);
    switch(state) {
        case sine_wave:
            state = square_wave;
            break;
        case square_wave:
            state = triangle_wave;
            break;
        case triangle_wave:
            state = sensor;
            break;
        case sensor:
            state = sine_wave;
            Serial.println("");
            break;
        default:
            break;
    }
}
