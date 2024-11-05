#include "circular_buffer.h";
#include "normaliser.h";
#include "generator.h";
#include <Wire.h>

int sound_pin=A0;
#define TimerHz 32
#define NORMALISE false

uint16_t timer = 0;
float time = 0;
uint16_t sensorReading = 0x0000;
unsigned char buf_size = 10;
uint16_t* array = (uint16_t *) malloc(sizeof(uint16_t)*buf_size);
uint16_t sensorMin = 0x01FF;
uint16_t sensorMax = 0x0000;

enum generator_states {sine_wave, square_wave, triangle_wave, sensor};
int state = sine_wave; // State of system

uint16_t * buffer  = (uint16_t*)malloc(buf_size * sizeof(uint16_t)); // malloc for circular buffer
cbuf_handle_t circularBuffer = circular_buf_init(buffer, buf_size); // init buffer
uint16_t* output = (uint16_t*)malloc(sizeof(uint16_t)*buf_size);

void setup() {
    // Timer
    TCCR1A = 0;
    TCCR1B = 0;
    TCNT1 = 0; // Start at 0
    TCCR1B |= (0 << CS12) | (1 << CS11) |  (0 << CS10); // 8 Prescale
    TCCR1B |= (1 << WGM12); // Waveform from TCCR1A
    TIMSK1 |= (1 << OCIE1A); //16,000,000 Hz timer
    #if (2000000 % TimerHz != 0)
    #error Invalid TimerHz
    #endif
    OCR1A = (2000000 / TimerHz) - 1; //Count before interrupt

    // Sensor
    pinMode(sound_pin,INPUT);
    Serial.begin(250000);

    // I2C
    Wire.begin(1);
    Wire.onRequest(requestEvent);
}

ISR(TIMER1_COMPA_vect){
    time = prescaledNormaliser(timer, 0, TimerHz*0.5);
    // Generate Data
    switch(state) {
        case sine_wave:
            circular_buf_put(circularBuffer, 0xFFFF * generateSineWave(time));
            break;
        case square_wave:
            circular_buf_put(circularBuffer, 0xFFFF * generateSquareWave(time));
            break;
        case triangle_wave:
            Serial.println(generateTriangleWave(time));
            circular_buf_put(circularBuffer, 0xFFFF * generateTriangleWave(time));
            break;
        case sensor:
            sensorReading = analogRead(sound_pin);
            #ifndef NORMALISE
            circular_buf_put(circularBuffer, normaliseData(sensorReading, &sensorMin, &sensorMax));
            #else
            circular_buf_put(circularBuffer, sensorReading);
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

void requestEvent() {
  Wire.write(circular_buf_return_average(circularBuffer));
}

void loop() {
    // Print buffer
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
}
