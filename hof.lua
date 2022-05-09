---@class higher_order_funcs
Hof = {}

--- Higher order function 'map'
---
--- Takes list and callback function
---
--- returns new list with every element modified by given callback function
---@param t table list of values
---@param f function will be applied to every element of `t`
---@return table new_t new resulting table
--- Example
---
--- Hof.map({1, 2, 3}, function(elem) return elem * 2 end)
---
--- Returns {2, 4, 6}
function Hof.map(t, f)
    local new_t = {}
    for i, elem in ipairs(t) do
        new_t[i] = f(elem)
    end
    return new_t
end


--- Higher order function 'filter'
---
--- Takes list and predicate
---
--- Returns new list filtered by predicate
---@param t table list of values
---@param predicate function will be applied to every element of `t`
---@return table new_t new filtered table
--- Example
---
--- Hof.filter({1, 2, 3, 4}, function(elem) return elem % 2 == 0 end)
---
--- Returns {2, 4}
function Hof.filter(t, predicate)
    local new_t = {}
    for _, item in ipairs(t) do
        if predicate(item) then
            new_t[#new_t+1] = item
        end
    end
    return new_t
end


--- Higher order function 'reduce'
---
--- Takes list, accumulator and function(accumulator, next_elem)
---
--- Returns folded accumulator
---@param t table list to reduce
---@param acc any initial value
---@param f function function to apply to every element of t and acc
---@return any
--- Example
---
--- Hof.reduce({1, 2, 3, 4, 5}, 0, function(acc, elem) return acc + elem end)
---
--- Returns 15
function Hof.reduce(t, acc, f)
    --- Make copy because table will mutate
    local new_t = {}
    for k, v in ipairs(t) do
        new_t[k] = v
    end

    --- Iterative recursion untill table empty
    local function iter(t, acc, f)
        if table.concat(t) == table.concat({}) then
            return acc
        end
        local last = table.remove(t)
        acc = f(acc, last)
        return iter(t, acc, f)
    end

    --- Call nested function
    local result = iter(new_t, acc, f)
    return result
end

return Hof

