#include "Arduino.h"
#ifndef NORMALISE
#define NORMALISE

#define DEBUG false
#define uint16_min 0x0000
#define uint16_max 0xffff

// Unity based Normaliser
float prescaledNormaliser(uint16_t current_value, uint16_t min, uint16_t max)
{
    return float(current_value - min)/(max - min);
}

uint16_t normaliseData(uint16_t data, uint16_t *currentSensorMin, uint16_t *currentSensorMax)
{

    #ifndef DEBUG
    Serial.print("Data: ");
    Serial.println(data);
    #endif
    
    if (data < *currentSensorMin){
        #ifndef DEBUG
        Serial.println("NEW MIN");
        #endif
        *currentSensorMin = data;
    } 
    else if (data > *currentSensorMax) {
        #ifndef DEBUG
        Serial.println("NEW MAX");
        #endif
        *currentSensorMax = data;
    }

    float result = prescaledNormaliser(data, *currentSensorMin, *currentSensorMax);

    return uint16_min + (uint16_max - uint16_min) * result;
}

#endif
