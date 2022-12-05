TARGET := clox
DIR_LOX := lox

SRC := $(wildcard $(DIR_LOX)/*.c)
OBJ := $(patsubst %.c,%.o,$(SRC))

OPCODES_INCLUDE:=$(DIR_LOX)/include/chunk.h

CC := gcc
STRIP := strip

INCLUDES := -I$(DIR_LOX)/include/ \

CFLAGS := -O3
CPPFLAGS := $(INCLUDES)

.PHONY: all clean

all:$(TARGET)

$(SRC):$(OPCODES_INCLUDE)

$(OBJ):%.o:%.c
	@echo "CC $(basename $<)"
	@$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

$(TARGET):$(OBJ)
	@echo "BUILD $(basename $(TARGET))"
	@$(CC) $(LDFLAGS) -o $(TARGET) $(OBJ) $(LIBS)
	@$(STRIP) $(TARGET)

clean:
	@rm -f $(TARGET) $(OBJ)