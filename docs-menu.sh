#!/bin/bash

sweep_toolchain() {
  ~/src/toolchain/qpkg.py sweep
}

no_toolchain() {
    export PATH=$(echo $PATH | sed "s|/opt/qumulo[^:]*:||g")
}

ignore_warnings() {
    echo -e "\033[1;33mNote: You can ignore any warnings about setting the locale or about GitHub API authentication.\033[0m"
}

ignore_locale() {
    echo -e "\033[1;33mNote: You can ignore any warnings about setting the locale.\033[0m"
}

# Check that the src repository exists
check_docs_internal_repo() {
    if [ ! -d ~/git/docs-internal ]; then
        echo "You must first clone the docs-internal repository to ~/git: https://github.com/Qumulo/docs-internal"
        echo "Exiting..."
        exit 1
    fi
}

# Check that the Vectara Ingest repository exists
check_vectara_ingest_repo() {
    if [ ! -d ~/git/vectara-ingest ]; then
        echo "You must first clone the Vectara Ingest repository to ~/git: https://github.com/Qumulo/vectara-ingest"
        echo "Exiting..."
        exit 1
    fi
}

# Check that the secrets.toml file exists
check_secrets_toml() {
    if [ ! -f ~/git/vectara-ingest/secrets.toml ]; then
        echo "To ingest data into Vectara, you must add secrets.toml to your Vectara Ingest directory"
        echo "and then add your API keys to secrets.toml in the following format:"
        echo
        echo "[general]"
        echo "api = 'vectara_api_value'"
        echo
        echo "[default]"
        echo "api_key=\"<IndexService API Key>\""
        echo
        echo "Exiting..."
        exit 1
    fi
}

# Install Docker and explain group changes
install_docker() {
  if ! command -v docker &> /dev/null; then
    echo "Docker is required for documentation builds. Install Docker? (y/n)"
    read -r answer
    if [ "$answer" = "y" ]; then
      echo "Installing Docker..."
      sudo apt-get update && sudo apt-get install -y docker.io
      sudo usermod -aG docker "$(whoami)"
      sudo service docker start
      echo "For the group change to take effect, you must log out of the system and then log back in."
    elif [ "$answer" = "n" ]; then
      echo "Can't continue without installing Docker. Exiting..."
      exit 1
    fi
  fi
}

# Install Noto Color Emoji required for documentation builds
install_noto_emoji() {
  if ! dpkg -l | grep -qw fonts-noto-color-emoji; then
    echo "fonts-noto-color-emoji is required for documentation builds. Install package? (y/n)"
    read -r answer
    if [ "$answer" = "y" ]; then
      echo "Installing fonts-noto-color-emoji..."
      sudo apt-get update && sudo apt-get install -y fonts-noto-color-emoji
    elif [ "$answer" = "n" ]; then
      echo "Continuing without installing fonts-noto-color-emoji..."
    fi
  fi
}

# Rebuild the docs-builder container
rebuild_container() {
    echo "Rebuilding the docs-builder container..."
    docker build -f docker/build/Dockerfile -t docs-builder .
}

# List CLI documentation with appended content
find_modified_cli(){
  echo "Searching for CLI documentation with manually appended content..."
  local flag_file=$(mktemp)
  find ~/git/docs-internal/qq-cli-command-guide -type f -name "*.md" | while IFS= read -r file; do
    start_line=$(grep -n -- '---' "$file" | sed '2q;d' | cut -d: -f1)
    if [ ! -z "$start_line" ]; then
        content=$(tail -n +$((start_line + 1)) "$file" | awk 'NF {if(count<5)print; count++} END {if(count>=5) print "..."}')
        if [[ $content =~ [^[:space:]] ]]; then
            # File found, delete the flag file
            rm -f "$flag_file"
            echo -e "\033[0;31m$file\033[0m"
            echo "$content"
            echo
        fi
    fi
  done
  if [ -f "$flag_file" ]; then
    echo "Can't find files with manually appended content."
    # Clean up the flag file
    rm -f "$flag_file"
  fi
}

# Function to check for the src repository
check_src_repo() {
    if [ ! -d ~/src ]; then
        echo "You must first clone the Vectara Ingest repository: https://qumulo.atlassian.net/wiki/spaces/EN/pages/1167851855/Manually+Checking+Out+Source"
        exit 1
    fi
}

# Regenerate CLI documentation
regen_cli_docs() {
    check_src_repo
    while true; do
        read -p "Generate the current (c) or future (f) version of the CLI docs? " version_choice
        if [ "$version_choice" = "c" ]; then
            echo "Regenerating current CLI documentation from default branch..."
            cd ~/src && hg up default && hg fetch && ./tools/extract_cli_help.py --base-dir ~/git/docs-internal && cd -
            break
        elif [ "$version_choice" = "f" ]; then
            while true; do
                read -p "Enter the Qumulo Core release number in N.N.N format (for example, 7.1.2): " version_number
                if [[ $version_number =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
                    echo "Regenerating CLI documentation from release-$version_number branch..."
                    cd ~/src && hg up default && hg fetch && hg up release-$version_number && ./tools/extract_cli_help.py --base-dir ~/git/docs-internal && cd -
                    break 2
                else
                    echo "Enter a release version in the N.N.N format, where N is a number."
                fi
            done
        else
            echo "Invalid choice. Enter 'c' for the current version or 'f' for a future version."
        fi
    done
}

# Regenerate API documentation
regen_api_docs() {
    check_src_repo
    echo "Building API documentation from the Music cluster..."
    python3 gen-api.py
}

# Build HTML documentation by using Jekyll
build_html_docs() {
    echo "Building HTML documentation..."
    ignore_warnings
    docker run --rm --user $(id -u):$(id -g) --name docs-container-build -v $(pwd):/src:rw docs-builder
}

# Build PDF documentation by using Jekyll and PrinceXML
build_pdf_docs() {
    echo "Building PDF documentation..."
    ./pdf-build.sh
}

# Build the documentation and serve it locally on port 4000 by using http.server
build_serve_docs_locally_python() {
    echo "Building documentation and serving it locally on port 4000 by using http.server..."
    ignore_warnings
    docker run --rm --user $(id -u):$(id -g) --name docs-container-build -v $(pwd):/src:rw docs-builder && cd _site && python3 -m http.server 4000 && cd ..
}

# Only serve the documenttion locally on port 4000 by using http.server
only_serve_docs_locally_python() {
    echo "Serving documentation locally on port 4000 by using http.server..."
    cd _site && python3 -m http.server 4000 && cd ..
}

# Build the documentation and serve it locally on port 4000 by using Jekyll LiveReload
build_serve_docs_locally_jekyll() {
    echo "Building documentation and serving it locally by using Jekyll LiveReload..."
    ignore_warnings
    docker run -ti --rm --user $(id -u):$(id -g) --name docs-container-serve -v $(pwd):/src:rw -P --network host docs-builder serve
}

# Check documentation for link, script, and image errors by using HTML Proofer
check_docs_errors() {
    echo "Checking documentation for link, script, and image errors..."
    ignore_locale
    docker run --rm --user $(id -u):$(id -g) --name docs-container-check -v $(pwd):/src:rw docs-builder check
}

# Check documentation for spelling errors by using Hunspell
check_spelling_errors() {
    echo "Checking documentation for spelling errors..."
    ignore_locale
    docker run --rm --user $(id -u):$(id -g) --name docs-container-proof -v $(pwd):/src:rw docs-builder proof
}

# Ingest documentation
ingest_documentation() {
    local yaml_file="$1"
    if [ -z "$yaml_file" ]; then
        echo "You must specify a YAML file."
        exit 1
    fi
    cd ~/git/vectara-ingest && ./run.sh "config/$yaml_file" default && cd -
}

# Ingest docs.qumulo.com into Vectara corpus 2
ingest_docs_portal() {
    echo "Ingesting docs.qumulo.com into Vectara corpus 2..."
    no_toolchain
    check_vectara_ingest_repo
    check_secrets_toml
    ingest_documentation "qumulo-documentation-portal-v3.yaml"
}

# Ingest care.qumulo.com into Vectara corpus 4
ingest_care_portal() {
    echo "Ingesting cqre.qumulo.com into Vectara..."
    no_toolchain
    check_vectara_ingest_repo
    check_secrets_toml
    ingest_documentation "qumulo-care-v4.yaml"
}

# Ingest qumulo.com into Vectara corpus 5
ingest_corp_site() {
    echo "Ingesting docs.qumulo.com into Vectara..."
    no_toolchain
    check_vectara_ingest_repo
    check_secrets_toml
    ingest_documentation "qumulo-main-v3.yaml"
}

# Check ingestion status
check_ingestion_status() {
    docker logs -f vingest
}

# Find unused scripts
find_unused_scripts() {
 # Navigate to the js/ directory relative to the current directory
    cd "$(dirname "$0")/js" || { echo "js directory not found"; return 1; }

    # Get the list of .js files in the js/ directory
    js_files=$(find . -name "*.js")

    # Initialize an array to hold unused scripts
    unused_scripts=()

    # Go up a level to the parent directory
    cd ..

    # Loop through each .js file and check if it is used in the parent directory
    for js_file in $js_files; do
        js_file_name=$(basename "$js_file")
        # Search for occurrences of the .js file in various contexts
        usage=$(grep -rE "(src=['\"].*\/$js_file_name['\"]|$js_file_name)" . 2>/dev/null)

        if [ -z "$usage" ]; then
            unused_scripts+=("$js_file_name")
        fi
    done

    # Report back the names of unused scripts
    if [ ${#unused_scripts[@]} -eq 0 ]; then
        echo "All scripts are used."
    else
        echo "Unused scripts:"
        for script in "${unused_scripts[@]}"; do
            echo "$script"
        done
    fi
}

check_docs_internal_repo
install_docker
install_noto_emoji

while true; do
    echo
    echo -e "\033[1;33m🤖 Welcome to the Documentation Portal Repository\033[0m"
    echo
    echo "1.  🚧 Rebuild docs-builder container"
    echo "2.  ⚙️  Regenerate CLI documentation"
    echo "3.  ⚙️  Regenerate API documentation"
    echo "4.  🆕 List CLI documentation with appended content"
    echo "5.  ⚙️  Build HTML documentation"
    echo "6.  ⚙️  Build PDF documentation"
    echo "7.  🖥️  Only serve HTML documentation locally"
    echo "8.  🖥️  Build documentation and serve it locally"
    echo "9.  🖥️  Build documentation and serve it locally with LiveReload (can be unstable)"
    echo "10. 📋 Check documentation for link, script, and image errors"
    echo "11. 📋 Check documentation for spelling errors"
    echo "12. 🧹 Sweep Toolchain"
    echo "13. 🔍 Ingest docs.qumulo.com into Vectara"
    echo "14. 🔍 Ingest care.qumulo.com into Vectara"
    echo "15. 🔍 Ingest qumulo.com into Vectara"
    echo "16. 📋 Check ingestion status"
    echo "17. ❌ Find unused .js scripts"
    echo "q.  👋 Quit"
    echo
    read -p $'\033[1;33mWhat would you like to do? \033[0m' choice

    case $choice in
        1) rebuild_container ;;
        2) regen_cli_docs ;;
        3) regen_api_docs ;;
        4) find_modified_cli ;;
        5) build_html_docs ;;
        6) build_pdf_docs ;;
        7) only_serve_docs_locally_python ;;
        8) build_serve_docs_locally_python ;;
        9) build_serve_docs_locally_jekyll ;;
        10) check_docs_errors ;;
        11) check_spelling_errors ;;
        12) sweep_toolchain ;;
        13) ingest_docs_portal ;;
        14) ingest_care_portal ;;
        15) ingest_corp_site ;;
        16) check_ingestion_status ;;
        17) find_unused_scripts ;;
        q) exit ;;
        *) echo "You must enter a valid option." ;;
    esac
done
