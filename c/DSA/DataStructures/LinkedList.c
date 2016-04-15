#include <stdlib.h>
#include <string.h> // used for memcpy and friends

#include "LinkedList.h"

/*
 * Here we begin our functions!
 * All are documented in the LinkedList.h file
 *
 */

LinkedList* initNewLinkedList(NODE_DATA_SIZE insize)
{
  // if the size of input is greater than 1 we need to go delete everything within the arra

  // now we create a new LinkedList
  LinkedList* newll = malloc(sizeof(LinkedList));
  newll->size = 0;
  newll->head = NULL;
  newll->tail = NULL;
  newll->data_size = insize;

  return newll;
}

void deleteLinkedList(LinkedList* input)
{
  // if our size is greater than 0 then keep going
  if(input->size > 0)
  {
    // set it to the first node
    Node* currentnode = input->head;

    // iterate through the array, trying to find where
    while(currentnode->next != NULL)
    {
      Node* delnode = currentnode;

      // free the data
      free(currentnode->data);

      currentnode = currentnode->next;

      // free the node that we should delete
      free(delnode);
    }
  }

  free(input);
}

int addToLinkedList(LinkedList* input,  LIST_LENGTH position, void* data)
{
  Node* newnode = malloc(sizeof(Node));
  newnode->data = malloc(input->data_size);
  memcpy(newnode->data, data, input->data_size);

  // if we are changing the first node
  if(position == HEAD_POSITION)
  {
    if(input->head)
    {
      // save the current node and modify it
      Node* current_node = input->head;
      current_node->prev = newnode;

      // set the next element of the new node to the current node
      newnode->next = current_node;
    } else
    {
      newnode->next = NULL;
    }

    newnode->prev = NULL;

    // and finally set the head to point to the newest node
    input->head = newnode;

    if(!input->tail)
    {
      input->tail = input->head;
    }

    input->size++;
  }
  // or are we changing the last node
  else if(position == TAIL_POSITION || position == input->size)
  {
    if(input->tail)
    {
      // save the current node and modify it
      Node* current_node = input->tail;
      current_node->next = newnode;

      // set the previous node to the current node
      newnode->prev = current_node;
    }
    newnode->next = NULL;

    input->tail = newnode;

    if(!input->head)
    {
      input->head = input->tail;
    }

    input->size++;
  }
  // other wise check to make sure that the position we are trying to delete from is real
  else if(position < input->size - 1)
  {
    Node* cnode = input->head;
    LIST_LENGTH current_item = 0;
    while(current_item != position)
    {
      // move to the next node
      if(cnode->next != NULL)
        cnode = cnode->next;
      else
        return ADD_ERROR;
      // increment the item
      current_item++;
    }

    //once we've found it, let's insert it

    // update the node behind this one to the newnode
    cnode->prev->next = newnode;

    // update the current node to point to the new node
    cnode->prev = newnode;

    // now we set the references of our new node
    newnode->next = cnode;
    newnode->prev = cnode->prev;

    //increase the size
    input->size++;
  }
  return 0; // everything worked I guess?
}

int listerate(LinkedList* input, listerator lst)
{
  LIST_LENGTH ccount = 0;
  Node* noddy;
  if(input->head)
  {
    noddy = input->head;
  } else
  {
    return ERROR;
  }

  while(ccount != input->size)
  {
    lst(noddy);
    if(noddy->next)
    {
      noddy = noddy->next;
    } else
      return ERROR;
  }
}


void Linked_List_test()
{


  char* strings[] = {"Hello", "World", ",", " how", "are", "you", "today"};



  LinkedList* ll1 = initNewLinkedList(sizeof(char**));

  for(int i = 0; i < 6; i++)
  {

    char* current;
    current = strdup(strings[i]);

    printf("adding %s\n", strings[i]);

    addToLinkedList(ll1, TAIL_POSITION, &current);

    free(current);
  }
  //lets add a bunch of integers
  deleteLinkedList(ll1);
}
