#!/bin/sh
# $1 is tag file name
# $2 is path to sources
ctags -R --sort=1 --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f $1 $2
