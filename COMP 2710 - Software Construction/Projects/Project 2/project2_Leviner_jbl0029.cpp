// Jonathan Leviner (jbl0029@auburn.edu)
// AU ID: jbl0029
// project2_Leviner_jbl0029.cpp
// How to compile:
//      g++ project2_Leviner_jbl0029.cpp
//      Then run "./a.out" in the terminal.
// This is a program that simulates a three-way duel between Aaron, Bob,
// and Charlie. Each shooter has a different accuracy percentage and will
// aim for the shooter with the highest accuracy. Aaron has two options:
// shoot first or miss his first shot intentionally.
// Sources:
// - Dr. Li's Project2_hints.pdf
// - "Absolute C++" Textbook by Savitch
// - Stack Overflow
// - geeksforgeeks.org

#include <iostream>
#include <stdlib.h>
#include <assert.h>
#include <ctime>
using namespace std;

/*
* Input: A_alive indicates Aaron is alive true for alive, false for dead
*        B_alive indicates Bob is alive
*        C_alive indicates Charlie is alive
* Return: true if at least two are alive otherwise return false
*/
bool at_least_two_alive(bool A_alive, bool B_alive, bool C_alive);

/*
* Call by reference
* Strategy 1: Everyone shoots to kill the highest accuracy player alive
* Input: B_alive indicates Bob is alive or dead
*        C_alive indicates Aaron is alive or dead
* Return: Change B_alive into false if Bob is killed
*         Change C_alive into false if Charlie is killed
*/
void Aaron_shoots1(bool& B_alive, bool& C_alive);

/*
* Call by reference
* Input: A_alive indicates Aaron is alive or dead
*        C_alive indicates Charlie is alive or dead
* Return: Change A_alive into false if Aaron is killed
*         Change C_alive into false if Charlie is killed
*/
void Bob_shoots(bool& A_alive, bool& C_alive);
/*
* Call by reference
* Input: A_alive indicates Aaron is alive or dead
*        B_alive indicates Bob is alive or dead
* Return: Change A_alive into false if Aaron is killed
*         Change B_alive into false if Bob is killed
*/
void Charlie_shoots(bool& A_alive, bool& B_alive);

/*
* Call by reference
* Strategy 2: Aaron intentionally misses if both are alive
* Input: B_alive indicates Bob is alive or dead
*        C_alive indicates Aaron is alive or dead
* Return: Change B_alive into false if Bob is killed
*         Change C_alive into false if Charlie is killed
*/
void Aaron_shoots2(bool& B_alive, bool& C_alive);


//Simple method to implement pause function in linux
void Press_any_key(void);

//TEST PROTOTYPES
void test_at_least_two_alive(void);
void test_Aaron_shoots1(void);
void test_Bob_shoots(void);
void test_Charlie_shoots(void);
void test_Aaron_shoots2(void);

// VARIABLES AND CONSTANTS
const int TOTAL_RUNS = 10000;
const int AARONS_SHOT_ACCURACY = 33;
const int BOBS_SHOT_ACCURACY = 50;
bool aaronAlive, bobAlive, charlieAlive = true;
int aaronWins1, aaronWins2 = 0;
int bobWins1, bobWins2 = 0;
int charlieWins1, charlieWins2 = 0;

// Driver
int main ()
{
    //Initializes Random number generator's seed and calls test functions
    cout << "*** Welcome to Leviner's Duel Simulator ***\n";
    srand(time(0));
    test_at_least_two_alive();
    Press_any_key();
    test_Aaron_shoots1();
    Press_any_key();
    test_Bob_shoots();
    Press_any_key();
    test_Charlie_shoots();
    Press_any_key();
    test_Aaron_shoots2();
    Press_any_key();

    //Starts strategy 1 and runs 10,000 times
    cout << "Ready to test strategy 1 (run 10000 times):\n";
    Press_any_key();

    for (int i = 0; i < TOTAL_RUNS; i++)
    {
        aaronAlive = true;
        bobAlive = true;
        charlieAlive = true;

        while (at_least_two_alive(aaronAlive, bobAlive, charlieAlive))
        {
            if (aaronAlive) {
                Aaron_shoots1(bobAlive, charlieAlive); 
            }
            if (bobAlive) {
                Bob_shoots(aaronAlive, charlieAlive);
            }
            if (charlieAlive) {
                Charlie_shoots(aaronAlive, bobAlive); 
            }
        }
        if (aaronAlive) {
            aaronWins1++;
        }
        if (bobAlive) {
            bobWins1++;
        }
        if (charlieAlive) {
            charlieWins1++;
        }
    }
    // GAME OUTPUT USING STRATEGY 1
    cout << "Aaron won " << aaronWins1 << "/10000 duels or " << static_cast<double>(aaronWins1) / TOTAL_RUNS * 100 << "%\n"
         << "Bob won " << bobWins1 << "/10000 duels or " << static_cast<double>(bobWins1) / TOTAL_RUNS * 100 << "%\n"
         << "Charlie won " << charlieWins1 << "/10000 duels or " << static_cast<double>(charlieWins1) / TOTAL_RUNS * 100 << "%\n"
         << endl;

    //Reinitializes variables and starts strategy 2 to run 10,000 times
    cout << "Ready to test strategy 2 (run 10000 times):\n";
    Press_any_key();

    for (int i = 0; i < TOTAL_RUNS; i++)
    {
        aaronAlive = true;
        bobAlive = true;
        charlieAlive = true;

        while (at_least_two_alive(aaronAlive, bobAlive, charlieAlive))
        {
            if (aaronAlive) {
                Aaron_shoots2(bobAlive, charlieAlive); 
            }
            if (bobAlive) {
                Bob_shoots(aaronAlive, charlieAlive);
            }
            if (charlieAlive) {
                Charlie_shoots(aaronAlive, bobAlive); 
            }
        }
        if (aaronAlive) {
            aaronWins2++;
        }
        if (bobAlive) {
            bobWins2++;
        }
        if (charlieAlive) {
            charlieWins2++;
        }
    }

    // GAME OUTPUT USING STRATEGY 2
    cout << "Aaron won " << aaronWins2 << "/10000 duels or " << static_cast<double>(aaronWins2) / TOTAL_RUNS * 100 << "%\n"
         << "Bob won " << bobWins2 << "/10000 duels or " << static_cast<double>(bobWins2) / TOTAL_RUNS * 100 << "%\n"
         << "Charlie won " << charlieWins2 << "/10000 duels or " << static_cast<double>(charlieWins2) / TOTAL_RUNS * 100 << "%\n"
         << endl;

    if (aaronWins1 > aaronWins2) {
        cout << "Strategy 1 is better than strategy 2.\n";
    }
    else {
        cout << "Strategy 2 is better than strategy 1.\n";
    }

    return 0;
}

// ========== FUNCTION IMPLEMENTATION ==========  
// Function documentation can be found above.
bool at_least_two_alive(bool A_alive, bool B_alive, bool C_alive)
{
    if ((A_alive && B_alive) || (B_alive && C_alive) || (A_alive && C_alive)) {
        return true;
    } else return false;
}

void Aaron_shoots1(bool& B_alive, bool& C_alive)
{
    assert(B_alive || C_alive);
    int shot = rand() % 100;
    if (shot <= AARONS_SHOT_ACCURACY) {     // Aaron is accurate 33% of the time
        if (C_alive) {
            C_alive = false;    // if Charlie alive, Aaron shoots Charlie
        }
        else {
            B_alive = false;    // Bob is shot if Charlie is not alive
        }
    }
}

void Bob_shoots(bool& A_alive, bool& C_alive)
{
    assert(A_alive || C_alive);
    int shot = rand() % 100;
    if (shot <= BOBS_SHOT_ACCURACY) {     // Bob is accurate 50% of the time
        if (C_alive) {
            C_alive = false;
        }
        else {
            A_alive = false;
        }
    }
}

void Charlie_shoots(bool& A_alive, bool& B_alive)
{
    assert(A_alive || B_alive);
    // int shot = rand() % 100;     NOT NEEDED SINCE CHARLIE IS ALWAYS ON TARGET
    if (B_alive) {
        B_alive = false;
    }
    else {
        A_alive = false;
    }
}

void Aaron_shoots2(bool& B_alive, bool& C_alive)
{
    assert(B_alive || C_alive);
    if (B_alive && C_alive) {
        return;         // Aaron intentionally misses his first shot.
    }
    int shot = rand() % 100;
    if (shot <= AARONS_SHOT_ACCURACY) {     // Aaron is accurate 33% of the time
        if (C_alive) {
            C_alive = false;
        }
        else {
            B_alive = false;
        }
    }
}

void Press_any_key(void) {
    cout << "Press any key to continue...";
    cin.ignore().get();
}

// ========== UNIT TESTING ==========
void test_at_least_two_alive(void)      // Test 1
{
    cout << "Unit Testing 1: Function - at_least_two_alive()\n";

    cout << "\tCase 1: Aaron alive, Bob alive, Charlie alive\n";    // Case 1
    assert(true == at_least_two_alive(true, true, true));
    cout << "\tCase passed ...\n";
    cout << "\tCase 2: Aaron dead, Bob alive, Charlie alive\n";     // Case 2
    assert(true == at_least_two_alive(false, true, true));
    cout << "\tCase passed ...\n";
    cout << "\tCase 3: Aaron alive, Bob dead, Charlie alive\n";     // Case 3
    assert(true == at_least_two_alive(true, false, true));
    cout << "\tCase passed ...\n";
    cout << "\tCase 4: Aaron Alive, Bob Alive, Charlie Dead\n";     // Case 4
    assert(true == at_least_two_alive(true, true, false));
    cout << "\tCase passed ...\n";
    cout << "\tCase 5: Aaron Dead, Bob Dead, Charlie Alive\n";      // Case 5
    assert(false == at_least_two_alive(false, false, true));
    cout << "\tCase passed ...\n";
    cout << "\tCase 6: Aaron Dead, Bob Alive, Charlie Dead\n";      // Case 6
    assert(false == at_least_two_alive(false, false, true));
    cout << "\tCase passed ...\n";
    cout << "\tCase 7: Aaron Alive, Bob Dead, Charlie Dead\n";      // Case 7
    assert(false == at_least_two_alive(false, false, true));
    cout << "\tCase passed ...\n";
    cout << "\tCase 8: Aaron Dead, Bob Dead, Charlie Dead\n";       // Case 8
    assert(false == at_least_two_alive(false, false, true));
    cout << "\tCase passed ...\n";
}

void test_Aaron_shoots1(void)       // Test 2
{
    cout << "Unit Testing 2: Function Aaron_shoots1(Bob_alive, Charlie_alive)\n";

    // Case 1
    bobAlive = true;
    charlieAlive = true;
    cout << "\tCase 1: Bob alive, Charlie alive\n"
         << "\t\tAaron is shooting at Charlie\n";
    Aaron_shoots1(bobAlive, charlieAlive);
    //Case 2
    bobAlive = false;
    charlieAlive = true;
    cout << "\tCase 2: Bob dead, Charlie alive\n"
         << "\t\tAaron is shooting at Charlie\n";
    Aaron_shoots1(bobAlive, charlieAlive);
    //Case 3
    bobAlive = true;
    charlieAlive = false;
    cout << "\tCase 3: Bob alive, Charlie dead\n"
         << "\t\tAaron is shooting at Bob\n";
    Aaron_shoots1(bobAlive, charlieAlive);
}

void test_Bob_shoots(void)
{
    cout << "Unit Testing 3: Function Bob_shoots(Aaron_alive, Charlie_alive)\n";

    // Case 1
    aaronAlive = true;
    charlieAlive = true;
    cout << "\tCase 1: Aaron alive, Charlie alive\n"
         << "\t\tBob is shooting at Charlie\n";
    Bob_shoots(aaronAlive, charlieAlive);
    // Case 2
    aaronAlive = false;
    charlieAlive = true;
    cout << "\tCase 2: Aaron dead, Charlie alive\n"
         << "\t\tBob is shooting at Charlie\n";
    Bob_shoots(aaronAlive, charlieAlive);
    // Case 3
    aaronAlive = true;
    charlieAlive = false;
    cout << "\tCase 3: Aaron alive, Charlie dead\n"
         << "\t\tBob is shooting at Aaron\n";
    Bob_shoots(aaronAlive, charlieAlive);
}

void test_Charlie_shoots(void)
{
    cout << "Unit Testing 4: Function Charlie_shoots(Aaron_alive, Bob_alive)\n";

    // Case 1
    aaronAlive = true;
    bobAlive = true;
    cout << "\tCase 1: Aaron alive, Bob alive\n"
         << "\t\tCharlie is shooting at Bob\n";
    Charlie_shoots(aaronAlive, bobAlive);
    // Case 2
    aaronAlive = false;
    bobAlive = true;
    cout << "\tCase 2: Aaron dead, Bob alive\n"
         << "\t\tCharlie is shooting at Bob\n";
    Charlie_shoots(aaronAlive, bobAlive);
    // Case 3
    aaronAlive = true;
    bobAlive = false;
    cout << "\tCase 3: Aaron alive, Bob dead\n"
         << "\t\tCharlie is shooting at Aaron\n";
    Charlie_shoots(aaronAlive, bobAlive);
}

void test_Aaron_shoots2(void)
{
    cout << "Unit Testing 5: Function Aaron_shoots2(Bob_alive, Charlie_alive)\n";

    // Case 1   -   INTENTIONAL MISS
    bobAlive = true;
    charlieAlive = true;
    cout << "\tCase 1: Bob alive, Charlie alive\n"
         << "\t\tAaron intentionally misses his first shot\n"
         << "\t\tBoth Bob and Charlie are alive\n";
    Aaron_shoots2(bobAlive, charlieAlive);
    // Case 2
    bobAlive = false;
    charlieAlive = true;
    cout << "\tCase 2: Bob dead, Charlie alive\n"
         << "\t\tAaron is shooting at Charlie\n";
    Aaron_shoots2(bobAlive, charlieAlive);
    // Case 3
    bobAlive = true;
    charlieAlive = false;
    cout << "\tCase 2: Bob alive, Charlie dead\n"
         << "\t\tAaron is shooting at Bob\n";
    Aaron_shoots2(bobAlive, charlieAlive);
}