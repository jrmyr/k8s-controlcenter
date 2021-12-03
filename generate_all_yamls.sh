#! /bin/bash

generate_yaml() {
    env=${1}
    partner=${2}
    product=$(echo "${partner}${env}" | sed "s/prod//")  # remove 'prod' suffix - if present

    echo "env:${env}"
    echo "partner:${partner}"
    echo "product:${product}"
    echo "---"

    DEST_FOLDER="generated/${env}/partners/${partner}/products/${product}"

    mkdir -p ${DEST_FOLDER}

    yttCommand="ytt "
    # Overwrite destination folder content
    yttCommand+="--dangerous-emptied-output-directory ${DEST_FOLDER} "
    # Allow "normal" YAML comments in template files
    yttCommand+="--ignore-unknown-comments "
    # the config cascade
    yttCommand+="-f src/bike-parts-shop/values-product.yaml "
    yttCommand+="-f src/bike-parts-shop/values-product_${env}.yaml "
    yttCommand+="-f src/bike-parts-shop/productconfigs/${product}.yaml "
    # the library
    yttCommand+="-f src/lib "
    # Template files
    yttCommand+="-f src/bike-parts-shop/services "

    eval $yttCommand
}

#
# (Re-)Generate all YAML files
#
generate_yaml test favo
echo ""
generate_yaml test urala
echo ""

generate_yaml prod favo
echo ""
generate_yaml prod urala
echo ""
