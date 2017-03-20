.SUFFIXES:
.DEFAULT_GOAL: all
	
CC = g++

BIN_DIR = "bin"

BASE_FLAGS = 

# INCLUDE BASE DIRECTORY AND BOOST DIRECTORY FOR HEADERS
LDFLAGS = -I/usr/local/Cellar/boost/1.59.0/include -I/usr/local/include

# INCLUDE BASE DIRECTORY AND BOOST DIRECTORY FOR LIB FILES
LLIBFLAGS = -L/usr/local/Cellar/boost/1.59.0/

# SPECIFIY LINK OPTIONS
LINKFLAGS =  /usr/local/Cellar/boost/1.59.0/lib/libboost_filesystem-mt.a \
			 /usr/local/Cellar/boost/1.59.0/lib/libboost_system.a

# FINAL FLAGS -- TO BE USED THROUGHOUT
FLAGS = $(BASE_FLAGS) $(LLIBFLAGS) $(LDFLAGS) $(LINKFLAGS)

.PHONY: findreplace

default: setup findreplace install

setup:
	mkdir -p bin

findreplace: ./src/find-replace.cpp
	$(CC) $(FLAGS) -o ./bin/vp-fr ./src/find-replace.cpp

install:
	cp -a ./bin/. /usr/local/bin/
