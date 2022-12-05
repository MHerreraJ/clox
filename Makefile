TARGET := clox
DIR_LOX := lox

SRC := $(wildcard $(DIR_LOX)/*.c)
OBJ := $(patsubst %.c,%.o,$(SRC))

CC := gcc
STRIP := strip

INCLUDES := -I$(DIR_LOX)/include/ \

CFLAGS := -O3
CPPFLAGS := $(INCLUDES)

.PHONY: all clean

all:$(TARGET)

$(OBJ):%.o:%.c
	@echo "CC $(basename $<)"
	@$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

$(TARGET):$(OBJ)
	@echo "BUILD $(basename $(TARGET))"
	@$(CC) $(LDFLAGS) -o $(TARGET) $(OBJ) $(LIBS)
	@$(STRIP) $(TARGET)

clean:
	@rm -f $(TARGET) $(OBJ)