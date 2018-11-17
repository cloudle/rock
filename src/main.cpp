#include <iostream>
#include "rockConfig.h"
//#include "argh.h"

using namespace std;

int main() {
	cout << "\033[1;35mrock\033[0m@" << majorVersion << "." << minorVersion <<endl;
	return 0;
}
