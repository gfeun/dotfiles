## How can I create a cloud init drive including user-data ?

Use the command `genisoimage` from genisoimage package

```bash
genisoimage -output cloud-init-seed.iso -volid cidata -joliet -r user-data
```

The volume id has to be **cidata**

The file has to be named **user-data**.
> Note: For K3OS, the file has to be named **config** at the moment

This is useful to boot using the [NoCloud](https://cloudinit.readthedocs.io/en/latest/topics/datasources/nocloud.html#nocloud) cloud-init data-source when starting VM on bare Qemu/KVM
> K3OS defines it as **cdrom** data-source
