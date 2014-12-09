#include <iostream>
#include <vector>

int numberOfSubsequences(const std::vector<int>& d)
{
  auto test = [](auto i, auto j) -> bool
  {
    if (i == j) return true;
    if (i + 1 == j) return true;

    auto diff = std::vector<int>(j - i);
    std::transform(i, j, i + 1, diff.begin(),
      [](auto k1, auto k2) { return k2 - k1; });
    return std::all_of(diff.begin(), diff.end(),
      [&](int x) { return (x == diff[0]) ? true : false; });
  };

  auto count = 0;
  for (auto i = d.begin(); i != d.end(); i++)
  {
    for (auto j = i; j != d.end(); j++)
    {
      if (test(i, j))
        count++;
    }
  }
  return count;
}

int main()
{
  auto print = [](auto x) { std::cout << x << std::endl; };

  print(numberOfSubsequences({ 0, 1, 2 }));
  print(numberOfSubsequences({ 1, 2, 4 }));
  print(numberOfSubsequences({ 3, 2, 1, 0 }));
  print(numberOfSubsequences({ 1, 2, 4, 8, 16 }));
  print(numberOfSubsequences({ 1, 3, 5, 5, 5, 5, 64, 4, 23, 2, 3, 4, 5, 4, 3 }));
}