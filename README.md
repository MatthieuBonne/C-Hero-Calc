# Cosmos Quest PvE Instance Solver

### More information
The old readme is available by clicking OLDREADME.md above. In this one, I'll only list changes, so you may want to read the old one after this one if you're not familiar with the program.

### Looking at forked versions and other resources
For help finding most updated forks, you can try [here](https://github.com/Alya-N/C-Hero-Calc/network).

* [Alternative Input throgh Latas' Graphical User Interface](https://github.com/Alya-N/CQMacroCreator)

### Files you may want to use (or just download everything)
CosmosQuest.exe  
default.cqconfig  
cqdata.txt

### Important notes

If you're not using MacroCreator, use hero:level.promotion to input heroes (Lee:99.4 or Lee:88 if there are no promotions, doyenne:1 or wboss:1 for bosses)
Thanks to  obscurans, `default.cqconfig` sets heroes with no level defined to level 1000 (so lee becomes lee:1000)

Monsters, heroes, hero aliases, and quests can be added and changed by modifying the cqdata.txt file. Adding new heroes in the data file is only possible if they use an existing ability. For the data file, don't use any empty lines, place new entries at the bottom of the section (order is important). For quests, make sure there is a space followed by a + at the end. If the file is not present, hardcoded data will be used.

When dealing against RNG heroes like Lux, put any empty spaces left in front of the formation as their position also matters.
When you get a solution with Lili in your team, all empty spaces have to be in front of the 1st unit, as calc doesn't have empty space manipulation to account for her skill.

Gambler heroes (Dicemaster, Luxurius Maximus, Pokerface, Tetra) are working. The way they work is by considering enemy lineup and order including empty space. For the enemy, calc assumes empty space is in very front. If you get a solution with fewer than 6 units against a lineup with an enemy gambler, you should also put any empty space in the very front. Theoretically it would be possible to look for solutions with alternate empty space placements, but the calc doesn't currently do it.

### Compiling
You can build it in one command with:  
g++ -Ofast -std=c++11 -o CosmosQuest main.cpp inputProcessing.cpp cosmosData.cpp battleLogic.cpp base64.cpp -s -static -static-libstdc++ -static-libgcc -pthread

The .exe included was built on Windows 10 (64Bit) using [MingW-W64-builds](http://mingw-w64.org/doku.php/download) x86\_64-8.1.0-posix-seh-rt_v6-rev0.

### Hero aliases
Open up cqdata.txt to see them. You can also add your own.
