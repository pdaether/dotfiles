#!/bin/bash

sudo nala update

sudo nala install curl libnss3-tools jq xsel openssl ca-certificates -y


# Install php only if not already installed
if ! command -v php >/dev/null 2>&1; then
	echo "PHP not found — installing..."
	sudo nala install php -y
else
	echo "PHP already installed — skipping installation."
fi

sudo nala install php8.4-mysql php8.4-mbstring php8.4-curl php8.4-xml php8.4-bcmath php8.4-zip php8.4-gd php8.4-cli php8.4-dev php8.4-soap php8.4-intl php8.4-imap php8.4-sqlite3 php8.4-pgsql php8.4-redis php8.4-imagick php8.4-xdebug -y

# Install composer only if not already installed
if ! command -v composer >/dev/null 2>&1; then
	echo "Composer not found — installing..."
	curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
	sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
	rm /tmp/composer-setup.php
else
	echo "Composer already installed — skipping installation."
fi

composer global require genesisweb/valet-linux-plus

valet install

# Ensure Xdebug settings are present for PHP CLI (if file exists)
XDEBUG_INI="/etc/php/8.4/cli/conf.d/20-xdebug.ini"
if [ -f "$XDEBUG_INI" ]; then
	echo "Patching $XDEBUG_INI — backing up and updating Xdebug settings..."
	sudo cp "$XDEBUG_INI" "${XDEBUG_INI}.bak-$(date +%s)"

	# Remove any existing lines for these directives to avoid duplicates
	sudo sed -i '/^\s*xdebug\.mode\s*=\s*/Id' "$XDEBUG_INI" || true
	sudo sed -i '/^\s*xdebug\.start_with_request\s*=\s*/Id' "$XDEBUG_INI" || true

	# Append desired settings
	echo "\n; Added by valet.sh on $(date)" | sudo tee -a "$XDEBUG_INI" >/dev/null
	echo "xdebug.mode=develop,coverage" | sudo tee -a "$XDEBUG_INI" >/dev/null
	echo "xdebug.start_with_request = yes" | sudo tee -a "$XDEBUG_INI" >/dev/null

	sudo chmod 644 "$XDEBUG_INI"
	echo "Xdebug settings updated in $XDEBUG_INI"
else
	echo "$XDEBUG_INI not found — skipping Xdebug CLI configuration."
fi


