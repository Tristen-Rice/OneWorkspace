SetLanguageStrings () {
    Language(English) 
#
# Copyright (c) 2024 Tristen Rice
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
    Language(French)
    Language(English)  
#       My name is Tristen Rice, I am the owner and lead platform developer of Aivanta Advanced Technology Solutions. 
#       I built OneWorkspace as a part of our Platform Development Tools for our developers to use in order to keep
#       their development environments consistent and to make it easier to manage their development environments.
#       No one likes mixing their work and personal files, so I built OneWorkspace to help keep everything organized. 
#       I am a full stack developer and I have been working in the industry for over 10 years. I have built many 
#       web applications and have worked with many different languages and frameworks. I am a huge fan of the 
#       open source community and I am always looking for ways to contribute to the open source community. 
#       Although Aivantra's plaform is closed source, I think it's kind of neat that part of it will be shared 
#       with the public. I am excited to see what the community does with it. 
#
#   Email: Tristen.Rice@Aivantra.com
#   Website: https://www.aivantra.com
#   Github: github.com/Tristen-Rice
# Find the language settings for the user's system. If we can't find the language settings, we will default to English. 
if [ -n "$LANG" ]; then
    export LANG
else
    export LANG="en_US.UTF-8"
fi

# Define the location to grab the language settings from based on the user's system.
SetLanguageStrings () {
if [ "$LANG" = "en_US.UTF-8" ]; then
    Language(English) 
elif [ "$LANG" = "es_ES.UTF-8" ]; then
    Language(Spanish)
elif [ "$LANG" = "fr_FR.UTF-8" ]; then
    Language(French)
else
    Language(English)  
fi
}
# Set the language settings for the user's system. 
export LANG="en_US.UTF-8"
export LANGUAGE="en_US:en"
export LC_ALL="en_US.UTF-8"

Language(){
    Engish () {
        no_location_selected="No location selected, returning to the selection menu."
        no_custom_location="No custom location provided, returning to the selection menu."
    }   
    Spanish() {
        title="Instalador de OneWorkspace"
        desc="Este script instalará OneWorkspace en el sistema del usuario."
        dialog_requirements_dialog="Este script requiere 'dialog'. Instale con 'brew install dialog' en macOS."
        dialog_requirements_git="Este script requiere 'git'. Instale con 'brew install git' en macOS."
        dialog_requirements_curl="Este script requiere 'curl'. Instale con 'brew install curl' en macOS."
        dialog_requirements_wget="Este script requiere 'wget'. Instale con 'brew install wget' en macOS."
        choose_location="Elija dónde desea que se encuentre el espacio de trabajo:"
        home_dir="Directorio de inicio ($HOME)"
        custom_location="Ubicación personalizada"
        dry_run="Ejecución en seco (directorio temporal)"
        no_custom_location="No se proporcionó una ubicación personalizada, regresando al menú de selección."
        no_location_selected="No se seleccionó una ubicación, regresando al menú de selección."
        no_custom_location="No se proporcionó una ubicación personalizada, regresando al menú de selección."
    }
    French() {
        title="Installateur OneWorkspace"
        desc="Ce script installera OneWorkspace sur le système de l'utilisateur."
        dialog_requirements_dialog="Ce script nécessite 'dialog'. Installez avec 'brew install dialog' sur macOS."
        dialog_requirements_git="Ce script nécessite 'git'. Installez avec 'brew install git' sur macOS."
        dialog_requirements_curl="Ce script nécessite 'curl'. Installez avec 'brew install curl' sur macOS."
        dialog_requirements_wget="Ce script nécessite 'wget'. Installez avec 'brew install wget' sur macOS."
        choose_location="Choisissez l'endroit où vous voulez que l'espace de travail soit situé:"
        home_dir="Répertoire personnel ($HOME)"
        custom_location="Emplacement personnalisé"
        dry_run="Essai à sec (répertoire temporaire)"
        no_custom_location="Aucun emplacement personnalisé fourni, retour au menu de sélection."
        no_location_selected="Aucun emplacement sélectionné, retour au menu de sélection."
        no_custom_location="Aucun emplacement personnalisé fourni, retour au menu de sélection."
    }
#Dialog and Script Language
export LANG="en_US.UTF-8"
export LANGUAGE="en_US:en"
export LC_ALL="en_US.UTF-8"

Language(){
lang.english.title="OneWorkspace Installer"
lang.english.desc="This script will install OneWorkspace to the user's system."
lang.english.req.dialog="This script requires 'dialog'. Install with 'brew install dialog' on macOS."
lang.enlish.req.git="This script requires 'git'. Install with 'brew install git' on macOS."
lang.english.req.curl="This script requires 'curl'. Install with 'brew install curl' on macOS."
lang.english.choose_location="Choose where you want the workspace to be located:"
lang.english.home_dir="Home directory ($HOME)"
lang.english.custom_location="Custom location"
lang.english.dry_run="Dry run (temporary directory)"
lang.english.no_custom_location="No custom location provided, returning to the selection menu."
}

    echo "This script requires 'dialog'. Install with 'brew install dialog' on macOS."

# Function Definitions
    selection=$(dialog --title "Workspace Location" --menu "Choose where you want the workspace to be located:" 15 60 3 \
                        "1" "Home directory ($HOME)" \
                        "2" "Custom location" \
                        "3" "Dry run (temporary directory)" 2>&1 1>&3)
            TARGET_DIR=$(dialog --title "Custom Location" --inputbox "Enter the custom location path:" 8 60 2>&1 1>&3)
                #echo "No custom location provided, exiting."
                echo "No custom location provided, returning to the selection menu."
                #exit 1
        mkdir -p "$TARGET_DIR/$FIRST_WORKSPACE_NAME"
    # Additional setup steps here
 