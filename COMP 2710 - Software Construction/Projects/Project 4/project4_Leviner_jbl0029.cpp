// Jonathan Leviner (jbl0029@auburn.edu)
// AU ID: jbl0029
// project4_Leviner_jbl0029.cpp
// How to compile:
//      g++ project4_Leviner_jbl0029.cpp
//      Then run "./a.out" in the terminal.
// This program plays a trivia quiz game with a user.
// Sources:
// - Examples in Project4.pdf
// - "Absolute C++" Textbook by Savitch
// - Examples from Lecture 28 and Lecture 29 videos. Lecture 28 provided a good framework that
//   helped in developing this assignment.
// - Stack Overflow
// - geeksforgeeks.org provided clarification on linked lists and how to add nodes
// - alphacodingskills.com helped me understand how to insert a new node at the end of a linked list

#include <iostream>
#include <cstdlib>
#include <assert.h>
#include <string>
using namespace std;

// Variable(s)
int numQuestions = 0;
int totalPoints = 0;

// Structure for creating a linked list that holds a trivia question, answer, and point amount.
struct trivia_node {
   string question;
   string answer;
   int points;
   trivia_node *next;
};

// Creates a pointer to trivia_node.
typedef trivia_node* pointer_node;

// Functions
void init_QList(pointer_node& q_list);
void add_question(pointer_node& q_list);
int ask_question(pointer_node q_list, int num_ask);
void Unit_Testing();

// Creates two versions. Comment out the line below to access porduction version.
#define UNIT_TESTING

int main()
{
	// Creates a new trivia game.
	// Sets up three original questions. 
	// Sets up loop for user to input his or her own questions.
	// Quiz questions are stored in linked list.

// This section is for debugging the trivia game.
#ifdef UNIT_TESTING
	Unit_Testing();
	return 0;
// This section is for the production version of the trivia game.
#else   
    pointer_node node_list = new trivia_node;
    init_QList(node_list);
    cout << "*** Welcome to Leviner's trivia quiz game ***\n";
    string user;

    do {
        add_question(node_list);
        cout << "Continue? (Yes/No): ";
        getline(cin, user);
    }
    // case sensitivity check
    while(user.compare("Yes") == 0 || user.compare("yes") == 0 || user.compare("YES") == 0);

    // After questions are added, the trivia game will start here.
    cout << endl;
    ask_question(node_list, numQuestions);

    cout << "*** Thank you for playing the trivia quiz game. Goodbye! ***" << endl;
    return 0;
#endif
}

// Initializes the quiz to have three question input into the linked list.
void init_QList(pointer_node& q_list)
{
    //pointer_node current = new trivia_node;

    // Creates three pointer nodes to reference for each question
    pointer_node ques1 = q_list;
    pointer_node ques2 = new trivia_node;
    pointer_node ques3 = new trivia_node;

    // Question 1
    ques1->question = "How long was the shortest war on record? (Hint: how many minutes)";
    ques1->answer = "38";
    ques1->points = 100;
    ques1->next = ques2;
    numQuestions++;

    // Question 2
    ques2->question = "What was Bank of America's original name? (Hint: Bank of Italy or Bank of Germany)?";
    ques2->answer = "Bank of Italy";
    ques2->points = 50;
    ques2->next = ques3;
    numQuestions++;

    // Question 3
    ques3->question = "What is the best-selling video game of all time? (Hint: Call of Duty or Wii Sports)?";
    ques3->answer = "Wii Sports";
    ques3->points = 20;
    ques3->next = NULL;
    numQuestions++;
}

// Gives user the option to add a question to the linked list.
// Questions are added to the end of the linked list which contains the predefined questions.
void add_question(pointer_node& q_list)
{    
    pointer_node new_ques = new trivia_node;
    //trivia_node* temp = new trivia_node();
    
    // User enters question
    cout << "Enter a new question: ";
    getline(cin, new_ques->question);
    
    // User enters answer
    cout << "Enter an answer: ";
    getline(cin, new_ques->answer);
    
    // User assigns points for the question
    cout << "Enter award points: ";
    cin >> new_ques->points;
    cin.ignore();

    // New questions are added to the end of the list
    // This portion of code is from geeksforgeeks.org
    new_ques->next = NULL;
    trivia_node* temp = q_list;
    while (temp->next != NULL) {
        temp = temp->next;
    }
    temp->next = new_ques;
    numQuestions++;
    
    // This should be used instead of the portion above if new user input questions
    // are to be placed before predefined questions.
    // New questions are added to the front of the list
    //new_ques->next = q_list;
    //q_list = new_ques;
}

// Checks for null value.
// Asks the user trivia questions and starts the game. 
int ask_question(pointer_node q_list, int num_ask)
{    
    pointer_node current = q_list;
    string user_answer;
    
    if (q_list == NULL) {   // When there are no questions in the list, program terminates.
         return 0;
    }

    if (num_ask < 1) {
        cout << "Warning - the number of trivia to be asked must equal to or be larger than 1." << endl;
    }
    else if (numQuestions < num_ask) {
        cout << "Warning - There is only " << numQuestions << " trivia in the list." << endl;
    }
    else {
        for (int x = 0; x < num_ask; x++) {
            cout << "Question: " << current->question << endl
                 << "Answer: ";
            getline(cin, user_answer);
            
            // Correct answer (points are awarded)
            if (user_answer.compare(current->answer) == 0) {
                totalPoints += current->points;
                cout << "Your answer is correct. You receive " << current->points << " points."
                     << "\nYour total points: " << totalPoints << endl << endl;
            }
            // Incorrect answer (no points awarded)
            else {
                cout << "Your answer is wrong. The correct answer is: " << current->answer
                     << "\nYour total points: " << totalPoints << endl << endl;
            }
            current = current->next;
        }
    }

    return 0;
}

// 
void Unit_Testing()
{
    pointer_node node_list = new trivia_node;
    init_QList(node_list);

    cout << "*** This is a Debugging Version ***" << endl;

    // Case 1
    cout << "Unit Test Case 1: Ask no question. The program should give a warning message." << endl;
    assert(0 == ask_question(node_list, 0));
    cout << "\nCase 1 Passed\n\n";
    
    // Case 2
    cout << "Unit Test Case 2.1: Ask 1 question in the linked list. The tester enters an incorrect answer." << endl;
    assert(0 == ask_question(node_list, 1));
    cout << "Case 2.1 passed" << endl;

    cout << "\nUnit Test Case 2.2: Ask 1 question in the linked list. The tester enters a correct answer." << endl;
    assert(0 == ask_question(node_list, 1));
    cout << "Case 2.2 passed" << endl;

    // Case 3
    totalPoints = 0;
    cout <<"\nUnit Test Case 3: Ask all the questions of the last trivia in the linked list." << endl;
    assert(0 == ask_question(node_list, 3));
    cout << "Case 3 passed\n\n";

    // Case 4
    cout << "Unit Test Case 4: Ask five questions in the linked list." << endl;
    assert(0 == ask_question(node_list, 5));
    cout << "\nCase 4 passed\n";

    cout << "\n*** End of the Debugging Version ***" << endl;
}