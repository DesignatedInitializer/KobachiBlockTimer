# BlockTimer
A category on NSTimer that allows scheduling a timer with a block rather than a target/selector pair.

# Note on Implementation 
Choosing this to be a category on NSTimer rather than a subclass KBCBlockTimer (as I initially tried) beacause the documentation of NSTimer states that "you should not attempt to subclass NSTimer" and, indeed, trying to do so leads to all sorts of weird errors (such as "*** initialization method [...] cannot be sent to an abstract object of class [...]: Create a concrete instance!").

Also, using a separate class for the target just so we don't have to add an associated object to NSTimer to retain the specified action block.
