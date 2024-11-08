#include "Arduino.h"
#ifndef NORMALISE
#define NORMALISE

// #define DEBUG 1
#define uint16_min 0x0000
#define uint16_max 0xffff

// Unit Normaliser
float prescaledNormaliser(uint16_t current_value, uint16_t min, uint16_t max)
{
    return float(current_value - min)/(max - min);
}

// This is a simple way to do dynamic scaling based on past data
float normaliseData(uint16_t data, uint16_t *currentSensorMin, uint16_t *currentSensorMax)
{

    #ifdef DEBUG
    Serial.print("Data: ");
    Serial.println(data);
    #endif
    
    if (data < *currentSensorMin){
        #ifdef DEBUG
        Serial.println("NEW MIN");
        #endif
        *currentSensorMin = data;
    } 
    else if (data > *currentSensorMax) {
        #ifdef DEBUG
        Serial.println("NEW MAX");
        #endif
        *currentSensorMax = data;
    }

    return prescaledNormaliser(data, *currentSensorMin, *currentSensorMax);
}

#endif
