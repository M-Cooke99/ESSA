#include "Arduino.h"
#include "math.h"
#ifndef generator_h
#define generator_h

#define pi 3.14159

#define FREQUECY_HZ 2
#define AMPLITUDE 1
#define PHASE_RADIANS 0

const float phase = 2 * pi * PHASE_RADIANS;

// Sin Wave
float generateSineWave(float time){
    float radians = 2 * pi * FREQUECY_HZ * time;
    return (AMPLITUDE*0.5)*sin(radians + phase) + AMPLITUDE*0.5;
}

// Square Wave
float generateSquareWave(float time){
    float time2 = time * FREQUECY_HZ;
    time = time2 - floor(time2);
    float offset = phase / (2 * pi);
    if (time + offset < 0.5) {
        return AMPLITUDE;
    } else if (time + offset > 0.5) {
        return 0;
    } else {
        return AMPLITUDE * 0.5;
    }
}

// Triangle Wave
float generateTriangleWave(float time){
    float time2 = time * FREQUECY_HZ;
    time = time2 - floor(time2);
    float offset = phase / (2 * pi);
    if (time + offset <= 0.5) {
        return (time + offset) * 4 * AMPLITUDE / 2;
    } else {
        return AMPLITUDE - (time + offset - 0.5) * 4 * AMPLITUDE / 2;
    }
}
#endif
