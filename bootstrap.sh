#!/usr/bin/env bash
set -e
DIR="/var/www"
WORKING_DIR="/var/www/html"
CONTAINER_STARTED="/var/CONTAINER_STARTED_PLACEHOLDER"
CHEVERETO_INSTALLER_DOWNLOAD="https://github.com/chevereto/installer/releases/download/"
chv_install() {
    rm -rf /chevereto/download
    echo "Making working dir /chevereto/download"
    mkdir -p /chevereto/download
    echo "cd /chevereto/download"
    cd /chevereto/download
    echo "* Downloading chevereto/installer $CHEVERETO_INSTALLER_TAG"
    curl -SOJL "${CHEVERETO_INSTALLER_DOWNLOAD}${CHEVERETO_INSTALLER_TAG}/installer.php"
    echo "* Downloading $CHEVERETO_SOFTWARE $CHEVERETO_TAG"
    php installer.php -a download -t=$CHEVERETO_TAG -l=$CHEVERETO_LICENSE
    echo "* Extracting downloaded file"
    php installer.php -a extract -f chevereto-pkg-*.zip -p $WORKING_DIR
}
chv_provide() {
    echo "* chown www-data: $WORKING_DIR -R"
    chown www-data: $WORKING_DIR -R
    echo "$CHEVERETO_TAG" >$CONTAINER_STARTED
    cd $WORKING_DIR
    echo "[OK] $CHEVERETO_SOFTWARE $CHEVERETO_TAG provisioned"
}
echo $CONTAINER_STARTED
if [ ! -e $CONTAINER_STARTED ]; then
    if [ "$CHEVERETO_TAG" != "dev" ]; then
        chv_install
    fi
    chv_provide
fi
echo "[OK] Started $CHEVERETO_SOFTWARE $CHEVERETO_TAG"
$1
