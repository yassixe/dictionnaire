CC = gcc
CFLAGS =  -m32 -Wall -no-pie -g
TARGET = dictionary
BUILD = build
INCLUDE = include
SRC_FILES = $(wildcard src/*)
INCLUDE_FILES = $(wildcard include/*)



all : $(BUILD)/$(TARGET)

$(BUILD)/$(TARGET): $(SRC_FILES) $(INCLUDE_FILES) always
	$(CC) $(CFLAGS) $(SRC_FILES) -I$(INCLUDE) -o $@

always:
	mkdir -p $(BUILD) 

clean:
	rm -rf $(BUILD)/*

debug:
	gdb ./$(BUILD)/$(TARGET)

run:
	./$(BUILD)/$(TARGET)
