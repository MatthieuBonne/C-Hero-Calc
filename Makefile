CC = gcc
CXX = g++
RM = rm -f
CPPFLAGS = -Wall -Ofast -std=c++11
DEPFLAGS = -MM -MP
LDLIBS += -lpthread

SRCS = main.cpp cosmosData.cpp inputProcessing.cpp battleLogic.cpp base64.cpp
OBJS = $(subst .cpp,.o,$(SRCS))

all: CosmosQuest

CosmosQuest: $(OBJS)
	$(strip $(CXX) $(LDFLAGS) -o CosmosQuest $(OBJS) $(LDLIBS))

clean:
	$(strip $(RM) $(OBJS) $(OBJS:.o=.d))

distclean: clean
	$(strip $(RM) CosmosQuest)

rebuild: distclean all

run: all
	./CosmosQuest

%.d : %.cpp
	$(strip $(CXX) $(CPPFLAGS) $(DEPFLAGS) $^ |\
	sed -e 's|\([^ ]*\).o *: *\([^ ]*/\)\([^/]*\.\)|\2\1.d \2\1.o: \2\3|' > $@)
	@# fix $name.o: $path$name.cc -> $path$name.d $path$name.o: $path$name.cc

%.o : %.cpp
	$(strip $(CXX) $(CPPFLAGS) -c $< -o $@)

-include $(OBJS:.o=.d)
