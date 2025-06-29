#!/bin/sh

# exit immediately if password-manager-binary is already in $PATH
type op >/dev/null 2>&1 && exit

case "$(uname -s)" in
Darwin)
	# commands to install 1password-binary on Darwin
	brew install --cask 1password-cli
	;;
Linux)
	if type apt >/dev/null 2>&1; then
		# commands to install 1password-cli-binary on Linux
		curl -sS https://downloads.1password.com/linux/keys/1password.asc |
			sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg &&
			echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/$(dpkg --print-architecture) stable main" |
			sudo tee /etc/apt/sources.list.d/1password.list &&
			sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/ &&
			curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol |
			sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol &&
			sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22 &&
			curl -sS https://downloads.1password.com/linux/keys/1password.asc |
			sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg &&
			sudo apt update &&
			sudo apt install -y 1password-cli
	else
		BASE_ARCH=$(uname -m)
		if echo "$BASE_ARCH" eq "aarch64"; then
			ARCH=arm64
		fi
		if echo "$BASE_ARCH" eq "x86_65"; then
			ARCH=amd64
		fi
		curl -l -o op.zip "https://cache.agilebits.com/dist/1P/op2/pkg/v2.31.1/op_linux_${ARCH}_v2.31.1.zip" &&
			unzip -d op op.zip &&
			sudo mv op/op /usr/local/bin/ &&
			rm -r op.zip op &&
			sudo groupadd -f onepassword-cli &&
			sudo chgrp onepassword-cli /usr/local/bin/op &&
			sudo chmod g+s /usr/local/bin/op
	fi
	;;
*)
	echo "unsupported OS"
	exit 1
	;;
esac
