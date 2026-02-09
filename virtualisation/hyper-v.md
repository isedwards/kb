Currently need a VM with at least 8192 Mb (8 Gb) Memory
- Network adapter: External switch
- Checkpoints: Disable `use automatic checkpoints` (running out HDD space causes VM corruption)

---

- Setting up shared folders in Hyper-V is [non-trivial](https://linuxhint.com/shared_folders_hypver-v_ubuntu_guest/) and could open up a security vulnerability on the host machine.
- Setting up [static MAC address and static IP](https://www.xsofthost.com/help/assign-ip-on-virtual-machines-from-hyper-v-windows-server/)

- Network types ([virtual switches](https://docs.microsoft.com/en-us/windows-server/virtualization/hyper-v/get-started/create-a-virtual-switch-for-hyper-v-virtual-machines)):
    - External
    - Internal
    - Private
- ERROR: "Sequence contains no matching elements" occurs when the folders specified in server settings for vitual machines/virutal hard discs have been deleted.
