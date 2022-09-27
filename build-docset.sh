#!/bin/bash

DOCS_URL="https://docs.snowflake.com/en"
VENV=".venv"
OUT="out"
RELEASE_VERSION="${RELEASE_VERSION:-not-versioned}"

# Create virtual environment if it doesn't exist
if [ ! -d "${VENV}" ]; then
    python3 -m venv "${VENV}"
    python3 -m pip install -r requirements.txt
fi

# Activate virtual environment
source "${VENV}/bin/activate"

# Start from a clean state
rm -rf "${OUT}"
mkdir "${OUT}"

# Download Snowflake documentation
cd "${OUT}"
wget -nH --cut-dirs=1 -r --no-parent "${DOCS_URL}"
wget "${DOCS_URL}/objects.inv"
wget "${DOCS_URL}/_static/favicon-32x32.png"
cd ..

# Build docset
doc2dash --version
doc2dash -n Snowflake -i "${OUT}/favicon-32x32.png" "${OUT}"

# Compress docset
tar -czf Snowflake.docset.tgz Snowflake.docset

# Build XML Feed
cat > Snowflake.xml <<EOF
<entry>
  <version>${RELEASE_VERSION}</version>
  <url>https://github.com/matthieucan/snowflake-docset/releases/download/${RELEASE_VERSION}/Snowflake.docset.tgz</url>
</entry>
EOF
