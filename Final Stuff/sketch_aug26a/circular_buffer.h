#include "Arduino.h"
#ifndef circular_buffer_h
#define circular_buffer_h

// Circular Buffer
typedef struct circular_buf_t circular_buf_t;
typedef circular_buf_t* cbuf_handle_t;
struct circular_buf_t {
  uint16_t * buffer;
  size_t head;
  size_t max; //of the buffer
};

// Create
cbuf_handle_t circular_buf_init(uint16_t* buffer, size_t size)
{
  cbuf_handle_t cbuf = (cbuf_handle_t)malloc(sizeof(circular_buf_t));

  cbuf->buffer = buffer;
  cbuf->max = size;
  cbuf->head = 0;

  return cbuf;
}

// Write
void circular_buf_put(cbuf_handle_t self, uint16_t data)
{
    //Put
    self->buffer[self->head] = data;
    //Change head pointer
    if (++(self->head) == self->max) 
    { 
        self->head = 0;
    }
}

// Read Last -> this isn't nessecary but I kept forgetting the syntax
uint16_t circular_buf_return_last(cbuf_handle_t self)
{
  return self->buffer[self->head];
}

// Read All
uint16_t* circular_buf_return_buf(cbuf_handle_t self, uint16_t* array)
{
    int position = self->head; // From last data point

    for(int j = 0; j<self->max; j++){ // For all data points
    if( position == self->max){
        position = 0;
    }
    array[j] = self->buffer[position];    
    #ifdef DEBUG
    Serial.print(position);
    Serial.print(": ");
    Serial.print(array[j]);
    Serial.println();
    #endif
    position += 1;
    } 

    return array;
}

// Read Average
uint16_t circular_buf_return_average(cbuf_handle_t self)
{
    uint32_t total = 0x00000000;
    int position = self->head; // From last data point

    for(int j = 0; j<self->max; j++){ // For all data points
    if( position == self->max){
        position = 0;
    }
    total += self->buffer[position];
    #ifdef DEBUG
    Serial.print(position);
    Serial.print(total);
    Serial.println();
    #endif
    position += 1;
    } 

    return total/self->max;
}

#endif
