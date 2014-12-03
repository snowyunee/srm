#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <numeric>
#include <cmath>

using target_t = std::vector<std::string>;
using row_t = std::string;

target_t operator+(const target_t& lhs, const target_t& rhs)
{
    target_t temp(lhs);
    temp.insert(temp.end(), rhs.begin(), rhs.end());
    return temp;
}


auto map = [](auto list, auto fn)
{
    std::transform(list.begin(), list.end(), list.begin(), 
                   [=](const auto& x){ return fn(x); });
    return list;
};

target_t target(std::size_t size)
{
    auto next = [](size_t size) { return size - 4; };
    
    if (size == 1) return target_t{row_t(size, '#')};
    
    return target_t{row_t(size, '#')} +
        target_t{row_t("# ") + row_t(next(size), ' ') + row_t(" #")} +
        map(target(next(size)), [](const auto& row){ return row_t("# ") + row + row_t(" #"); }) +
        target_t{row_t("# ") + row_t(next(size), ' ') + row_t(" #")} +
        target_t{row_t(size, '#')};
}


void print(target_t t)
{
    std::for_each(t.begin(), t.end(), [](auto s){std::cout << s << std::endl;});
    std::cout << std::endl;
}

int main()
{
    print(target(1));
    print(target(5));
}
