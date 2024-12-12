// Jonathan Leviner (jbl0029@auburn.edu)
// AU ID: jbl0029
// project3_Leviner_jbl0029.cpp
// How to compile:
//      g++ project3_Leviner_jbl0029.cpp
//      Then run "./a.out" in the terminal.
// This program takes a set of numbers from two separate files and merges
// them into a brand new output file.
// Sources:
// - Source code examples in Project3.pdf
// - Examples from Lecture 21 video
// - "Absolute C++" Textbook by Savitch
// - Stack Overflow provided several examples on how to merge two files
// - Used codesdope.com and geeksforgeeks.org to understand how to implement 
//   the mergeAndSort() function
// - Referenced edureka.co on how to implement sort() using the algorithm header

#include <fstream>
#include <iostream>
#include <cstdlib> //for exit()
#include <algorithm> //for sort() function used in mergeAndSort()
//#include <assert.h>
using namespace std;

const int MAX_SIZE = 100;   // Constant for max array size

// USER DEFINED FUNCTIONS

/**
 * Checks if a file exists and can be read.
 */
bool checkFile(string file);

/**
 * Reads the contents of a valid input file and stores the data in an array.
 */
int readFile(int inputArr[], ifstream& instream);

/**
 * Takes two input arrays created from the input file data and merges their contents 
 * into a singular output array in ascending sorted order.
 */
int mergeAndSort(int inputArr1[], int inputSize1, int inputArr2[], int inputSize2, int outputArr[]);

/**
 * Writes data from the output array into a final output file.
 */
void writeFile(int outputArr[], int outputSize, string outputName);

// MAIN DRIVER FUNCTION
int main()
{
    // Variables and Array Initialization
    int arrSize1, arrSize2, arrSize3 = 0;
    int input1[MAX_SIZE];
    int input2[MAX_SIZE];
    int output[MAX_SIZE*2];     // output should be double that of the original input just in case

    // ----- First file -----
    cout << "*** Welcome to Leviner's sorting program ***" << endl;
    cout << "Enter the first input file name: ";
    string fileA;
    cin >> fileA;

    ifstream current;
    current.open(fileA);
    checkFile(fileA);       // calls checkFile() method

    arrSize1 = readFile(input1, current);
    current.close();

    cout << "The list of " << arrSize1 << " numbers in file " << fileA << " is: \n";
    for (int i = 0; i < arrSize1; i++)
    {
        cout << input1[i] << endl;
    }

    // ----- Second file -----
    cout << "\nEnter the second input file name: ";
    string fileB;
    cin >> fileB;

    // ifstream current;
    current.open(fileB);
    checkFile(fileB);       // calls checkFile() method

    arrSize2 = readFile(input2, current);
    current.close();

    cout << "The list of " << arrSize2 << " numbers in file " << fileB << " is: \n";
    for (int i = 0; i < arrSize2; i++)
    {
        cout << input2[i] << endl;
    }

    // ----- Output file -----
    arrSize3 = mergeAndSort(input1, arrSize1, input2, arrSize2, output);
    cout << "\nThe sorted list of " << arrSize3 << " numbers is: ";
    for (int i = 0; i < arrSize3; i++)
    {
        cout << output[i] << " ";
    }

    cout << "\nEnter the output file name: ";
    string fileC;
    cin >> fileC;

    writeFile(output, arrSize3, fileC);
    cout << "*** Please check the new file - " << fileC << " ***\n"
         << "*** Goodbye. ***" << endl;

    current.close();        // sanity check
    return 0;
}

// FUNCTION IMPLEMENTATION

/**
 * This method checks if a file can be opened and read.
 * The contents of this method are derived from the examples in Project3.pdf
 */
bool checkFile(string file)
{
    ifstream s;     // Input file stream set to 's'
    s.open(file.c_str());   // Checks to see if file exists
    if (s.fail()) {         // If no file or incorrect file name, check fails
        cout <<  "File failed to open properly. Exiting program." << endl;
        exit(1);
        //return false;
    }
    s.close();
    return true;
}

/**
 * This method reads the data from a file.
 * The contents of this method are derived from the examples in Project3.pdf
 */
int readFile(int inputArr[], ifstream& instream)
{
    int i;
    instream >> inputArr[i];
    while(!instream.eof()) {
        // cout << inputArr[i] << endl;
        i++;
        instream >> inputArr[i];
    }
    return i;
}

/**
 * This method merges the data from two files into a third output file and then sorts it.
 * The contents of this method are derived from examples on geeksforgeeks.org
 */
int mergeAndSort(int inputArr1[], int inputSize1, int inputArr2[], int inputSize2, int outputArr[])
{
    int a = 0, b = 0, c = 0;
    while(c < inputSize1) {     // this traverses first array and inserts contents into output array
        outputArr[c++] = inputArr1[a++];
    }

    while(b < inputSize2) {     // this traverses second array and inserts contents into output array
        outputArr[c++] = inputArr2[b++];
    }

    // sort() is a built-in function that is being used to sort the contents in the output array
    sort(outputArr, outputArr + inputSize1 + inputSize2);
    return inputSize1 + inputSize2;
}

/**
 * This method writes new data to the output file.
 * The contents of this method are derived from the examples in Project3.pdf
 */
void writeFile(int outputArr[], int outputSize, string outputName)
{
    ofstream out;
    out.open(outputName.c_str());       // opens file that data will be written to
    for (int i = 0; i < outputSize; i++) {      // this writes data to the output file
        out << outputArr[i] << endl;
    }
    out.close();        // closes file
}