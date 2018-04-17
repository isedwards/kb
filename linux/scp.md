    scp hostA:path/file hostB:path/file

You need to specify a host which `hostA` can reach because the copy is made from `hostA` directly to `hostB`.

To avoid this you can use the -3 option. `man scp` says what it does:

    Copies between two remote hosts are transferred through the local host. Without this option the data is copied directly between the two remote hosts. Note that this option disables the progress meter.
