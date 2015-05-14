#ifndef H_LINKED_LIST
#define H_LINKED_LIST


// this is the max data size we will be supporting
typedef unsigned int NODE_DATA_SIZE;
typedef unsigned short LIST_LENGTH;

/**
 * Here is our node structure
 *
 * TODO: should we add a has{left,right} ?
 */
typedef struct _Node
{
    struct _Node* prev; // A pointer to the left element
    struct _Node* next; // A pointer to the right element
    void* data; // A void pointer to the data

} Node;

typedef int (*listerator)(void*);
/**
 * Here is our linked list structure
 *
 * NOTE: it is doubly linked
 */

typedef struct _LinkedList
{
  Node* head; // the head node
  Node* tail; // the tail node

  NODE_DATA_SIZE data_size; // The size of the data
  LIST_LENGTH size; // the amount of nodes we currently have
} LinkedList;

// The first item within the Linked List
#define HEAD_POSITION (LIST_LENGTH) 0

#define TAIL_POSITION (LIST_LENGTH) -1
// The first item within the Linked List

// init a new Linked List
LinkedList* initNewLinkedList(NODE_DATA_SIZE data_size);

// Delete the linked List
void deleteLinkedList(LinkedList* input);


// add something to the LinkedList
// NOTE: there is no type checking or anything, it's a very basic structure
int addToLinkedList(LinkedList* input, LIST_LENGTH position, void* data);
#define ADD_ERROR 0x0001
#define ERROR ADD_ERROR


// simple wrapper definitions
#define prependLinkedList(list, data) addToLinkedList(list, HEAD_POSITION, data)
#define appendLinkedList(list, data) addToLinkedList(list, TAIL_POSITION, data)

// iterate over the list and do something to everything
int listerate(LinkedList* input, listerator listerator);
// remove something from the Linked list
int removeFromLinkedList(LinkedList* input, LIST_LENGTH position );

// not out of the oven yet
#if 0
// Here are our iterate classes

typedef struct _iterator
{
  LIST_LENGTH ccount;
  Node* cnode;
} iterator;
#endif

/*
 * Now we have our iterator class
 *
 */
#endif // H_LINKED_LIST
