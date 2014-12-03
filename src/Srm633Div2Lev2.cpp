#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <numeric>
#include <cmath>


std::string able_to_get(int x, int y, std::vector<int> jump_lengths)
{
    auto sum = [](auto l) { return std::accumulate(l.begin(), l.end(), 0, [](auto m, auto n) { return m + n; }); };
    auto max = [](auto l) { return *(std::max_element(l.begin(), l.end())); };
    auto distance = [] (int x, int y) { return std::sqrt(x*x + y*y); };
    
    std::sort(jump_lengths.begin(), jump_lengths.end());
    if (sum(jump_lengths) >= distance(x, y) &&
       max(jump_lengths) <= sum(jump_lengths) - max(jump_lengths) + distance(x, y)) return "Able";
    
    return "Not able";
}


int main()
{
    std::cout << able_to_get(5, 4, { 2, 5 }); // "Able"
    std::cout << std::endl;
    std::cout << able_to_get(3, 4, { 4 });   // "Not Able"
    std::cout << std::endl;
    std::cout << able_to_get(3, 4, { 6 });   // "Not Able"
    std::cout << std::endl;
    std::cout << able_to_get(0, 1, { 100 , 100});   // "Able"
    std::cout << std::endl;
    std::cout << able_to_get(300, 400, { 500});   // "Able"
    std::cout << std::endl;
    std::cout << able_to_get(11, 12, { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }); // "Able
    std::cout << std::endl;
    std::cout << able_to_get(11, 12, { 1, 2, 3, 4, 5, 6, 7, 8, 9, 100 }); // "Not Able"ble_to_get(
    std::cout << std::endl;
}
