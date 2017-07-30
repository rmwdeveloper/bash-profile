SSH_ENV=$HOME/.ssh/environment

pdvl_release="17_09"
pdvc_release="17_07" 
pqcc_release="17_06"

alias cd_pdvl="cd ~/RELEASE_$pdvl_release"
alias cd_pdvc="cd ~/RELEASE_$pdvc_release"
alias cd_pqcc="cd ~/RELEASE_$pqcc_release"

alias home="cd ~"
alias cdsscc="cd ~/smartseries/connect/connect-htcweb"
alias cdsuadl="cd ~/smartseries/suadl"

function pdvl() {  
  cd_pdvl
  [[ -n $1 ]] && case "$1" in 
  "i")
      mvn clean install -Pdvl
      ;;
  "c")
      cd connect/connect-htcweb
      ;;
    *)
      echo "Unrecognized command!"
        ;;
  esac
}

function pdvc() {  
  cd_pdvc
  [[ -n $1 ]] && case "$1" in 
  "i")
      mvn clean install -Pdvc
      ;;
  "c")
      cd connect/connect-htcweb
      ;;
    *)
      echo "Unrecognized command!"
        ;;
  esac
}

function pqcc() {  
  cd_pqcc
  [[ -n $1 ]] && case "$1" in 
  "i")
      mvn clean install -Pqcc
      ;;
  "c")
      cd connect/connect-htcweb
      ;;
    *)
      echo "Unrecognized command!"
        ;;
  esac
}


function startScripts() {
  cdsuadl && 
  mvn generate-sources && 
  cdsscc && 
  yarn && 
  devwatch
}

function workon() {
  cdss &&  
  git checkout "$@" &&
  git pull &&
  mvn clean install &&
  startScripts 
}

