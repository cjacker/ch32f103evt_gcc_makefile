# ch32f103evt with gcc and makefile support

This is pre-converted ch32f103 firmware library with gcc and makefile support from WCH official CH32F103EVT.ZIP. It is converted by '[ch32f_evt_makefile_gcc_project_template](https://github.com/cjacker/ch32f_evt_makefile_gcc_project_template)'

This firmware library support below parts from WCH:

- ch32f103c6t6
- ch32f103c8u6
- ch32f103c8t6
- ch32f103r8t6

The default part is set to 'ch32f103c8t6', you can change it with `./setpart.sh`. the corresponding 'Link.ld' will update automatically from the template.

The default 'User' codes is 'GPIO_Toggle' from the EVT example, all examples shipped in original EVT package provided in 'Examples' dir.

To build the project, type `make`.



