# Arduino Notes


## Assorted Notes

Serial Undefined in other classes

Add this to the header file (e.g. `menu.h`)

```cpp
#if defined(ARDUINO) && ARDUINO >= 100
  #include "Arduino.h"
#else
  #include "WProgram.h"
#endif
```