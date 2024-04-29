#include <stdio.h>
#include <string.h>

void keyGeneration(char *binaryValue, int *excess3Value);
void accessing(int excess3Value);

// Function to convert binary string to decimal
int binaryToDecimal(char *binaryValue) {
    int decimalValue = 0;
    int base = 1;
    int i;

    // Iterate through the binary string from right to left
    for (i = 7; i >= 0; i--) {
        // Multiply the current digit by the corresponding power of 2 and add to decimal value
        if (binaryValue[i] == '1') {
            decimalValue += base;
        } else if (binaryValue[i] != '0') { // Check if the character is not '0' or '1'
            return -1; // Invalid binary string
        }
        base *= 2;
    }
    return decimalValue;
}

int main() {
    char binaryValue[9]; // Assuming 8-bit binary input

    // Prompt the user to enter the binary value
    printf("Enter User given input: ");
    scanf("%s", binaryValue);

    // Check if the entered binary value is valid
    if (strlen(binaryValue) != 8) {
        printf("Invalid binary value. Please enter an 8-bit binary value.\n");
        return 1; // Return error code
    }

    int excess3Value;

    // Call keyGeneration function to convert binary value to excess-3 code
    keyGeneration(binaryValue, &excess3Value);

    // Call accessing function with the generated excess-3 value
    accessing(excess3Value);

    return 0;
}

// Function definition for keyGeneration
void keyGeneration(char *binaryValue, int *excess3Value) {
    // Convert binary value to decimal
    int decimalValue = binaryToDecimal(binaryValue);

    if (decimalValue == -1) {
        printf("Invalid binary value. Please enter an 8-bit binary value.\n");
        *excess3Value = -1; // Set excess-3 value to -1 to indicate error
    } else {
        // Convert decimal value to excess-3 code
        *excess3Value = decimalValue + 3;
        printf("Access ");
    }
}

// Function definition for accessing
void accessing(int excess3Value) {
    if (excess3Value == -1) {
        printf("denied due to invalid input.\n");
        return;
    }

    int flag = 0; // Initialize flag to 0

    // Check some condition to determine access
    // For example, let's assume access is allowed if excess-3 value is even
    if (excess3Value % 2 == 0) {
        flag = 1; // Set flag to 1 for access allowed
    }

    // Check flag value and print access status accordingly
    if (flag == 1) {
        printf("Allowed\n");
    } else {
        printf("Denied\n");
    }
}