#include <iostream>
#include "rockConfig.h"
#include "argh.h"

using namespace std;

int main(int, char* argv[]) {
	argh::parser cmdl(argv);

	if (cmdl[{ "-v", "--version" }])
		cout << "\033[1;35mrock\033[0m@" << majorVersion << "." << minorVersion <<endl;

	return EXIT_SUCCESS;
}
