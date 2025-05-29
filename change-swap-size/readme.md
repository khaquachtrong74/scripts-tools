# Ok you don't want use zram
> Change it with style manually
```bash
sudo swapoff -a 
sudo dd if=/dev/zero of=/swapfile bs=1M count=__SIZE_you_want__
sudo chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
# Check it with
free -h
# or
swapon
```
