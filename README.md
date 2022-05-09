Basic implementation of higher order functions in lua

Example

```
local Hof = require('hof')

Hof.map({1, 2, 3}, function(elem) return elem * 2 end)
--- {2, 4, 6}

Hof.filter({1, 2, 3, 4}, function(elem) return elem % 2 == 0 end)
--- {2, 4}

Hof.reduce({1, 2, 3, 4, 5}, 0, function(acc, elem) return acc + elem end)
--- 15
```

Description
-----------

Higher order functions in lua

Copying
-------

Code distributed under WTFPL v2.

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
                    Version 2, December 2004

 Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>

 Everyone is permitted to copy and distribute verbatim or modified
 copies of this license document, and changing it is allowed as long
 as the name is changed.

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

  0. You just DO WHAT THE FUCK YOU WANT TO.
