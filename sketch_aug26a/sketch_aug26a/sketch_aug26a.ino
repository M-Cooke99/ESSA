int timer = 0;
uint16_t data = 0;

#define TimerHz 50

void setup() {
    // Timer
    TCCR1A = 0;
    TCCR1B = 0;
    TCNT1 = 0; // Start at 0
    TCCR1B |= (1 << CS12) | (0 << CS11) |  (0 << CS10); // 256 Prescale
    TCCR1B |= (1 << WGM12); // Waveform from TCCR1A
    TIMSK1 |= (1 << OCIE1A); //16,000,000 Hz timer
    #if (625000 % TimerHz != 0)
    #error Invalid TimerHz
    #endif
    OCR1A = (62500 / TimerHz) - 1; //Count before interrupt

    Serial.begin(250000);
}

ISR(TIMER1_COMPA_vect){
    if (timer >= TimerHz - 1) {
        timer = 0;
    } else {
        timer++;
    }
}

void loop() {
    
}
