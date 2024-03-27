#include "BitArray.h"
#include "math.h"

# define L 32 // length of each symbol in bits
# define pL 1// length of each pulse in bits
# define rnd_msg 0 // set to 1 to a random binary array
# define tx_len 100000 // length of total output sequence

int outPn = 1;

int arrLenCalc(int Len) {
  int binL = floor(log(L + 1) / log(2));
  int arrLen = ceil((float)Len / binL); // length of binary array
  return arrLen;
}

void printBitArr(int* arr, int len) {
  for (int i = 0; i < len ; i++) {
    Serial.print(' ');
    Serial.print(arr[i]);
  }
}

int *binToDec(int* binIn, int binLen, int *decArr, int decLen) {
  int const maxL = floor(log(L + 1) / log(2));
  int strt = binLen - (decLen * maxL);
  int c = 1;
  int j = 0;
  int swp;
  int tempB[maxL];

  for (int i = 0; i < binLen; i++) {
    tempB[i % maxL] = binIn[i];
    if (c == 5) {
      for (int k = 0; k < maxL / 2; k++) {
        swp = tempB[k];
        tempB[k] = tempB[maxL - k - 1];
        tempB[maxL - k - 1] = swp;
      }
      for (int l = 0; l < maxL; l++) {
        decArr[j] += (int)tempB[l] * pow(2, l);
      }
      c = 0;
      j++;
    }
    c++;
  }

  return decArr;
}

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);      // Initialize serial communications at 9600 bps
  pinMode(outPn, OUTPUT);

  int tx[tx_len];
  int bn = 0; // bit index being output
  int* bnPtr;
  bnPtr = &bn;
  int symbol[L]; // defining the length of each symbol
  int msg[] = {0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1};
//  int testDec[] = {1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31};

  int msg_len = sizeof(msg) / sizeof(int);
  const int dec_len = ceil((float)msg_len / 5) ;
  int decArr[dec_len];

  // clearing decArr
  for (int i = 0; i < dec_len; i++) {
    decArr[i] = 0;
  }

  // clearing tx
  for (int i = 0; i < tx_len; i++) {
    tx[i] = 0;
  }

  // clearing symbol
  for (int i = 0; i < L; i++) {
    symbol[i] = 0;
  }

  binToDec(msg, msg_len, decArr, dec_len);
//  printBitArr(decArr, dec_len);
//  Serial.print('\n');
//  printBitArr(testDec, dec_len);
//  Serial.print('\n');

//   setting the preamble
  int half = floor((float)L / 2);
  while (bn < L) {
    if (bn >= half - 1) {
      tx[bn] = (bn) % 2;
    }
    else {
      tx[bn] = 0;
    }
    bn++;
  }


  for (int c = 0; c < dec_len; c++) {
    int k = decArr[c];
    while (k < decArr[c] + pL) {
      symbol[(k % L)] = 1;
      k++;
    }

    //    printBitArr(symbol, 32);

    for (int i = 0; i < L; i++) {
      tx[bn] = symbol[i];
      *bnPtr += 1;
    }
    // clearing symbol
    for (int i = 0; i < L; i++) {
      symbol[i] = 0;
    }
  }

  //Serial.print(32 * (dec_len + 1));
  printBitArr(tx, 32 );

  // Inverting
  for (int i = 0; i < tx_len; i++) {
    tx[i] = !tx[i];
  }
  while (1) {
    delayMicroseconds(32 * 5);
    for (int idx = 0; idx < 32 * (dec_len + 1); idx++) {
      //      Serial.print(' ');
      //      Serial.print(tx[idx]);

      digitalWrite(outPn, tx[idx]);
      delayMicroseconds(5);
    }
  }

}


void loop() {
  // put your main code here, to run repeatedly:

}
