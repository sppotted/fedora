#!/bin/bash
echo 
echo Update and reboot your system before continuing...
echo 
# nVidia CUDA Toolkit
sudo dnf install nvtop
sudo dnf config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/fedora$(rpm -E %fedora)/x86_64/cuda-fedora$(rpm -E %fedora).repo
sudo dnf clean all
sudo dnf -y module install nvidia-driver:latest-dkms
sudo dnf -y install cuda

# nVidia Drivers RPMFusion
# sudo dnf install nvtop
# sudo dnf install akmod-nvidia
# sudo dnf install xorg-x11-drv-nvidia-cuda
