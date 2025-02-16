#!/bin/sh

set -u
set -e

BOARD_DIR="$(dirname $0)"

. "${BR2_EXTERNAL_OPENVOICEOS_PATH}/meta"
. "${BOARD_DIR}/meta"

# Write os-release
{
    echo "NAME=\"${OVOS_NAME}\""
    echo "VERSION=\"${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_BUILD} ${BOARD_NAME}\""
    echo "ID=${OVOS_ID}"
    echo "VERSION_ID=${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_BUILD}"
    echo "PRETTY_NAME=\"${OVOS_NAME} ${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_BUILD} ${BOARD_NAME}\""
    echo "CPE_NAME=cpe:2.3:o:openvoiceos:${OVOS_ID}:${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_BUILD}:*:${DEPLOYMENT}:*:*:*:${BOARD_ID}:*"
    echo "HOME_URL=https://github.com/OpenVoiceOS/OpenVoiceOS"
    echo "DOCUMENTATION_URL=https://github.com/OpenVoiceOS/OpenVoiceOS/tree/develop/documentation"
    echo "SUPPORT_URL=https://github.com/OpenVoiceOS/OpenVoiceOS/issues"
    echo "VARIANT=\"${OVOS_NAME} - Buildroot Edition\""
    echo "VARIANT_ID=${OVOS_ID}-${BOARD_ID}-buildroot"
} > "${TARGET_DIR}/usr/lib/os-release"

# Write machine-info
{
    echo "CHASSIS=${CHASSIS}"
    echo "DEPLOYMENT=${DEPLOYMENT}"
} > "${TARGET_DIR}/etc/machine-info"

cp -f ../buildroot-external/board/ovos/raspberrypi/cmdline.txt ${BINARIES_DIR}/rpi-firmware/cmdline.txt
grub-editenv "${BINARIES_DIR}/efi-part/EFI/BOOT/grubenv" create

echo "Check for kernel in ${TARGET_DIR}"
if [ -f "${TARGET_DIR}/boot/Image" ]; then
    echo "Found Image, renaming to kernel"
    mv ${TARGET_DIR}/boot/Image ${TARGET_DIR}/boot/kernel
fi

# Copy the right config.txt file
for arg in "$@"
do
    case "${arg}" in
        --rpi3)
        cp -f ../buildroot-external/board/ovos/raspberrypi/rpi3/config.txt ${BINARIES_DIR}/rpi-firmware/config.txt
	cp -f ../buildroot-external/board/ovos/raspberrypi/rpi3/RPI_EFI.fd ${BINARIES_DIR}/rpi-firmware/RPI_EFI.fd
	cp -f ../buildroot-external/board/ovos/raspberrypi/grub-efi.cfg ${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg
	cp -f ../buildroot-external/board/ovos/raspberrypi/rpi3/sw-description ${BINARIES_DIR}
        ;;
        --rpi4)
        cp -f ../buildroot-external/board/ovos/raspberrypi/rpi4/config.txt ${BINARIES_DIR}/rpi-firmware/config.txt
	cp -f ../buildroot-external/board/ovos/raspberrypi/rpi4/RPI_EFI.fd ${BINARIES_DIR}/rpi-firmware/RPI_EFI.fd
	cp -f ../buildroot-external/board/ovos/raspberrypi/grub-efi.cfg ${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg
	cp -f ../buildroot-external/board/ovos/raspberrypi/rpi4/sw-description ${BINARIES_DIR}
        ;;
    esac
done
