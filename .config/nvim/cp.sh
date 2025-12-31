#!/bin/zsh
for file in ./lua/plugins/*; do                                                                                                                                                          
if [[ "$file" == *.bak ]]; then
    continue
fi
echo "$file:"
cat "$file"
done

for file in ./lua/core/*; do
echo "$file:"
cat "$file"
done

for file in ./lua/snipets/*; do 
echo "$file:"
cat "$file"
done

for file in ./lua/projli/*; do 
echo "$file:"
cat "$file"
done

for file in ./*; do
echo "$file:"
cat "$file"
done
