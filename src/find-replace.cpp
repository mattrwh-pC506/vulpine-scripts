#include <iostream>
#include <stdlib.h>

int main() {
    
    std::string fileExt;
    std::string searchPath;

    std::cout << "pipe delimited string of file extensions: ";
    std::cin >> fileExt;
    std::cout << "Search paths: ";
    std::cin >> searchPath;
    std::cin.ignore();

    const std::string command = std::string("find -E . -type f -regex '.*.(") + fileExt + std::string(")' | xargs sed -i '' ") + searchPath + "\n";
    std::cout << command;
    std::system(command.c_str());
    return 0;
}
