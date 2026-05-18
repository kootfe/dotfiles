paperctl() {
    mimetype=$(file --mime-type -b "$1")
    case "$mimetype" in
      image/*)
        pkill mpvpaper
        if [[ -z $(pgrep awww-daemon) ]]; then awww-daemon & disown; fi
        awww img $1 --transition-type wave
        ;;
      video/*)
        pkill awww
        mpvpaper -o "loop=inf panscan=1.0" ALL "$1" & disown
        ;;
      *)
        echo "File type $mimetype is not supported for $0"
    esac

}

zz() {
    sel=$(zoxide query --interactive)
    if [[ -z $sel ]]; then return 1; fi
    echo "new dir: $sel"
    cd $sel
}

mkcd() {
    mkdir -pv "$1"
    cd "$1"
}

m() {
    echo "$@" | bc -l
}

bak() {
    [ -z "$1" ] && { echo "Usage: bak file"; return 1; }
    [ ! -f "$1" ] && { echo "File not found: $1"; return 1; }
    if [ -f "$1.bak" ]; then 
        cp "$1.bak" "$1.bak.old"
    fi
    cp "$1" "$1.bak"
}

swbak() {
    [ -z "$1" ] && { echo "Usage: swbak file"; return 1; }
    [ ! -e "$1" ] && { echo "File not found: $1"; return 1; }
    [ ! -e "$1.bak" ] && { echo "No backup?: $1.bak"; return 1; }

    local tmp
    tmp="$1.$$.__swap_tmp__"

    mv -- "$1" "$tmp" || return 1

    mv -- "$1.bak" "$1" || {
        mv -- "$tmp" "$1"
        return 1
    }

    mv -- "$tmp" "$1.bak" || {
        echo "\x1b[31mCRITICAL: rollback needed manually: $tmp\x1b[0m"
        return 1
    }
}

resd() { sudo $(fc -ln -1) }

cx () {
    chmod +x "$1"
}

extract() {
    case "$1" in
        *.tar.gz|*.tgz)     tar xzf "$1" ;;
        *.tar.bz2)          tar xjf "$1" ;;
        *.zip)              unzip "$1"   ;;
        *.7z)               7z x "$1"    ;;
        *.gz)               gunzip "$1"  ;;
        *)                  echo "dunow how to extractk '$1'" ;;
    esac
}

llls() {
local -a patterns=()
    local -a exclude_files=()
    local -a exclude_dirs=()

    # parse arguments
    while [[ $# -gt 0 ]]; do
        case "$1" in
            -f) patterns+=("$2"); shift 2 ;;
            -e) exclude_files+=("$2"); shift 2 ;;
            -de) exclude_dirs+=("$2"); shift 2 ;;
            *) echo "Unknown option: $1"; return 1 ;;
        esac
    done

    # default patterns if none given
    if [[ ${#patterns[@]} -eq 0 ]]; then
        patterns=("*.c" "*.h" "*.js")
    fi

    # build find command
    local find_cmd=(find . -type f)
    
    # add pattern matches
    if [[ ${#patterns[@]} -gt 0 ]]; then
        find_cmd+=("(")
        local first=1
        for pat in "${patterns[@]}"; do
            [[ $first -eq 0 ]] && find_cmd+=(-o)
            find_cmd+=(-name "$pat")
            first=0
        done
        find_cmd+=(")")
    fi

    # add excluded directories
    for dir in "${exclude_dirs[@]}"; do
        find_cmd+=(-not -path "./$dir/*")
    done

    # add excluded files
    for f in "${exclude_files[@]}"; do
        find_cmd+=(-not -name "$f")
    done

    # execute find safely
    while IFS= read -r file; do
        echo "$file"
        cat "$file"
    done < <("${find_cmd[@]}")
}

# i have never used this... not once... still love it... its broken tho it doesnt show title likes descriopton etc... still love it
ytsearch() {
  local query="$1"
  local count="${2:-10}"

  yt-dlp --flat-playlist --print "%(title)s |-| %(uploader)s |-| %(view_count)s |-| %(url)s" \
    "ytsearch${count}:${query}" | \
  fzf --ansi \
      --preview '
        IFS="|-|" read -r title uploader views url <<< "{}"
        yt-dlp --no-playlist --skip-download --print "
Title: %(title)s
Uploader: %(uploader)s
Likes: %(like_count)s
Dislikes: %(dislike_count)s
Views: %(view_count)s
Duration: %(duration)s
URL: %(webpage_url)s
        " "$url"
      ' --preview-window=up:10:wrap | \
  awk -F ' \\|-\\| ' '{print $4}' | \
  xargs -r -d '\n' mpv
}
