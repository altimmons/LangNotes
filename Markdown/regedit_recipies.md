# Regedit Recipies


## Making Colum List Boxes.

(^[^\s]+$)\n(^[^\s]*$)\n(^[^\s]*$)\n(^[^\s]*$)
| $1 | $2 | $3 | $4 |

(^[^\s]+$)\n(^[^\s]*$)\n(^[^\s]*$)
| $1 | $2 | $3 |

(^[^\s]+$)\n(^[^\s]*$)
| $1 | $2 |

- Each column is (^[^\s]*$)\n
-  and it can do as many as wanted
- it helps to prepend the list with:  (shown for 4 col.)
   repeated as many times as columns.  this forms the cross bar


```
| | | |    #( | and space repeat n times)
-
-
-
-
```

![](res\04\19\000023.png) ![](res\04\19\000024.png)
