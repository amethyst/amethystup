#!/bin/sh

set -e

check_cmd() {
	command -v "$1" > /dev/null
	return $?
}

sudu() {
	if test `whoami` != 'root' && check_cmd sudo; then
		sudo sh -c "$*"
	else
		sh -c "$*"
	fi 
}

install_rustup() {
	check_cmd rustup || curl https://sh.rustup.rs -sSf | sh
}

deps_auto() {
	if check_cmd apt; then
		deps_ubuntu
	elif check_cmd dnf; then
		deps_fedora
	elif check_cmd pacman; then
		deps_arch
	else
		echo "No supported package manager found"
		exit 1;
	fi
}

deps_ubuntu() {
	sudu apt update
	sudu apt install curl gcc
	install_rustup
	sudu apt install pkg-config libasound2-dev libssl-dev cmake libfreetype6-dev libexpat1-dev libxcb-composite0-dev
}

deps_fedora() {
	sudu dnf install curl gcc
	install_rustup
	sudu dnf install pkgconfig alsa-lib-devel openssl-devel cmake freetype-devel expat-devel libxcb-devel
}

deps_arch() {
	sudu pacman -Sy
	sudu pacman -S curl gcc
	install_rustup
	sudu pacman -S pkconfig alsa-devel openssl-devel cmake freetype-devel expat-devel xcb-devel
}

install_amethyst() {
	check_cmd || . ~/.cargo/env
	check_cmd cargo || { echo "Error: Cargo not found"; exit 1; }
	check_cmd amethyst || cargo install --force amethyst_tools || { echo "Failed to install Amethyst CLI"; exit 1; };
}

print_post_installation() {
	echo "Successfully installed all Amethyst dependencies!"
	echo "You can now create a new project using 'cargo new mygame'"
	echo "For documentation, see http://www.amethyst.rs/doc/"	
}

do_all() {
	deps_auto
	install_amethyst
	print_post_installation
}

do_all

