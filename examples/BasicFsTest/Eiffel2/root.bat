lcc -O -DSE_WEDIT -g root8.c
lcc -O -DSE_WEDIT -g root7.c
lcc -O -DSE_WEDIT -g root6.c
lcc -O -DSE_WEDIT -g root5.c
lcc -O -DSE_WEDIT -g root4.c
lcc -O -DSE_WEDIT -g root3.c
lcclnk -o root.exe root1.obj root2.obj root3.obj root4.obj root5.obj root6.obj root7.obj root8.obj apw_start.obj e:\_local\src\lang\eiffel\AppWorks\Runtime\apw.lib
