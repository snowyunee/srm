#include <vector>
#include <algorithm>
#include <iostream>
#include <numeric>

int numberOfLap(int N, std::vector<int> d)
{
  if (d.empty()) return 0;

  std::vector<int> count(d.size(), 0);
  std::transform(d.begin() + 1, d.end(),
    d.begin(), count.begin(),
    [](const int& x2, const int& x1) { return (x1 >= x2) ? 1 : 0; });

  return std::accumulate(count.begin(), count.end(), 0) + 1;

}

int main()
{
  auto print = [](auto x) { std::cout << x << std::endl; };

  print(numberOfLap(3, { 1, 2, 3 }));
  print(numberOfLap(24, { 6, 6 }));
  print(numberOfLap(3, { 3, 2, 1 }));
  print(numberOfLap(50, { 1, 3, 5, 7, 9, 2, 4, 6, 8, 10 }));

}

