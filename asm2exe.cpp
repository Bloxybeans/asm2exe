#include <cstdlib>
#include <iostream>
#include <string>

int main(int argc, char** argv) {
    if(argc < 2) { std::cerr<<"Usage: asm2exe <input.asm> [output.exe]\n"; return 1; }
    std::string asmFile = argv[1];
    std::string base = asmFile.substr(0, asmFile.find_last_of('.'));
    std::string objFile = base + ".o";
    std::string exeFile = (argc >= 3 ? argv[2] : base + ".exe");
    
    // Assemble the file
    std::string cmd1 = "nasm -f win64 \"" + asmFile + "\" -o \"" + objFile + "\"";
    if(std::system(cmd1.c_str())) { 
        std::cerr << "Error: nasm failed\n"; 
        return 1; 
    }
    
    // Link the object file
    std::string cmd2 = "g++ -mconsole \"" + objFile + "\" -o \"" + exeFile + "\"";  // Console app
    if(std::system(cmd2.c_str())) { 
        std::cerr << "Error: linker failed\n"; 
        return 1; 
    }
    
    std::cout << "Created: " << exeFile << "\n";
    return 0;
}