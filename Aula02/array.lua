copas = {1958, 1962, 1970, 1994, 2002}
--print(copas[1])
--print(copas[10])
print(#copas)
copas[10] = 2018
print(#copas)

copas[-1] = 1930
copas[0] = 1940

for i = -1, 10 do
    print(i, copas[i])
end

for indice, valor in ipairs(copas) do
    print(indice, valor)
end

