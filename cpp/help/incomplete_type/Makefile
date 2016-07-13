
CXX=clang++
CXXFLAGS=--std=c++14

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $<

todo-test: main.o Todo.o TodoList.o
	$(CXX) -o $@ $^

.PHONY: clean

clean:
	rm -f *.o todo-test
