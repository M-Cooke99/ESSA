#include "Arduino.h"
#ifndef generator_h
#define generator_h

#define pi 3.14159

#define FREQUECY_HZ 1
#define AMPLITUDE 1
#define PHASE_RADIANS 0

const float phase = 2 * pi * PHASE_RADIANS;

// Sin Wave
float generateSineWave(float time){
    float radians = 2 * pi * FREQUECY_HZ * time;
    return AMPLITUDE*sin(radians + phase);
}

// Square Wave
float generateSquareWave(float time){
    float offset = phase / (2 * pi);
    if (time + offset < 0.5) {
        return AMPLITUDE;
    } else if (time + offset > 0.5) {
        return - AMPLITUDE;
    } else {
        return 0;
    }
}

// Triangle Wave
float generateTriangleWave(float time){
    float offset = phase / (2 * pi);
    if (time + offset <= 0.25 * FREQUECY_HZ) {
        return AMPLITUDE * time * 4;
    } else if (time + offset <= 0.75 * FREQUECY_HZ) {
        return AMPLITUDE - 4 * AMPLITUDE * (time - 0.25);
    } else if (time + offset <= 1) {
        return (time - 0.75 * FREQUECY_HZ) * 4 * AMPLITUDE - AMPLITUDE;
    }
}
#endif
