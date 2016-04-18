# Template functions in interfaces
Template function declarations are inherently final, see [here](http://dlang.org/spec/template.html#template_this_parameter). Meaning that the declaration of a template cannot be implemented by an implementing class... which means... I don't know what. See below for the resolution.

# Resolution
I don't know yet... I think I'll just have to make it **NOT** a template though, so that kind of sucks. It was a valiant effort. I think I may also simplify a good amount of the code too, get rid of some of the interfaces, etc.
