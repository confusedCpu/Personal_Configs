#!/usr/bin/python3
# This is a simple application to keep track of addresses and contact information from the cli

import os, pprint

def open_book(book_path, contacts[]): # opens/creates the contact book and loads it into the contacts list
  if not os.path.isfile(book_path):
    file(book_path, 'w').close()
    print('New contact book ' + book.name + ' created.')

  try:
    book = open(book_path, 'r')
    contacts = []
    for line in book:
        contacts.append(build_contact(book.readline()))
  except OSError, err1:
      print('Error 1: There was an issue opening the file. The program will now close')
  finally:
      book = None
      del book
      sys.exit()
      book.close()
 
  print('The contact book has been loaded into memory.')

def build_contact(line): # Reads in data from a csv and returns dictionaries

def menu(): # print the list of available actions and handle cli
  exit = False
  while exit != True:
    print('1. Print all \n2. Search \n3. New \n4. Update \n5.Delete \n6. Quit \n\
           ----------------------------------------------------------\n\
            What would you like to do: ')
    response = input()
    if response == '1': print_book(); continue
    elif response == '2': search_book(); continue
    elif response == '3': add_contact(); continue
    elif response == '4': update_contact(); continue
    elif response == '5': delete_contact(); continue
    elif response == '6': exit = True; continue
    else: print'That is not a valid response.\n\n'

  exit = None
  response = None
  del exit
  del response

def print_book():
    
def search_book(): 

def add_contact():
  # templete for contact
  # contact = {Name: '', Phone: '', Email: ''}
  
def update_contact():

def delete_contact():
    
def main():
  
    open_book()
    menu()

